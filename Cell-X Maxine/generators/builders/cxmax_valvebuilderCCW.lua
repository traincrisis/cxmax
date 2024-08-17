name = "CX-Max CCW Valve Builder"
id = "CXMAX_VALVEBUILDERCCW"
author = "traincrisis"
texture = "cxmax_valvebuilderCCW.png"
updateIndex = 9006

function Push(this, dir, bias)
    -- Get the cell behind the Generator
    local backCell = this.GetCell(this.direction, -1)
    if backCell.name ~= "EMPTY" then
        -- Push cells ahead in the front direction
        this.GetCell(this.direction, 1).Push(this.direction, 1)
        
        -- Output the cell in front
        local frontCell = this.GetCell(this.direction, 1)
        if frontCell.name == "EMPTY" then
            grid.CreateCell(backCell.name, frontCell.x, frontCell.y, backCell.direction)
        end
        
        -- Push cells ahead in the left direction
        local leftDirection = (this.direction + 3) % 4
        this.GetCell(leftDirection, 1).Push(leftDirection, 1)
        
        -- Output the cell to the left
        local leftCell = this.GetCell(leftDirection, 1)
        if leftCell.name == "EMPTY" then
            grid.CreateCell(backCell.name, leftCell.x, leftCell.y, backCell.direction)
        end
    end
    return this.Push(dir, bias)
end

