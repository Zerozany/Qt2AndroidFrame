package com.sonixbeauty.activity;

import android.content.Context;
import android.os.Bundle;
import android.os.PowerManager;
import android.util.Log;
import android.view.WindowManager;

public class AppActivity extends org.qtproject.qt.android.bindings.QtActivity {

    private static final String TAG = "SonixBeauty";

    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        Log.i(TAG, "[AppActivity::onCreate]");
    }

    @Override
    public void onStart()
    {
        // 当应用程序不在前台时
        Log.i(TAG, "[AppActivity::onStart]");
        super.onStart();
    }

    @Override
    public void onResume()
    {
        // 当 Activity 移动到前台时
        Log.i(TAG, "[AppActivity::onResume]");

        super.onResume();
    }

    @Override
    public void onPause()
    {
        // 当应用程序不在前台时
        Log.i(TAG, "[AppActivity::onPause]");

        super.onPause();
    }

    @Override
    public void onStop()
    {
        // 当应用程序不在前台时
        Log.i(TAG, "[AppActivity::onStop]");

        super.onStop();
    }

    @Override
    public void onDestroy()
    {
        Log.i(TAG, "[AppActivity::onDestroy]");

        super.onDestroy();
    }
}
