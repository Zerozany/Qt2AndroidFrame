package com.sonixbeauty.activity;

import android.content.Context;
import android.os.Bundle;
import android.os.PowerManager;
import android.util.Log;
import android.view.WindowManager;

public class AppActivity extends org.qtproject.qt.android.bindings.QtActivity {

    private static final String TAG = "SonixBeauty";
    private PowerManager.WakeLock wakeLock;

    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        Log.i(TAG, "[AppActivity::onCreate] Start");
    }

    @Override
    public void onResume()
    {
        Log.i(TAG, "[AppActivity::onResume]");

        super.onResume();
    }

    @Override
    public void onPause()
    {
        Log.i(TAG, "[AppActivity::onPause]");
        super.onPause();
    }

    @Override
    public void onDestroy()
    {
        Log.i(TAG, "[AppActivity::onDestroy]");

        super.onDestroy();
    }
}
