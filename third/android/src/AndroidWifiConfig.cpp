#include "AndroidWifiConfig.h"

#if defined(ANDROID)
#include <QJniObject>
#include <QJniEnvironment>
#include <QDebug>

void callJavaPrintMessage()
{
    // 创建 Java 对象
    QJniObject helper("com/sonix/wifi/WifiHelper");
    if (!helper.isValid())
    {
        qDebug() << "Cannot create Java helper instance";
        return;
    }

    // 调用实例方法 getMessage，签名 ()Ljava/lang/String;
    QJniObject jstr = helper.callObjectMethod(
        "getMessage",
        "()Ljava/lang/String;");

    if (jstr.isValid())
    {
        QString msg = jstr.toString();
        qDebug() << "Java message:" << msg;
    }
    else
    {
        qDebug() << "Failed to get Java string";
    }
}

#endif

AndroidWifiConfig::AndroidWifiConfig()
{
#if defined(ANDROID)
    callJavaPrintMessage();
#endif
}

AndroidWifiConfig::~AndroidWifiConfig()
{
}
