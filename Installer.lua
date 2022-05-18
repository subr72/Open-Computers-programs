local shell = require("shell")
local fs = require("filesystem")
local computer = require("computer")
local applications = {
  { "https://raw.githubusercontent.com/subr72/Open-Computers-programs/main/LoggerLib.lua", "/lib/LoggerLib.lua" },
}
for i = 1, #applications do
  print("Download " .. applications[i][2])
  fs.makeDirectory(fs.path(applications[i][2]) or "")		
  shell.execute("wget " .. applications[i][1] .. " " .. applications[i][2] .. " -fQ")
  os.sleep(0.3)
end
print("All files was download, reboot computer?(Y/y)")
if io.read() == "Y" or io.read() == "y" then
  computer.shutdown(true)
else
  print("Press CTRL + ALT + C")
end
