local ConsoleLog = {}
local gpu = require('component').gpu
local libInfo = {
  version = "1.0.0",
  author = "zayats",
  changelog = ""
}

local colors = {
  background = gpu.getForeground(),
  info = 0x32CD32,
  warn = 0xFFA500,
  error = 0xFF0000,
  start = 0xCD853F
}
-----------------------------------------------------------------------------------------------------
function ConsoleLog.init()
  gpu.setForeground(colors.start)
  print("Console Log Lib initialize")
  os.sleep(1)
  print("Author ", libInfo.author, "\nVersion ", libInfo.version, "Last ChangeLog ", libInfo.changelog)
  gpu.setForeground(colors.foreground)
end

function ConsoleLog.infoLog(text)
  gpu.setForeground(colors.info)
  print("[INFO]", text)
  gpu.setForeground(colors.background)
end

function ConsoleLog.warnLog(text)
  gpu.setForeground(colors.warn)
  print("[WARN]", text)
  gpu.setForeground(colors.background)
end

function ConsoleLog.errorLog(text)
  gpu.setForeground(colors.error)
  print("[ERROR]", text)
  gpu.setForeground(colors.background)
end
return ConsoleLog

