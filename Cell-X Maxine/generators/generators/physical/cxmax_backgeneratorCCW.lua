name = "CX-Max CCW Backgenerator"
id = "CXMAX_BACKGENERATORCCW"
author = "traincrisis"
texture = "cxmax_backgeneratorCCW.png"
updateIndex = 1000

function Step(this)
    -- Define the left and right directions relative to the current direction
    local leftDirection = (this.direction + 3) % 4
    local rightDirection = (this.direction + 1) % 4

    -- Check if there is a cell behind the Backgenerator
    local backCell = this.GetCell(this.direction, -1)
    
    if backCell.name ~= "EMPTY" then
        -- Always move backward (right of current direction)
        this.Push(rightDirection, 1)
        
        -- Try to push cells to the left
        local pushed = this.GetCell(leftDirection, 1).Push(leftDirection, 1)[1]
        
        -- Generate the cell behind the generator on the left if space is available
        local infront = this.GetCell(leftDirection, 1)
        if infront.name == "EMPTY" then
            grid.CreateCell(backCell.name, infront.x, infront.y, backCell.direction)
        end
    end
end

