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
    qputenv("QSG_RENDER_CONTINUOUSLY", "0");
    QGuiApplication app{argc, argv};
#if defined(ANDROID)
    // 强制使用 Material 风格
    QQuickStyle::setStyle("Material");
#endif
    QQmlApplicationEngine engine{};
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed, &app, [] { QCoreApplication::exit(-1); }, Qt::QueuedConnection);
    engine.addImportPath("qrc:/");
    // engine.load(QUrl{"qrc:/App/view/Main.qml"});
    // QQuickWindow* window = qobject_cast<QQuickWindow*>(engine.rootObjects().first());
    QObject::connect(&app, &QGuiApplication::applicationStateChanged,
                     [&engine](Qt::ApplicationState state) {
                         switch (state)
                         {
                             case Qt::ApplicationActive:
                                 qDebug() << "App is in foreground (active)";
                                 // 可以恢复渲染或刷新界面
                                 engine.load(QUrl{"qrc:/App/view/Main.qml"});
                                 break;
                             case Qt::ApplicationSuspended:
                                 qDebug() << "App is in background (suspended)";
                                 // 可以停止渲染、暂停定时器、释放 OpenGL 资源等
                                 if (!engine.rootObjects().isEmpty())
                                 {
                                     for (QObject* obj : engine.rootObjects())
                                     {
                                         // 删除对象，同时 Qt 会自动销毁 QML 层的子对象
                                         obj->deleteLater();
                                     }
                                     engine.rootObjects().clear();
                                 }
                                 break;
                             case Qt::ApplicationInactive:
                                 qDebug() << "App inactive";
                                 if (!engine.rootObjects().isEmpty())
                                 {
                                     for (QObject* obj : engine.rootObjects())
                                     {
                                         // 删除对象，同时 Qt 会自动销毁 QML 层的子对象
                                         obj->deleteLater();
                                     }
                                     engine.rootObjects().clear();
                                 }
                                 break;
                         }
                     });

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
