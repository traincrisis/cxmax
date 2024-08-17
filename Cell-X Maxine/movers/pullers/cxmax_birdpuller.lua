name = "CX-Max Hawk"
id = "CXMAX_BIRDPULLER"
author = "traincrisis"
texture = "cxmax_birdpuller.png"
updateIndex = 9000

local zigzagState = 0

function Start(this)
    zigzagState = 0
end

function Step(this)
    local direction = this.direction

    if direction == 0 or direction == 2 then
        -- Moving left or right (zigzag pattern)
        if zigzagState == 0 then
            MoveOrPull(this, 1)  -- Move down
        elseif zigzagState == 1 then
            if this.GetCell(this.direction, 1).name == "EMPTY" then
                MoveOrPull(this, this.direction)  -- Move forward
            end
        elseif zigzagState == 2 then
            MoveOrPull(this, 3)  -- Move up
        elseif zigzagState == 3 then
            if this.GetCell(this.direction, 1).name == "EMPTY" then
                MoveOrPull(this, this.direction)  -- Move forward
            end
        end

        zigzagState = (zigzagState + 1) % 4  -- Cycle through the states
    else
        -- Moving up or down (straight line)
        MoveOrPull(this, this.direction)
    end
end

function MoveOrPull(this, dir)
    if this.GetCell(dir, 1).name == "EMPTY" then
        local i = 1
        while this.GetCell(dir, -i) and this.GetCell(dir, -i).name ~= "EMPTY" do
            i = i + 1
        end
        if i > 1 then
            this.GetCell(dir, -i + 1).Push(dir, 1)
        else
            this.Push(dir, 1)  -- Move itself if no cells to pull
        end
    else
        this.Push(dir, 1)  -- Move itself if cell ahead is not empty
    end
end

