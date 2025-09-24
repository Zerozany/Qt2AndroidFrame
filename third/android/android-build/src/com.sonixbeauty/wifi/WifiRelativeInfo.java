package com.sonixbeauty.wifi;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.util.Log;
import androidx.core.app.ActivityCompat;

public class WifiRelativeInfo {
  private final Activity activity;
  private final int REQUEST_LOCATION_PERMISSION = 1001;

  public WifiRelativeInfo(Activity activity) {
    this.activity = activity;
  }

  /** 获取当前 WiFi SSID，如果没有权限会自动请求权限 */
  public String getCurrentWifiSSID() {
    if (!hasLocationPermission()) {
      requestLocationPermission();
      return "Requesting location permission...";
    }

    try {
      ConnectivityManager cm =
          (ConnectivityManager) activity.getSystemService(Context.CONNECTIVITY_SERVICE);
      if (cm == null)
        return "ConnectivityManager is null";

      Network network = cm.getActiveNetwork();
      if (network == null)
        return "No active network";

      NetworkCapabilities capabilities = cm.getNetworkCapabilities(network);
      if (capabilities == null || !capabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI)) {
        return "Not connected to WiFi";
      }

      WifiManager wifiManager =
          (WifiManager) activity.getApplicationContext().getSystemService(Context.WIFI_SERVICE);
      if (wifiManager == null)
        return "WifiManager is null";

      @SuppressWarnings("deprecation") WifiInfo wifiInfo = wifiManager.getConnectionInfo();
      if (wifiInfo == null)
        return "WifiInfo is null";

      String ssid = wifiInfo.getSSID();
      if (ssid == null || ssid.isEmpty())
        return "SSID is empty";

      // 去掉双引号
      if (ssid.startsWith("\"") && ssid.endsWith("\"")) {
        ssid = ssid.substring(1, ssid.length() - 1);
      }

      Log.d("WifiRelativeInfo", "Current SSID: " + ssid);
      return ssid;
    } catch (Exception e) {
      Log.e("WifiRelativeInfo", "getCurrentWifiSSID error", e);
      return "Error: " + e.getMessage();
    }
  }

  /** 检查是否有位置权限 */
  private boolean hasLocationPermission() {
    return ActivityCompat.checkSelfPermission(activity, Manifest.permission.ACCESS_FINE_LOCATION)
        == PackageManager.PERMISSION_GRANTED;
  }

  /** 请求位置权限 */
  private void requestLocationPermission() {
    ActivityCompat.requestPermissions(activity,
        new String[] {Manifest.permission.ACCESS_FINE_LOCATION}, REQUEST_LOCATION_PERMISSION);
    Log.d("WifiRelativeInfo", "Requesting location permission...");
  }
}
