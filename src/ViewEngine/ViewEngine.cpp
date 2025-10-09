#include "ViewEngine.h"
#include <QQuickWindow>
#include <QTimer>

ViewEngine::ViewEngine(QGuiApplication* _guiApplication, QQmlApplicationEngine* _qmlApplicationEngine, QObject* _parent) : QObject{_parent}, m_guiApplication{_guiApplication}, m_qmlApplicationEngine{_qmlApplicationEngine}
{
    std::invoke(&ViewEngine::initEngine, this);
    std::invoke(&ViewEngine::initWindow, this);
    std::invoke(&ViewEngine::connectSignal2Slot, this);
}

auto ViewEngine::initEngine() noexcept -> void
{
    if (!m_qmlApplicationEngine)
    {
        return;
    }
    m_qmlApplicationEngine->addImportPath("qrc:/");
    m_qmlApplicationEngine->load(QUrl("qrc:/App/view/Main.qml"));
}

auto ViewEngine::initWindow() noexcept -> void
{
    if (m_qmlApplicationEngine->rootObjects().isEmpty())
    {
        return;
    }
    m_quickWindow = qobject_cast<QQuickWindow*>(m_qmlApplicationEngine->rootObjects().first());
    m_quickWindow->setPersistentSceneGraph(true);
    m_quickWindow->setPersistentGraphics(true);
}

auto ViewEngine::connectSignal2Slot() noexcept -> void
{
#if defined(Q_OS_ANDROID)
    connect(m_guiApplication, &QGuiApplication::applicationStateChanged, [this](Qt::ApplicationState _state) {
        switch (_state)
        {
            case Qt::ApplicationActive:
            {
                QTimer::singleShot(800, [this]() {
                    if (m_quickWindow && m_quickWindow->isSceneGraphInitialized())
                    {
                        m_quickWindow->show();
                        qDebug() << "Surface ready, show window";
                    }
                });
                break;
            }
            case Qt::ApplicationHidden:
            {
                [[fallthrough]];
            }
            case Qt::ApplicationInactive:
            {
                [[fallthrough]];
            }
            case Qt::ApplicationSuspended:
            {
                m_quickWindow->hide();
                qDebug() << "App background → hide window";
                break;
            }
            default:
            {
                std::unreachable();
            }
        }
    });
#endif
}
