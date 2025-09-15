#include <QGuiApplication>
#include <QQmlApplicationEngine>

#if defined(ANDROID)
#include <QJniObject>
#include <QJniEnvironment>
QString getDemoStringFromJava()
{
    // 获取 Qt Activity 上下文
    QJniObject activity = QNativeInterface::QAndroidApplication::context();

    // 调用 Java 静态方法
    QJniObject result = QJniObject::callStaticObjectMethod(
        "org/example/helper/WifiHelper",                  // Java 类路径
        "getDemoString",                                  // 静态方法名
        "(Landroid/content/Context;)Ljava/lang/String;",  // 方法签名
        activity.object<jobject>()                        // 参数
    );

    if (!result.isValid())
    {
        qWarning() << "Failed to call getDemoString()";
        return {};
    }

    return result.toString();
}
#endif

int main(int argc, char* argv[])
{
    QGuiApplication       app{argc, argv};
    QQmlApplicationEngine engine{};
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed, &app, [] { QCoreApplication::exit(-1); }, Qt::QueuedConnection);
    engine.addImportPath("qrc:/");
    engine.load(QUrl{"qrc:/App/view/Main.qml"});
#if defined(ANDROID)
    qDebug() << "Java says:" << getDemoStringFromJava();
#endif

    return QGuiApplication::exec();
}
