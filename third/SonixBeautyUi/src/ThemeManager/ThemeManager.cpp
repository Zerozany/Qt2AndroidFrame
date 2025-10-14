#include "ThemeManager.h"
#include <QJSEngine>
#include <QQmlEngine>

QVariantMap ThemeManager::currentTheme() const
{
    return m_currentTheme;
}

void ThemeManager::setCurrentTheme(const QVariantMap& _currentTheme)
{
    if (m_currentTheme == _currentTheme)
    {
        return;
    }
    m_currentTheme = _currentTheme;
    Q_EMIT this->currentThemeChanged();
}

Q_INVOKABLE QString ThemeManager::fontFamily() const
{
    return m_fontFamily;
}

Q_INVOKABLE void ThemeManager::setFontFamily(const QString& _fontFamily)
{
    if (m_fontFamily == _fontFamily)
    {
        return;
    }
    m_fontFamily = _fontFamily;
    Q_EMIT this->fontFamilyChanged();
}

ThemeManager* ThemeManager::create(QQmlEngine*, QJSEngine*)
{
    static ThemeManager themeManager{};
    return &themeManager;
}

ThemeManager::ThemeManager(QObject* _parent) : QObject{_parent}
{
}
