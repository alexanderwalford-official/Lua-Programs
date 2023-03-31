local component = require "component"
local event = require "event"
local term = require "term"
local computer = require "computer"
local redstone = component.redstone
local sides = require("sides")
reactor = component.nc_fission_reactor

computer.beep()

print("\27[32mSTARTING REACTOR ..\27[37m")
redstone.setOutput(sides.left, 15)
os.sleep()

repeat
  power = reactor.getEnergyChange()
  cells = reactor.getNumberOfCells()
  effic = reactor.getEfficiency()
  term.clear()
  currentHeat = reactor.getHeatLevel()
  fuelname = reactor.getFissionFuelName()
  efficiency = reactor.getEfficiency()
  procheat = reactor.getReactorProcessHeat()
  maxHeat = reactor.getMaxHeatLevel()
  fuelburntime = reactor.getFissionFuelTime() - reactor.getCurrentProcessTime()
  if(power < 0) then
    print("Reactor \27[32mONLINE\27[37m")
  else
	print("Reactor \27[31mOFFLINE\27[37m")
  end
  print("")
  print("Heat")
  print(currentHeat .. "/" .. maxHeat)
  print("")
  print("Cells Remaining")
  print(cells)
  print("")
  print("Fuel Type")
  print(fuelname)
  print("")
  print("Efficiency")
  print(effic)
  print("")
  print("Process Heat")
  print(procheat)
  print("")
  print("Remaining Fuel Burn Time")
  print(fuelburntime)
  print("")
  if (currentHeat > (maxHeat / 2)) then
    term.clear()
	computer.beep()
    computer.beep()
	computer.beep()
    redstone.setOutput(sides.back, 15)
	print("\27[31m[ ! ]\27[37m Reactor is being shut down due to overheating, restartting in 2 mins ..")
	redstone.setOutput(sides.left, 0)
	os.sleep(5)
	redstone.setOutput(sides.back, 0)
	print("\27[32m[ OK ]\27[37m SCRAM completed, waiting to restart..")
    os.sleep(120)
  else
    redstone.setOutput(sides.back, 0)
	redstone.setOutput(sides.left, 15)
	print("\27[32m[ OK ]\27[37m Reactor state returned as NORMAL.")
  end
  until event.pull(1) == "interupted"
  redstone.setOutput(sides.back, 0)
  redstone.setOutput(sides.left, 0)
