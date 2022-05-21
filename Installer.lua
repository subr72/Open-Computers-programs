local shell = require("shell")
local fs = require("filesystem")
local computer = require("computer")
local applications = {
  {"https://raw.githubusercontent.com/subr72/Open-Computers-programs/main/LoggerLib.lua", "/lib/LoggerLib.lua", "LoggerLib"},
  {"https://raw.githubusercontent.com/subr72/Open-Computers-programs/main/Players.lua", "Players.lua", "Players"},
  {"https://raw.githubusercontent.com/subr72/Open-Computers-programs/main/MFSU%20Control.lua","Energy.lua","MFSU Control"}
}
print("All my programs:")
print("=NUM==========NAME===========")
for i = 1, #applications do
  print("["..tostring(i).."]           "..applications[i][3])
end 
print("Enter letter of program to download it!")
program = io.read()
print("Download ",applications[tonumber(program)][2])
fs.makeDirectory(fs.path(applications[tonumber(program)][2]) or "")		
shell.execute("wget " .. applications[tonumber(program)][1] .. " " .. applications[tonumber(program)][2] .. " -fQ")
--Download lib
print("Download ",applications[1][2])
fs.makeDirectory(fs.path(applications[1][2]) or "")		
shell.execute("wget " .. applications[1][1] .. " " .. applications[1][2] .. " -fQ")
os.sleep(0.3)
print("To put program on Autorun, use [edit .shrc], then write name of program, such as ", applications[tonumber(program)][3])
