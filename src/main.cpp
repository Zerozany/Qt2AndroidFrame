#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "SystemConfig.h"
#include "ViewEngine.h"

int main(int argc, char* argv[])
{
    SystemConfig          systemConfig{};
    QGuiApplication       app{argc, argv};
    QQmlApplicationEngine engine{};
    ViewEngine            viewEngine{&app, &engine};
    return QGuiApplication::exec();
}
