name = "CX-Max Bird"
id = "CXMAX_BIRDPUSHER"
author = "traincrisis"
texture = "cxmax_birdpusher.png"
updateIndex = 9000

local zigzagState = 0

function Step(this)
    local direction = this.direction

    if direction == 0 or direction == 2 then
        -- Moving left or right (zigzag pattern)
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
    else
        -- Moving up or down (straight line)
        this.Push(direction, 1)
    end
end

function Start(this)
    zigzagState = 0
end
