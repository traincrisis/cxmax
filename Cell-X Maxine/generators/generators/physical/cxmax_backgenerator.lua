name = "CX-Max Backgenerator"
id = "CXMAX_BACKGENERATOR"
author = "traincrisis"
texture = "cxmax_backgenerator.png"
updateIndex = 1000

function Step(this)
    -- Define the direction to move backwards
    local backDirection = (this.direction + 2) % 4

    -- Check if there is a cell behind the Backgenerator
    local backCell = this.GetCell(this.direction, -1)
    
    if backCell.name ~= "EMPTY" then
        -- Move backwards as if always blocked
        this.Push(backDirection, 1)
        
        -- Generate the cell behind the generator
        local infront = this.GetCell(this.direction, 1)
        grid.CreateCell(backCell.name, infront.x, infront.y, backCell.direction)
    end
end

