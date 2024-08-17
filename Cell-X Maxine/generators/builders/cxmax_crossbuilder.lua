name = "CX-Max Cross Builder"
id = "CXMAX_CROSSBUILDER"
author = "traincrisis"
texture = "cxmax_crossbuilder.png"
updateIndex = 9007

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
    end
    
    -- Get the cell to the right of the Generator
    local rightDirection = (this.direction + 1) % 4
    local rightCell = this.GetCell(rightDirection, 1)
    if rightCell.name ~= "EMPTY" then
        -- Push cells ahead in the left direction
        local leftDirection = (this.direction + 3) % 4
        this.GetCell(leftDirection, 1).Push(leftDirection, 1)
        
        -- Output the cell to the left
        local leftOutputCell = this.GetCell(leftDirection, 1)
        if leftOutputCell.name == "EMPTY" then
            grid.CreateCell(rightCell.name, leftOutputCell.x, leftOutputCell.y, rightCell.direction)
        end
    end
    return this.Push(dir, bias)
end
