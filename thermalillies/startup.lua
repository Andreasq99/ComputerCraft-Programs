rednet.open("top")
print("awaiting reboot signal.")
while true do
    id, message = rednet.receive("restart",100)
    if message=="restart" then
        print("restart signal received.")
        local isRunning = false
        local total = multishell.getCount()
        for i = 1,total, 1 do
            if multishell.getTitle(i) == "readRedstone" then
                isRunning = true
            end
        end
        if not isRunning then
            shell.openTab("readRedstone.lua")
            print("starting up readRedstone.lua.")
        end
    end
end
