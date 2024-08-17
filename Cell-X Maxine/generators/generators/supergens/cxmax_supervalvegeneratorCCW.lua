name = "CX-Max Super CCW Valve Generator"
id = "CXMAX_SUPERVALVEGENERATORCCW"
author = "traincrisis"
texture = "cxmax_supervalvegeneratorCCW.png"
updateIndex = 9026

function Step(this)
    local leftDirection = (this.direction + 3) % 4
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

    -- Push cells to the left and front
    local numCells = #sequence
    for i = 1, numCells do
        this.GetCell(leftDirection, i).Push(leftDirection, 1)
        this.GetCell(frontDirection, i).Push(frontDirection, 1)
    end
    
    -- Generate the new cells to the left and front
    for i = 1, numCells do
        local leftCell = this.GetCell(leftDirection, i)
        local frontCell = this.GetCell(frontDirection, i)
        if leftCell.name == "EMPTY" then
            grid.CreateCell(sequence[i], leftCell.x, leftCell.y, leftDirection)
        end
        if frontCell.name == "EMPTY" then
            grid.CreateCell(sequence[i], frontCell.x, frontCell.y, frontDirection)
        end
    end
end

