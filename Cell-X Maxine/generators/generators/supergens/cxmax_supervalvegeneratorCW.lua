name = "CX-Max Super CW Valve Generator"
id = "CXMAX_SUPERVALVEGENERATORCW"
author = "traincrisis"
texture = "cxmax_supervalvegeneratorCW.png"
updateIndex = 9025

function Step(this)
    local rightDirection = (this.direction + 1) % 4
    local frontDirection = this.direction

    -- Create a temporary table to store the sequence of cells behind
    local sequence = {}
    
    -- Collect the sequence of cells behind the generator
    local index = 1
    while true do
        local backCell = this.GetCell(this.direction, -index)
        if backCell.name == "EMPTY" then
            break
        end
        table.insert(sequence, 1, backCell.name)  -- Insert at the beginning to reverse the order
        index = index + 1
    end

    -- Push cells to the right and front
    local numCells = #sequence
    for i = 1, numCells do
        this.GetCell(rightDirection, i).Push(rightDirection, 1)
        this.GetCell(frontDirection, i).Push(frontDirection, 1)
    end
    
    -- Generate the new cells to the right and front
    for i = 1, numCells do
        local rightCell = this.GetCell(rightDirection, i)
        local frontCell = this.GetCell(frontDirection, i)
        if rightCell.name == "EMPTY" then
            grid.CreateCell(sequence[i], rightCell.x, rightCell.y, rightDirection)
        end
        if frontCell.name == "EMPTY" then
            grid.CreateCell(sequence[i], frontCell.x, frontCell.y, frontDirection)
        end
    end
end

