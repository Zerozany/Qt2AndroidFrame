#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QTimer>
#include <QQuickStyle>
#include <QDebug>

namespace
{
    constexpr int kSurfaceCheckDelay = 300;  // 检查间隔(ms)
    constexpr int kInitialDelay      = 500;  // 初始延迟(ms)

    void waitForSurfaceAndShow(QQuickWindow* window)
    {
        if (!window)
            return;

        auto* timer = new QTimer(window);
        timer->setInterval(kSurfaceCheckDelay);

        QObject::connect(timer, &QTimer::timeout, window, [window, timer]() {
            if (!window)
            {
                timer->stop();
                timer->deleteLater();
                return;
            }

            if (window->isSceneGraphInitialized())
            {
                qDebug() << "✅ Surface ready → show window";
                window->show();
                timer->stop();
                timer->deleteLater();
            }
            else
            {
                qDebug() << "⚠️ Surface not ready, waiting...";
            }
        });

        // 启动前先延迟 kInitialDelay 毫秒
        QTimer::singleShot(kInitialDelay, [timer]() { timer->start(); });
    }
}  // namespace

int main(int argc, char* argv[])
{
    qputenv("QSG_RENDER_LOOP", "basic");
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

    auto* window = qobject_cast<QQuickWindow*>(engine.rootObjects().first());
    if (!window)
        return -1;

    window->setPersistentSceneGraph(true);
    window->setPersistentGraphics(true);

    QObject::connect(
        &app, &QGuiApplication::applicationStateChanged,
        [window](Qt::ApplicationState state) {
            switch (state)
            {
                case Qt::ApplicationActive:
                    qDebug() << "📱 App active → wait for surface";
                    waitForSurfaceAndShow(window);
                    break;

                case Qt::ApplicationSuspended:
                case Qt::ApplicationHidden:
                case Qt::ApplicationInactive:
                    qDebug() << "🌙 App background → hide window";
                    if (window)
                        window->hide();
                    break;

                default:
                    break;
            }
        });

    return app.exec();
}
