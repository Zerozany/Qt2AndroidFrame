_Pragma("once");
#include <QVariantMap>
#include <QColor>

namespace Themes
{
    inline QVariantMap lightTheme{
        {"backgroundColor", QColor{"#f0efee"}},
        {"textColor", QColor{"#0e0d0d"}},
        {"textColorPressed", QColor{"#cdcdcd"}},
        {"buttonColor", QColor{"#FFFFFF"}},
        {"buttonRadius", 6},
    };

    inline QVariantMap darkTheme{
        {"backgroundColor", QColor{"#f23fee"}},
        {"textColor", QColor{"#0e0d0d"}},
        {"textColorPressed", QColor{"#2dcdcd"}},
        {"buttonColor", QColor{"#FF22FF"}},
        {"buttonRadius", 6},
    };

    inline QVariantMap fontFamilys{
        {"zh_CW", "微软雅黑"},
        {"en_US", "Arial"},
    };

}  // namespace Themes
