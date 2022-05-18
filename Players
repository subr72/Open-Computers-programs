local component = require("component")
local computer = require("computer")
local os = require("os")
local log = require('LoggerLib')
local term = require("term")
options = {
  redstone = true,
  radius = 16
}

players = {}

function checkComponents()
  if component.isAvailable("redstone") then
    redstone = component.redstone
    log.infoLog("Redstone is Available")
    redstone.setWakeThreshold(15)
    log.infoLog("Computer will be turn on with 15 redstone level of any side of redstone I/O")
  else
    log.errorLog("Redstone not found")
    os.exit()
  end
  if component.isAvailable("openperipheral_sensor") then
    log.infoLog("Sensor is Available!")
    sensor = component.openperipheral_sensor
  else 
    log.errorLog("Sensor not found!")
    os.exit()
  end
  if component.isAvailable("gpu") then
    log.infoLog("GPU is Available")
    gpu = component.gpu
  else 
    log.errorLog("GPU not found") 
    os.exit()
  end 
  if component.isAvailable("chat_box") then
    log.infoLog("Chat Box is Avaliable!")
    chat_box = component.chat_box
  else 
    log.errorLog("Chat Box not found!")
    os.exit()
  end
end 

function getPlayers()
  players = sensor.getPlayers()
  for i = 1, #players do
    if #players >= 2 then
      log.warnLog("Players > 2!")
      redstone.setOutput(1,15)
    else 
      log.infoLog(players[i].name)
      redstone.setOutput(1,0)
    end
  end
  os.sleep(1)
end

checkComponents()
os.sleep(3)
term.clear()

while true do
  getPlayers()
end
