#include <QGuiApplication>
#include <QQmlApplicationEngine>

#if defined(ANDROID)
#include <QJniObject>
#include <QJniEnvironment>
#endif

int main(int argc, char* argv[])
{
    QGuiApplication       app{argc, argv};
    QQmlApplicationEngine engine{};
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed, &app, [] { QCoreApplication::exit(-1); }, Qt::QueuedConnection);
    engine.addImportPath("qrc:/");
    engine.load(QUrl{"qrc:/App/view/Main.qml"});
#if defined(ANDROID)
#endif

    return QGuiApplication::exec();
}
