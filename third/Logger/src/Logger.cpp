#include "Logger.h"

#include <spdlog/sinks/basic_file_sink.h>
#include <spdlog/sinks/stdout_color_sinks.h>

Logger::Logger()
{
    // fileLogger = spdlog::basic_logger_mt("FileLogger", QDir{QStandardPaths::writableLocation(QStandardPaths::AppDataLocation)}.filePath("log/file-log.txt").toStdString());
    fileLogger = spdlog::basic_logger_mt("FileLogger", "log/file-log.txt");
    fileLogger->set_level(spdlog::level::debug);
    fileLogger->sinks().push_back(std::make_shared<spdlog::sinks::stdout_color_sink_mt>());
    fileLogger.get()->warn("in {} Hello", __func__);
}
