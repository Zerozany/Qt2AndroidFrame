#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QTimer>
#include <QQuickStyle>

int main(int argc, char* argv[])
{
    qputenv("QSG_RENDER_LOOP", "basic");  // 禁止 threaded 渲染循环（关键）
    qputenv("QSG_RENDER_CONTINUOUSLY", "0");

    QGuiApplication app(argc, argv);
#if defined(ANDROID)
    QQuickStyle::setStyle("Material");
#endif

    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:/");
    engine.load(QUrl("qrc:/App/view/Main.qml"));

    if (engine.rootObjects().isEmpty())
        return -1;

    QQuickWindow* window = qobject_cast<QQuickWindow*>(engine.rootObjects().first());

    // 🔸 保留上下文和场景图
    window->setPersistentSceneGraph(true);
    window->setPersistentGraphics(true);

    QObject::connect(&app, &QGuiApplication::applicationStateChanged, [&engine, &window](Qt::ApplicationState state) {
        if (state == Qt::ApplicationActive)
        {
            qDebug() << "App active → wait for surface ready";
            QTimer::singleShot(500, [window]() {
                if (window && window->isSceneGraphInitialized())
                {
                    qDebug() << "Surface ready, show window";
                    window->show();
                }
                else
                {
                    qDebug() << "Surface still invalid, delay more";
                    QTimer::singleShot(300, [window]() {
                        if (window && window->isSceneGraphInitialized())
                        {
                            window->show();
                        }
                    });
                }
            });
        }
        else
        {
            qDebug() << "App background → hide window";
            window->hide();
        }
    });

    return app.exec();
}
