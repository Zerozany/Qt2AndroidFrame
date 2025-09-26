package com.sonixbeauty.wifi;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkRequest;
import android.net.wifi.ScanResult;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.net.wifi.WifiNetworkSpecifier;
import android.os.Build;
import android.util.Log;
import androidx.core.app.ActivityCompat;
import java.util.List;

public class WifiRelativeInfo {
    private final Activity activity;
    private final int REQUEST_LOCATION_PERMISSION = 1001;

    public WifiRelativeInfo(Activity activity)
    {
        this.activity = activity;
        requestLocationPermission();
        // 不再弹面板
    }

    // 请求权限
    private void requestLocationPermission()
    {
        if (ActivityCompat.checkSelfPermission(activity, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED || ActivityCompat.checkSelfPermission(activity, Manifest.permission.CHANGE_WIFI_STATE) != PackageManager.PERMISSION_GRANTED) {

            ActivityCompat.requestPermissions(activity,
                new String[] { Manifest.permission.ACCESS_FINE_LOCATION,
                    Manifest.permission.CHANGE_WIFI_STATE },
                REQUEST_LOCATION_PERMISSION);
            Log.d("WifiRelativeInfo", "Requesting location and wifi permissions...");
        }
    }
    // 扫描附近 Wi-Fi
    public String scanAndGetWifiList()
    {
        try {
            WifiManager wifiManager = (WifiManager)activity.getApplicationContext().getSystemService(Context.WIFI_SERVICE);
            if (wifiManager == null)
                return "WifiManager is null";
            if (ActivityCompat.checkSelfPermission(activity, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED)
                return "No location permission";

            boolean success = wifiManager.startScan();
            if (!success)
                return "Wi-Fi scan failed";

            List<ScanResult> scanResults = wifiManager.getScanResults();
            if (scanResults == null || scanResults.isEmpty())
                return "No Wi-Fi networks found";

            StringBuilder sb = new StringBuilder();
            for (ScanResult result : scanResults)
                sb.append(result.SSID).append(" ");
            return sb.toString();

        } catch (Exception e) {
            return "scanAndGetWifiList error: " + e.getMessage();
        }
    }

    // 获取当前 Wi-Fi SSID
    public String getCurrentWifiSSID()
    {
        try {
            WifiManager wifiManager = (WifiManager)activity.getApplicationContext().getSystemService(Context.WIFI_SERVICE);
            if (wifiManager == null)
                return "WifiManager is null";
            @SuppressWarnings("deprecation")
            WifiInfo wifiInfo = wifiManager.getConnectionInfo();
            if (wifiInfo == null)
                return "WifiInfo is null";

            String ssid = wifiInfo.getSSID();
            if (ssid.startsWith("\"") && ssid.endsWith("\""))
                ssid = ssid.substring(1, ssid.length() - 1);
            Log.d("WifiRelativeInfo", "Current SSID: " + ssid);
            return ssid;

        } catch (Exception e) {
            return "getCurrentWifiSSID error: " + e.getMessage();
        }
    }
}
