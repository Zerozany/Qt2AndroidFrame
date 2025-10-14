_Pragma("once");
#include <QObject>
#include <QtQml/qqmlregistration.h>
#include <QVariantMap>
#include "Themes.hpp"

class QJSEngine;
class QQmlEngine;

class ThemeManager : public QObject
{
    Q_OBJECT
    QML_SINGLETON
    QML_ELEMENT
    Q_PROPERTY(QVariantMap currentTheme READ currentTheme WRITE setCurrentTheme NOTIFY currentThemeChanged);
    Q_PROPERTY(QString fontFamily READ fontFamily WRITE setFontFamily NOTIFY fontFamilyChanged);

public:
    ~ThemeManager() noexcept = default;

    Q_INVOKABLE QVariantMap currentTheme() const;
    Q_INVOKABLE void        setCurrentTheme(const QVariantMap& _currentTheme);

    Q_INVOKABLE QString fontFamily() const;
    Q_INVOKABLE void    setFontFamily(const QString& _fontFamily);

public:
    static ThemeManager* create(QQmlEngine*, QJSEngine*);

private:
    explicit(true) ThemeManager(QObject* _parent = nullptr);

Q_SIGNALS:
    void currentThemeChanged();

    void fontFamilyChanged();

private:
    QVariantMap m_currentTheme{lightTheme};
    QString     m_fontFamily{fontFamilys["en_US"].toString()};
};
