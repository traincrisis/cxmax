name = "CX-Max Super CW Generator"
id = "CXMAX_SUPERGENERATORCW"
author = "traincrisis"
texture = "cxmax_supergeneratorCW.png"
updateIndex = 9021

function Step(this)
    local rightDirection = (this.direction + 1) % 4

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

    -- Push cells to the right
    local numCells = #sequence
    for i = 1, numCells do
        this.GetCell(rightDirection, i).Push(rightDirection, 1)
    end
    
    -- Generate the new cells to the right
    for i = 1, numCells do
        local rightCell = this.GetCell(rightDirection, i)
        if rightCell.name == "EMPTY" then
            grid.CreateCell(sequence[i], rightCell.x, rightCell.y, rightDirection)
        end
    end
end

