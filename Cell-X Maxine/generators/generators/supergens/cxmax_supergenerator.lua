name = "CX-Max Super Generator"
id = "CXMAX_SUPERGENERATOR"
author = "traincrisis"
texture = "cxmax_supergenerator.png"
updateIndex = 9008

function Step(this)
    local dx = DirToX(this.direction)
    local dy = DirToY(this.direction)
    
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

    -- Push cells ahead
    local numCells = #sequence
    for i = 1, numCells do
        this.GetCell(this.direction, i).Push(this.direction, 1)
    end
    
    -- Generate the new cells in front
    for i = 1, numCells do
        local frontCell = this.GetCell(this.direction, i)
        if frontCell.name == "EMPTY" then
            grid.CreateCell(sequence[i], frontCell.x, frontCell.y, this.direction)
        end
    end
end

function DirToX(dir)
    local dx = {1, 0, -1, 0}  -- right, down, left, up
    return dx[dir + 1]
end

function DirToY(dir)
    local dy = {0, 1, 0, -1}  -- right, down, left, up
    return dy[dir + 1]
end

