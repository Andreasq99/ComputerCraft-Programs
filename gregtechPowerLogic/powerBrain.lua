local low = false
local high = false
local bothOn
redstone.setOutput("back",false)

while(true) do
    print("low:",low)
    print("high:",high)
    if low == false then
        low = redstone.getInput("left")
        
    end
    if high == false then
        high = redstone.getInput("right")
        --print(high)
    end
    sleep(2)
    if high then
        print("turning off power")
        redstone.setOutput("back",true)
        while(low) do
            sleep(2)
            low = redstone.getInput("left")
        end
        redstone.setOutput("back",false)
        high = false
        print("turning power on")
    end    
end
