name = "CX-Max CW Builder"
id = "CXMAX_BUILDERCW"
author = "traincrisis"
texture = "cxmax_builderCW.png"
updateIndex = 1000

function Push(this, dir, bias)
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
    return this.Push(dir, bias)
end

