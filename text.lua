local comp = require("component")
local event = require("event")
local gpu = comp.gpu

while true do

  gpu.setResolution(20, 5)
  gpu.setBackground(0X000000)
  gpu.setForeground(0Xffffff)
  print("")
  print("== FUEL PRICES ==")
  print("FUELIUM: 30WB : 1%")
  print("DEISEL: 20WB : 100MB")
os.sleep(20)

end