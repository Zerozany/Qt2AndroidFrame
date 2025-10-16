_Pragma("once");
#include <QObject>
#include <memory>
#include <spdlog/spdlog.h>

class Logger : public QObject
{
    Q_OBJECT
public:
    explicit(true) Logger(QObject* _parent = nullptr);
    ~Logger() noexcept = default;

public:
    inline static std::shared_ptr<spdlog::logger> fileLogger{nullptr};
};
