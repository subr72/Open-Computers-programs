local ConsoleLog = {}
local libInfo = {
  version = = "1.0.0",
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
function init()
  gpu.setForeground(colors.start)
  print("Console Log Lib initialize")
  os.sleep(1)
  print("Author ", libInfo.author, "\nVersion ", libInfo.version, "Last ChangeLog ", libInfo.changelog)
  gpu.setForeground(colors.foreground)
end

function infoLog(text)
  gpu.setForeground(colors.info)
  print("[INFO]", text)
  gpu.setForeground(colors.background)
end

function warnLog(text)
  gpu.setForeground(colors.warn)
  print("[WARN]", text)
  gpu.setForeground(colors.background)
end

function errorLog(text)
  gpu.setForeground(colors.error)
  print("[ERROR]", text)
  gpu.setForeground(colors.background)
end
return ConsoleLog