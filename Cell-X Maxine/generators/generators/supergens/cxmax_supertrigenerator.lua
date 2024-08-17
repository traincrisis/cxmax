name = "CX-Max Super Trigenerator"
id = "CXMAX_SUPERTRIGENERATOR"
author = "traincrisis"
texture = "cxmax_supertrigenerator.png"
updateIndex = 9024

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

    -- Push cells to the front, right, and left
    local numCells = #sequence
    for i = 1, numCells do
        this.GetCell(this.direction, i).Push(this.direction, 1)
        this.GetCell(rightDirection, i).Push(rightDirection, 1)
        this.GetCell(leftDirection, i).Push(leftDirection, 1)
    end
    
    -- Generate the new cells in front, to the right, and to the left
    for i = 1, numCells do
        local frontCell = this.GetCell(this.direction, i)
        local rightCell = this.GetCell(rightDirection, i)
        local leftCell = this.GetCell(leftDirection, i)
        if frontCell.name == "EMPTY" then
            grid.CreateCell(sequence[i], frontCell.x, frontCell.y, this.direction)
        end
        if rightCell.name == "EMPTY" then
            grid.CreateCell(sequence[i], rightCell.x, rightCell.y, rightDirection)
        end
        if leftCell.name == "EMPTY" then
            grid.CreateCell(sequence[i], leftCell.x, leftCell.y, leftDirection)
        end
    end
end

