#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "SystemConfig.h"
#include "ViewEngine.h"
#include "SonixLogger.h"
#include <QDir>
#include <QStandardPaths>

int main(int argc, char* argv[])
{
    SystemConfig          systemConfig{};
    QGuiApplication       app{argc, argv};
    QQmlApplicationEngine engine{};
    ViewEngine            viewEngine{&app, &engine};
    SonixLogger::init(QDir{QStandardPaths::writableLocation(QStandardPaths::AppDataLocation)}.filePath("log/SonixLog_1.txt").toStdString());
    SonixLogger::setLevel(spdlog::level::warn);
    SonixLogger::trace("trace 仅打印，不写入文件");
    SonixLogger::debug("debug 仅打印，不写入文件");
    SonixLogger::info("info 仅打印，不写入文件");
    SonixLogger::warn("warn 会打印 + 写文件");
    SonixLogger::error("error 会打印 + 写文件");
    SonixLogger::critical("critical 会打印 + 写文件");
    return QGuiApplication::exec();
}
