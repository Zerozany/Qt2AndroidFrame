#include "SystemConfig.h"
#include <QQuickStyle>
#include <QGuiApplication>
#include <QDir>

SystemConfig::SystemConfig(QObject* _parent) : QObject{_parent}
{
    std::invoke(&SystemConfig::setAppEnv, this);
    std::invoke(&SystemConfig::setAppStyle, this);
    std::invoke(&SystemConfig::setAppAttribute, this);
}

auto SystemConfig::setAppEnv() noexcept -> void
{
    qputenv("QSG_RENDER_LOOP", "basic");
    qputenv("QSG_RENDER_CONTINUOUSLY", "0");
}

auto SystemConfig::setAppStyle() noexcept -> void
{
#if defined(Q_OS_ANDROID)
    QQuickStyle::setStyle("Material");
#else
    QQuickStyle::setStyle("Default");
#endif
}

auto SystemConfig::setAppAttribute() noexcept -> void
{
#if !defined(Q_OS_ANDROID)
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication::setAttribute(Qt::AA_UseSoftwareOpenGL);
#endif
    QGuiApplication::setAttribute(Qt::AA_CompressHighFrequencyEvents);
}
