#include <QGuiApplication>
#include <QQmlApplicationEngine>

#if defined(ANDROID)
#include <QJniObject>
#include <QJniEnvironment>
#include <QQuickStyle>
#include "AndroidWifiConfig.h"
#endif

int main(int argc, char* argv[])
{
    QGuiApplication app{argc, argv};
#if defined(ANDROID)
    // 强制使用 Material 风格
    QQuickStyle::setStyle("Material");
#endif

    QQmlApplicationEngine engine{};
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed, &app, [] { QCoreApplication::exit(-1); }, Qt::QueuedConnection);
    engine.addImportPath("qrc:/");
    engine.load(QUrl{"qrc:/App/view/Main.qml"});
#if defined(ANDROID)
    AndroidWifiConfig androidWifiConfig{};
#endif

    return QGuiApplication::exec();
}
