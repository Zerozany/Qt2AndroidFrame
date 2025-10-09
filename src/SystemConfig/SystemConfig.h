_Pragma("once");
#include <QObject>

class SystemConfig : public QObject
{
    Q_OBJECT
public:
    explicit(true) SystemConfig(QObject* _parent = nullptr);
    ~SystemConfig() noexcept = default;

private:
    auto setAppStyle() noexcept -> void;

    auto setAppEnv() noexcept -> void;
};
