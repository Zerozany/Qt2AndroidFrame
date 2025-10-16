_Pragma("once");
#include <memory>
#include <spdlog/spdlog.h>

class Logger
{
public:
    explicit(true) Logger();
    ~Logger() noexcept;

public:
    inline static std::shared_ptr<spdlog::logger> fileLogger{nullptr};
};
