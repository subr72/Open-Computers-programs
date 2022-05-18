local component = require("component")
local computer = require("computer")
local os = require("os")
local log = require('LoggerLib')
local term = require("term")
sayd = false
options = {
  redstone = true,
  radius = 16,
  chat_boxName = "§aManager",
  chat_boxRadius = 8
}

players = {}

function checkComponents()
  if component.isAvailable("redstone") then
    redstone = component.redstone
    log.infoLog("Redstone is Available")
    redstone.setWakeThreshold(15)
    redstone.setOutput(1,0)
    log.infoLog("Computer will be turn on with 15 redstone level of any side of redstone I/O")
  else
    log.errorLog("Redstone not found")
    os.exit()
  end
  if component.isAvailable("radar") then
    log.infoLog("Radar is Available!")
    sensor = component.radar
  else
    log.errorLog("Radar not found!")
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
    chat_box.setName(options.chat_boxName)
    chat_box.setDsitance(options.chat_boxRadius)
  else
    log.errorLog("Chat Box not found!")
    os.exit()
  end
end

function getPlayers()
  players = sensor.getPlayers()
  for i = 1, #players do
    if players[i].distance < options.radius then
      if #players >= 2 then
        log.warnLog("Players > 2!")
        redstone.setOutput(1,15)
        if sayd then
          return
        else
          chat_box.say("§42 игрока в комнате! Система выключена. §aВ комнате должно быть не более 2 игроков.")
          sayd = true
        end
      else
        log.infoLog(players[i].name)
        sayd = false
        redstone.setOutput(1,0)
      end
    end
  end
  i = i + 1
  os.sleep(1)
end


checkComponents()
os.sleep(3)
term.clear()

while true do
  getPlayers()
  os.sleep(0.01)
end
