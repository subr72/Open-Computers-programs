local component = require("component")
--TYPES OF MFSU--
--Improved - adv
--Advanced - ult
--Perfect - per
--Baryon - bar
--Hadron - had
--Graviton - gra
--Quark - qua
mfsu = component.industrialupgrade_wiring_storage_gra_mfsu
--component.industrialupgrade_wiring_storage_%TYPE%_mfsu
---------------------------------------------------------
local log = require("LoggerLib")
local rs = component.redstone
local gpu = component.gpu
log.init()
function getEnergyMFSU()
  return mfsu.getEnergy()
end 
function getCapacityMFSU()
  return mfsu.getCapacity()
end 
function OnOff()
  if getEnergyMFSU() == getCapacityMFSU() then 
    setRedstone("off")
    gpu.setForeground(0xFF0000)
    gpu.set(1, 1, "Off ")
    gpu.set(4, 1, tostring(getEnergyMFSU()).." / "..tostring(getCapacityMFSU()))
  else
    setRedstone("on")
    gpu.setForeground(0x00FF00)
    gpu.set(1, 1, "On  ")
    gpu.set(4, 1, "                                                       ")
    gpu.set(4, 1, tostring(getEnergyMFSU()).." / "..tostring(getCapacityMFSU()))
  end
end 
function setRedstone(type)
  if type == "off" then 
    rs.setOutput(2, 0)
  else
    rs.setOutput(2,15)
  end 
end
while true do
  OnOff()
  os.sleep(0.001)
end
