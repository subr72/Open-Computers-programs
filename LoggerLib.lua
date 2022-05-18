local ConsoleLog = {}
local gpu = require('component').gpu
local libInfo = {
  version = "1.0.0",
  author = "zayats",
  changelog = " "
}
w, h = gpu.getResolution()

local colors = {
  white = 0xFFFFFF,
  info = 0x32CD32,
  warn = 0xFFA500,
  error = 0xFF0000,
  start = 0xCD853F
}

function ConsoleLog.init()
  gpu.setForeground(colors.start)
  print("Console Log Lib initialize")
  print("Author ", libInfo.author, "\nVersion", libInfo.version, "\nLast ChangeLog:\n", libInfo.changelog)
  gpu.setForeground(colors.white)
  os.sleep(1)
  gpu.fill(1, 1, w, h, " ")
end

function ConsoleLog.infoLog(text)
  gpu.setForeground(colors.info)
  print("[INFO]", text)
  gpu.setForeground(colors.white)
end

function ConsoleLog.warnLog(text)
  gpu.setForeground(colors.warn)
  print("[WARN]", text)
  gpu.setForeground(colors.white)
end

function ConsoleLog.errorLog(text)
  gpu.setForeground(colors.error)
  print("[ERROR]", text)
  gpu.setForeground(colors.white)
end
return ConsoleLog

