package com.sonix.wifi;

import android.content.Context;
import android.net.wifi.ScanResult;
import android.net.wifi.WifiManager;
import android.os.Build;
import androidx.annotation.RequiresApi;
import java.util.List;

public class WifiHelper {
  private static WifiHelper instance; // 单例实例
  private WifiManager wifiManager;

  // 私有化构造函数
  private WifiHelper(Context context) {
    wifiManager =
        (WifiManager) context.getApplicationContext().getSystemService(Context.WIFI_SERVICE);
  }

  // 获取单例实例（线程安全）
  public static synchronized WifiHelper getInstance(Context context) {
    if (instance == null) {
      instance = new WifiHelper(context);
    }
    return instance;
  }

  // 刷新 Wi-Fi 扫描
  @RequiresApi(api = Build.VERSION_CODES.M)
  public boolean refreshWifiScan() {
    if (wifiManager == null) {
      return false;
    }
    if (!wifiManager.isWifiEnabled()) {
      wifiManager.setWifiEnabled(true); // 打开 Wi-Fi
    }
    return wifiManager.startScan(); // 发起扫描
  }

  // 获取扫描结果
  public List<ScanResult> getScanResults() {
    if (wifiManager == null) {
      return null;
    }
    return wifiManager.getScanResults();
  }
}
