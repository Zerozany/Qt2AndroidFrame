_Pragma("once");
#include "ApplicationConfigBase.h"

class ApplicationConfig : public ApplicationConfigBase
{
    Q_OBJECT
public:
    static auto instance() noexcept -> ApplicationConfig*;

    ~ApplicationConfig() noexcept = default;

    Q_DISABLE_COPY_MOVE(ApplicationConfig)

public:
    auto init() noexcept -> void;

private:
    explicit(true) ApplicationConfig(ApplicationConfigBase* _parent = nullptr);

private:
    ApplicationStyle m_applicationStyle{
        .WindowsStyle{"Material"},
        .AndroidStyle{"Material"},
    };
};
