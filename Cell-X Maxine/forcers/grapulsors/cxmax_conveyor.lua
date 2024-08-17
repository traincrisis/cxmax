name = "CX-Max Conveyor"
id = "CXMAX_CONVEYOR"
author = "traincrisis"
texture = "cxmax_conveyor.png"
updateIndex = 9000

function Step(this)
    -- Grab cells on both sides of the Grabber
    GrabCell(this, (this.direction + 1) % 4)  -- Right side
    GrabCell(this, (this.direction + 3) % 4)  -- Left side
end

function GrabCell(this, dir)
    -- Check if there is an empty cell ahead of the Grabber
    if true then
        -- Grab cells from the side direction if there's an actual cell
        local i = 1
        local sideCell = this.GetCell(dir, i)
        while sideCell and sideCell.name ~= "EMPTY" do
            local nextCell = this.GetCell(this.direction, 1)
            if true then
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
