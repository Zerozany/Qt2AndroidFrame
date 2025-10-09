#include "SystemConfig.h"
#include <QQuickStyle>
#include <QCoreApplication>
#include <QDir>

SystemConfig::SystemConfig(QObject* _parent) : QObject{_parent}
{
    std::invoke(&SystemConfig::setAppStyle, this);
    std::invoke(&SystemConfig::setAppEnv, this);
}

auto SystemConfig::setAppStyle() noexcept -> void
{
#if defined(Q_OS_ANDROID)
    QQuickStyle::setStyle("Material");
#else
    QQuickStyle::setStyle("Default");
#endif
}

auto SystemConfig::setAppEnv() noexcept -> void
{
    qputenv("QSG_RENDER_LOOP", "basic");
    qputenv("QSG_RENDER_CONTINUOUSLY", "0");
#if defined(Q_OS_ANDROID)

#elif defined(Q_OS_WIN)
    qputenv("XDG_CACHE_HOME", QDir(QCoreApplication::applicationDirPath()).filePath("tmp").toUtf8());
#endif
}
