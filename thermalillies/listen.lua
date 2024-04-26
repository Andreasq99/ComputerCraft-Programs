local monitor = peripheral.find("monitor")
print("monitor found. ID:",monitor)
monitor.clear()
monitor.setCursorPos(1,1)
monitor.setCursorBlink(false)
rednet.open("back")

function writeToMonitor(text)
    local x,y = monitor.getCursorPos()
    if y>11 then
        monitor.clear()
        monitor.setCursorPos(1,1)
    end
    monitor.write(text)
    monitor.setCursorPos(1,y+1)
end

if rednet.isOpen() then
    writeToMonitor("System booted and conected to local")
    writeToMonitor("network.")
end

while(true) do
    print("listening...")
--    print(rednet.isOpen("back"))

    local id, message = rednet.receive()
    
    print("message received")
    print(id)
    print(message)
    
    if id==7 then
        if message == "restart!" then
--            x,y = monitor.getCursorPos()

--            if y==12 then
--                monitor.clear()
--                monitor.setCursorPos(1,1)
--            else
                writeToMonitor("Restarting sequence.")
--            end
            
        elseif type(message)=="number" then
            print("starting countdown",os.date())
            local timeout = tonumber(message)
            writeToMonitor(string.gsub(message, "%w+","Feeding Thermallilies in %1 seconds."))
            
            sleep(timeout/4)
            writeToMonitor("Cooldown 25% complete.")
            sleep(timeout/4)
            writeToMonitor("Cooldown 50% complete.")
            sleep(timeout/4)
            writeToMonitor("Cooldown 75% complete.")
            sleep(timeout/4)
            writeToMonitor("Cooldown complete. Feeding the Lillies.")
        else
            print("error parsing message from master:",message)
        end
        
    end
end

