name = "CX-Max Slow Grabber"
id = "CXMAX_SLOWGRABBER"
author = "traincrisis"
texture = "cxmax_slowgrabber.png"
updateIndex = 9000

local tickCounter = 0

function Start(this)
    tickCounter = 0
end

function Step(this)
    tickCounter = tickCounter + 1
    
    -- Perform actions every other tick
    if tickCounter % 2 == 0 then
        -- Grab cells on both sides of the Grabber
        GrabCell(this, (this.direction + 1) % 4)  -- Right side
        GrabCell(this, (this.direction + 3) % 4)  -- Left side
        if this.GetCell(this.direction, 1).name == "EMPTY" then
            this.Push(this.direction, 1)
        end
    end
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

