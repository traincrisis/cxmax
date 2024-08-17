name = "CX-Max CW Generator"
id = "CXMAX_GENERATORCW"
author = "traincrisis"
texture = "cxmax_generatorCW.png"
updateIndex = 1000

function Step(this)
    -- Define the right direction relative to the current direction
    local rightDirection = (this.direction + 1) % 4

    -- Check if there is a cell behind the CW Generator
    if this.GetCell(this.direction, -1).name ~= "EMPTY" then
        -- Push cells ahead in the new direction
        local pushed = this.GetCell(rightDirection, 1).Push(rightDirection, 1)[1]
        
        -- If cells were pushed, duplicate the cell behind in the right direction
        if pushed then
            local infront = this.GetCell(rightDirection, 1)
            grid.CreateCell(this.GetCell(this.direction, -1).name, infront.x, infront.y, this.GetCell(this.direction, -1).direction)
        end
    end
end

