_Pragma("once");
#include <QObject>
#include <QQmlApplicationEngine>
#include <QGuiApplication>

class QQuickWindow;

class ViewEngine : public QObject
{
    Q_OBJECT
public:
    explicit(true) ViewEngine(QGuiApplication* _guiApplication, QQmlApplicationEngine* _qmlApplicationEngine, QObject* _parent = nullptr);
    ~ViewEngine() noexcept = default;

private:
    auto initApplication() noexcept -> void;

    auto initEngine() noexcept -> void;

    auto initWindow() noexcept -> void;

    auto connectSignal2Slot() noexcept -> void;

private:
    QGuiApplication*       m_guiApplication{};
    QQmlApplicationEngine* m_qmlApplicationEngine{nullptr};
    QQuickWindow*          m_quickWindow{nullptr};
};
