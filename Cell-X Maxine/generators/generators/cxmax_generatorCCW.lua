name = "CX-Max CCW Generator"
id = "CXMAX_GENERATORCCW"
author = "traincrisis"
texture = "cxmax_generatorCCW.png"
updateIndex = 1000

function Step(this)
    -- Define the left direction relative to the current direction
    local leftDirection = (this.direction + 3) % 4

    -- Check if there is a cell behind the CCW Generator
    if this.GetCell(this.direction, -1).name ~= "EMPTY" then
        -- Push cells ahead in the new direction
        local pushed = this.GetCell(leftDirection, 1).Push(leftDirection, 1)[1]
        
        -- If cells were pushed, duplicate the cell behind in the left direction
        if pushed then
            local infront = this.GetCell(leftDirection, 1)
            grid.CreateCell(this.GetCell(this.direction, -1).name, infront.x, infront.y, this.GetCell(this.direction, -1).direction)
        end
    end
end

