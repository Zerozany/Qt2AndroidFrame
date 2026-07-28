#include "ApplicationConfig.h"

ApplicationConfig::ApplicationConfig(ApplicationConfigBase* _parent) : ApplicationConfigBase{_parent}
{
}

auto ApplicationConfig::instance() noexcept -> ApplicationConfig*
{
    static ApplicationConfig applicationConfig{};
    return &applicationConfig;
}

auto ApplicationConfig::init() noexcept -> void
{
    std::invoke(&ApplicationConfig::initAppStyle, this, m_applicationStyle);
    // std::invoke(&ApplicationConfigBase::initAppAttribute, this);
    // std::invoke(&ApplicationConfigBase::initAppEnv, this);
}
