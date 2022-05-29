--==============================
--== Libriary to draw a guis ==
--== Author:          sbur72 ==
--=============================
local gui = {}
local gpu = require("component").gpu
local unicode = require("unicode")

function gui.resolution(x, y)
  gpu.setResolution(x, y)
end

function gui.draw(color, w, h, text)
  gpu.setForeground(color)
  gpu.set(1, 1, "╔")
  gpu.set(1, h, "╚")
  gpu.set(w, 1, "╗")
  gpu.set(w, h, "╝")
  gpu.fill(1, 2, 1, h - 2, "║")
  gpu.fill(2, 1, w - 2, 1, "═")
  gpu.fill(w, 2, 1, h - 2, "║")
  gpu.fill(2, h, w - 2, 1, "═")
  gpu.set(w / 2 - (unicode.len(text) / 2) + 2, 1, "["..text.."]")
end
function gui.button(x, y, color1, color2, text)
  gpu.setForeground(color1)
  h = 2
  w = 3 + unicode.len(text)
  gpu.set(x, y, "╔")
  gpu.set(x, y + h, "╚")
  gpu.set(x + w, y, "╗")
  gpu.set(x + w, y + h, "╝")
  gpu.fill(x + 1, y, w - 1, 1, "═")
  gpu.fill(x + 1, y + h, w - 1, 1, "═")
  gpu.fill(x, y + 1, 1, h - 1, "║")
  gpu.fill(x + w, y + 1, 1, h - 1, "║")
  gpu.setForeground(color2)
  gpu.set(x + 2, y + 1, text)
end
function gui.drawcube(x, y, w, h, color)
  gpu.setForeground(color)
  gpu.set(x, y, "╔")
  gpu.set(x, y + h, "╚")
  gpu.set(x + w, y, "╗")
  gpu.set(x + w, y + h, "╝")
  gpu.fill(x + 1, y, w - 1, 1, "═")
  gpu.fill(x + 1, y + h, w - 1, 1, "═")
  gpu.fill(x, y + 1, 1, h - 1, "║")
  gpu.fill(x + w, y + 1, 1, h - 1, "║")
end
function gui.drawline(type, x, y, h, color)
  gpu.setForeground(color)
  if type == "y" then
    gpu.set(x, y, "╦")
    gpu.set(x, y + h - 1, "╩")
    gpu.fill(x, y + 1, 1, h - 2, "║" )
  end
  if type == "x" then
    gpu.set(x, y, "╠")
    gpu.set(x + h - 1, y, "╣")
    gpu.fill(x + 1, y, h - 2, 1, "═")
  end
end
function gui.drawtext(text, color, x, y)
  gpu.setForeground(color)
  gpu.set(x, y, text)
end
return gui
