name = "CX-Max CCW Physical Generator"
id = "CXMAX_PHYSICALGENERATORCCW"
author = "traincrisis"
texture = "cxmax_physicalgeneratorCCW.png"
updateIndex = 1000

function Step(this)
    -- Define the left direction relative to the current direction
    local leftDirection = (this.direction + 3) % 4
    
    -- Define the bottom direction relative to the current direction
    local bottomDirection = (this.direction + 1) % 4

    -- Check if there is a cell behind the CCW Physical Generator
    if this.GetCell(this.direction, -1).name ~= "EMPTY" then
        -- Push cells to the left
        local pushed = this.GetCell(leftDirection, 1).Push(leftDirection, 1)[1]

        -- If cells were pushed, duplicate the cell behind in the left direction
        if pushed then
            local infront = this.GetCell(leftDirection, 1)
            grid.CreateCell(this.GetCell(this.direction, -1).name, infront.x, infront.y, this.GetCell(this.direction, -1).direction)
        end

        -- If unable to push, move to the bottom direction
        if not pushed then
            -- Move to the bottom direction relative to the current facing direction
            this.Push(bottomDirection, 1)
        end
    end
end

