--local id1, message1, id2, message2, id3, message3, id4, message4
local id, message
local a = {}
local b = {}
local index = 0
local timeout = 310
--modem = peripheral.find("modem")
--modem.open(65535)
rednet.open("top")
rednet.broadcast("restart!","restart")

function getId(tab,num)
    local ind = 0
    for i=1,4,1
        do
        if tab[i]==num then
            ind = i
        end
    end
    return ind
end

while(true) do
    a[1] = 2
    a[2] = 4
    a[3] = 5
    a[4] = 6
    
    for i=1,4,1 do
        id, message = rednet.receive()
        index = getId(a,id)
        print(message)
        b[i] = message
        table.remove(a,index)
        index = 0
    end
    
    timeout = 20*math.max(table.unpack(b))
    rednet.broadcast(timeout,"timer")
    sleep(timeout+2)
    
    redstone.setOutput("front",true)
    sleep(1)
    redstone.setOutput("front",false)
    rednet.broadcast("restart!","restart")
    print("restarting cycle.")
    timeout = 310
    
end
