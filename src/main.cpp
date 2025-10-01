#include <QGuiApplication>
#include <QQmlApplicationEngine>

#if defined(ANDROID)
#include <QJniObject>
#include <QJniEnvironment>
#include <QQuickStyle>
#include "AndroidWifiConfig.h"
#include "AndroidSettings.h"
#endif
#include <QQuickWindow>
#include <QTimer>

// #include "WinWifiConfig.h"

int main(int argc, char* argv[])
{
    // qputenv("QT_ANDROID_BACKGROUND_ACTIONS_QUEUE_SIZE", QByteArray("100"));

    // 当窗口不可见时，暂停渲染
    // qputenv("QSG_RENDER_CONTINUOUSLY", "0");
    QGuiApplication app{argc, argv};
#if defined(ANDROID)
    // 强制使用 Material 风格
    QQuickStyle::setStyle("Material");
#endif
    QQmlApplicationEngine engine{};
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed, &app, [] { QCoreApplication::exit(-1); }, Qt::QueuedConnection);
    engine.addImportPath("qrc:/");
    engine.load(QUrl{"qrc:/App/view/Main.qml"});
    // QQuickWindow* window = qobject_cast<QQuickWindow*>(engine.rootObjects().first());

#if defined(ANDROID)
    // AndroidWifiConfig* androidWifiConfig{AndroidWifiConfig::instance()};
    // AndroidSettings* androidSettings{AndroidSettings::instance()};
    // QTimer::singleShot(500, androidSettings, [androidSettings]() {
    //     androidSettings->setScreenBrightness(255);
    // });
#endif
    // WinWifiConfig winWifiConfig{};
    // winWifiConfig.searchWifiDevice();
    return QGuiApplication::exec();
}
