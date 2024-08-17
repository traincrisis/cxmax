name = "CX-Max Super Bigenerator"
id = "CXMAX_SUPERBIGENERATOR"
author = "traincrisis"
texture = "cxmax_superbigenerator.png"
updateIndex = 9023

function Step(this)
    local rightDirection = (this.direction + 1) % 4
    local leftDirection = (this.direction + 3) % 4

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

    -- Push cells to the right and left
    local numCells = #sequence
    for i = 1, numCells do
        this.GetCell(rightDirection, i).Push(rightDirection, 1)
        this.GetCell(leftDirection, i).Push(leftDirection, 1)
    end
    
    -- Generate the new cells to the right and left
    for i = 1, numCells do
        local rightCell = this.GetCell(rightDirection, i)
        local leftCell = this.GetCell(leftDirection, i)
        if rightCell.name == "EMPTY" then
            grid.CreateCell(sequence[i], rightCell.x, rightCell.y, rightDirection)
        end
        if leftCell.name == "EMPTY" then
            grid.CreateCell(sequence[i], leftCell.x, leftCell.y, leftDirection)
        end
    end
end

