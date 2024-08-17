name = "CX-Max CW Valve Builder"
id = "CXMAX_VALVEBUILDERCW"
author = "traincrisis"
texture = "cxmax_valvebuilderCW.png"
updateIndex = 9005

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
        
        -- Push cells ahead in the right direction
        local rightDirection = (this.direction + 1) % 4
        this.GetCell(rightDirection, 1).Push(rightDirection, 1)
        
        -- Output the cell to the right
        local rightCell = this.GetCell(rightDirection, 1)
        if rightCell.name == "EMPTY" then
            grid.CreateCell(backCell.name, rightCell.x, rightCell.y, backCell.direction)
        end
    end
    return this.Push(dir, bias)
end

