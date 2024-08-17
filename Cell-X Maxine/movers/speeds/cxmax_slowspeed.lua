name = "CX-Max Slow Speed"
id = "CXMAX_SLOWSPEED"
author = "traincrisis"
texture = "cxmax_slowspeed.png"
updateIndex = 9000

-- Declare tickCounter as a local variable
local tickCounter = 0

function Start(this)
    -- Initialize the local tickCounter variable for each instance
    tickCounter = 0
end

function Push(this, dir, bias)
    -- Update bias based on direction
    if (this.rotation == dir) then
        bias = bias + 1
    elseif ((dir + 2) % 4 == this.rotation) then
        bias = bias - 1
    end
    return this.Push(dir, bias)
end

function Step(this)
    -- Increment the tickCounter variable for each instance
    tickCounter = tickCounter + 1

    -- Move the Slow Speed once every other tick
    if tickCounter % 2 == 0 then
        if this.GetCell(this.direction, 1).name == "EMPTY" then
            this.Push(this.direction, 1)
        end
    end
end

