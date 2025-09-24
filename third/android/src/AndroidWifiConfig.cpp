#include "AndroidWifiConfig.h"

#if defined(ANDROID)
#include <QJniObject>
#include <QJniEnvironment>
#include <QDebug>
#include <QCoreApplication>

QString callJavaPrintMessage()
{
    // 获取 Android Activity
    auto androidApp{QCoreApplication::instance()->nativeInterface<QNativeInterface::QAndroidApplication>()};
    if (!androidApp)
    {
        qDebug() << "Failed to get QAndroidApplication";
        return QString();
    }

    QJniObject activity{androidApp->context()};
    if (!activity.isValid())
    {
        qDebug() << "Failed to get Activity context";
        return QString();
    }

    QJniObject helper{"com/sonixbeauty/wifi/WifiRelativeInfo",
                      "(Landroid/app/Activity;)V",
                      activity.object<jobject>()};
    if (!helper.isValid())
    {
        qDebug() << "Cannot create Java helper instance";
        return QString();
    }

    QJniObject jstr{helper.callObjectMethod("getCurrentWifiSSID", "()Ljava/lang/String;")};
    return jstr.isValid() ? jstr.toString() : QString();
}
#endif

AndroidWifiConfig::AndroidWifiConfig()
{
#if defined(ANDROID)
    qDebug() << "SSID:" << callJavaPrintMessage();
#endif
}

AndroidWifiConfig::~AndroidWifiConfig()
{
}
