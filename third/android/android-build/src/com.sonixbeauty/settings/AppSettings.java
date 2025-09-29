package com.sonixbeauty.settings;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import android.view.Window;
import android.view.WindowManager;

public class AppSettings {
    private Activity m_activity;
    private static final String TAG = "SonixBeauty"; // 全局统一 TAG

    public AppSettings(Activity _activity)
    {
        init(_activity);
    }

    private void init(Activity _activity)
    {
        this.m_activity = _activity;
    }

    public void setScreenBrightness(final float brightness)
    {
        m_activity.runOnUiThread(new Runnable() {
            @Override
            public void run()
            {
                Window window = m_activity.getWindow();
                if (window == null) {
                    return;
                }
                WindowManager.LayoutParams layoutParams = window.getAttributes();
                if (layoutParams == null) {
                    return;
                }
                layoutParams.screenBrightness = brightness; // 0~1
                window.setAttributes(layoutParams);
            }
        });
    }
}
