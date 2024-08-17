name = "CX-Max Super CCW Generator"
id = "CXMAX_SUPERGENERATORCCW"
author = "traincrisis"
texture = "cxmax_supergeneratorCCW.png"
updateIndex = 9022

function Step(this)
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

    -- Push cells to the left
    local numCells = #sequence
    for i = 1, numCells do
        this.GetCell(leftDirection, i).Push(leftDirection, 1)
    end
    
    -- Generate the new cells to the left
    for i = 1, numCells do
        local leftCell = this.GetCell(leftDirection, i)
        if leftCell.name == "EMPTY" then
            grid.CreateCell(sequence[i], leftCell.x, leftCell.y, leftDirection)
        end
    end
end

