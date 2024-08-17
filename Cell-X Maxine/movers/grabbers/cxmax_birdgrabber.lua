name = "CX-Max Pelican"
id = "CXMAX_BIRDGRABBER"
author = "traincrisis"
texture = "cxmax_birdgrabber.png"
updateIndex = 9000

local zigzagState = 0

function Step(this)
    local direction = this.direction

    if direction == 0 or direction == 2 then
        -- Zigzag pattern for left/right movements
        if zigzagState == 0 then
            -- Grab cells on the right and move down
            GrabCell(this, (direction + 1) % 4)  -- Right side
            if this.GetCell(this.direction, 1).name == "EMPTY" then
                this.Push(1, 1)  -- Move down
            end
        elseif zigzagState == 1 then
            -- Grab cells on the right and move forward
            GrabCell(this, (direction + 1) % 4)  -- Right side
            if this.GetCell(this.direction, 1).name == "EMPTY" then
                this.Push(direction, 1)  -- Move forward
            end
        elseif zigzagState == 2 then
            -- Grab cells on the left and move up
            GrabCell(this, (direction + 3) % 4)  -- Left side
            if this.GetCell(this.direction, 1).name == "EMPTY" then
                this.Push(3, 1)  -- Move up
            end
        elseif zigzagState == 3 then
            -- Grab cells on the left and move forward
            GrabCell(this, (direction + 3) % 4)  -- Left side
            if this.GetCell(this.direction, 1).name == "EMPTY" then
                this.Push(direction, 1)  -- Move forward
            end
        end

        -- Update zigzag state
        zigzagState = (zigzagState + 1) % 4
    else
        -- Moving up or down (straight line)
        GrabCell(this, direction)
        if this.GetCell(this.direction, 1).name == "EMPTY" then
            this.Push(direction, 1)
        end
    end
end

function Start(this)
    zigzagState = 0
end

function GrabCell(this, dir)
    -- Check if there is an empty cell ahead of the Grabber
    if this.GetCell(this.direction, 1).name == "EMPTY" then
        -- Grab cells from the side direction if there's an actual cell
        local i = 1
        local sideCell = this.GetCell(dir, i)
        while sideCell and sideCell.name ~= "EMPTY" do
            local nextCell = this.GetCell(this.direction, 1)
            if nextCell and nextCell.name == "EMPTY" then
                -- Move the grabbed cell to the direction the Grabber is facing
                sideCell.Push(this.direction, 1)
                -- Move to the next cell on the side
                i = i + 1
                sideCell = this.GetCell(dir, i)
            else
                -- Break if no empty space ahead to push
                break
            end
        end
    end
end

