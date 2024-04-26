rednet.open("back")

monitor = peripheral.find("monitor")
monitor.clear()
monitor.setCursorPos(1,1)

local total = multishell.getCount()
local isRunning = false

for i = 1, total, 1 do
    if multishell.getTitle(i) == "listen" then
        isRunning = true
    end
end
if not isRunning then
    shell.openTab("listen.lua")
end

rednet.broadcast("restart","restart")

