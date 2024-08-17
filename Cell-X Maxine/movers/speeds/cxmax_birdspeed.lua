name = "CX-Max Swiftwing"
id = "CXMAX_BIRDSPEED"
author = "traincrisis"
texture = "cxmax_birdspeed.png"
updateIndex = 9000

local zigzagState = 0

function Step(this)
    local direction = this.direction

    if direction == 0 or direction == 2 then
        -- Moving left or right (zigzag pattern)
        if this.GetCell(this.direction, 1).name == "EMPTY" then
            if zigzagState == 0 then
                this.Push(1, 1)  -- Move down
            elseif zigzagState == 1 then
                this.Push(direction, 1)  -- Move forward
            elseif zigzagState == 2 then
                this.Push(3, 1)  -- Move up
            elseif zigzagState == 3 then
                this.Push(direction, 1)  -- Move forward
            end
            zigzagState = (zigzagState + 1) % 4  -- Cycle through the states
        end
    else
        -- Moving up or down (straight line)
        if this.GetCell(this.direction, 1).name == "EMPTY" then
            this.Push(direction, 1)
        end
    end
end

function Start(this)
    zigzagState = 0
end

