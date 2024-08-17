name = "CX-Max CW Backgenerator"
id = "CXMAX_BACKGENERATORCW"
author = "traincrisis"
texture = "cxmax_backgeneratorCW.png"
updateIndex = 1000

function Step(this)
    -- Define the right and left directions relative to the current direction
    local rightDirection = (this.direction + 1) % 4
    local leftDirection = (this.direction + 3) % 4

    -- Check if there is a cell behind the Backgenerator
    local backCell = this.GetCell(this.direction, -1)
    
    if backCell.name ~= "EMPTY" then
        -- Always move backward (left of current direction)
        this.Push(leftDirection, 1)
        
        -- Try to push cells to the right
        local pushed = this.GetCell(rightDirection, 1).Push(rightDirection, 1)[1]
        
        -- Generate the cell behind the generator on the right if space is available
        local infront = this.GetCell(rightDirection, 1)
        if infront.name == "EMPTY" then
            grid.CreateCell(backCell.name, infront.x, infront.y, backCell.direction)
        end
    end
end

