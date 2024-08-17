name = "CX-Max Super Cross Generator"
id = "CXMAX_SUPERCROSSGENERATOR"
author = "traincrisis"
texture = "cxmax_supercrossgenerator.png"
updateIndex = 9009

function Step(this)
    -- Main direction generation (Super Generator functionality)
    local mainSequence = GetSequenceInDirection(this, this.direction, -1)
    GenerateInDirection(this, this.direction, mainSequence)
    
    -- Perpendicular direction generation (Cross Generator functionality)
    local rightDirection = (this.direction + 1) % 4
    local leftDirection = (this.direction + 3) % 4
    
    local rightSequence = GetSequenceInDirection(this, rightDirection, 1)
    if #rightSequence > 0 then
        GenerateInDirection(this, leftDirection, rightSequence)
    end
end

function GetSequenceInDirection(this, direction, step)
    local sequence = {}
    local index = 1
    while true do
        local cell = this.GetCell(direction, index * step)
        if cell.name == "EMPTY" then
            break
        end
        if step < 0 then
            table.insert(sequence, 1, cell.name)  -- Insert at beginning for reverse order
        else
            table.insert(sequence, cell.name)     -- Insert at end for forward order
        end
        index = index + 1
    end
    return sequence
end

function GenerateInDirection(this, direction, sequence)
    -- Push existing cells
    for i = 1, #sequence do
        this.GetCell(direction, i).Push(direction, 1)
    end
    
    -- Generate new cells
    for i = 1, #sequence do
        local cell = this.GetCell(direction, i)
        if cell.name == "EMPTY" then
            grid.CreateCell(sequence[i], cell.x, cell.y, direction)
        end
    end
end
