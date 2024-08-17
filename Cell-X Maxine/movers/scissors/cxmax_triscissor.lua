name = "CX-Max Triscissor"
id = "CXMAX_TRISCISSOR"
author = "traincrisis"
texture = "cxmax_triscissor.png"
updateIndex = 9003

function Step(this)
    -- Define the right, left, and back directions relative to the current direction
    local rightDirection = (this.direction + 1) % 4
    local leftDirection = (this.direction + 3) % 4
    local backDirection = (this.direction + 2) % 4

    -- Function to handle cell generation
    local function generateCells(targetDirection, sourceDirection, offset)
        -- Check if there is a cell in front of the Scissor
        if this.GetCell(sourceDirection, 1).name ~= "EMPTY" then
            -- Push cells ahead in the target direction
            local pushed = this.GetCell(targetDirection, 1).Push(targetDirection, 1)[1]
            
            -- If cells were pushed, duplicate the cell in front in the target direction
            if pushed then
                local infront = this.GetCell(sourceDirection, 1)
                grid.CreateCell(infront.name, infront.x + offset.x, infront.y + offset.y, this.direction)
            end
        end
    end

    -- Generate cells to the right
    generateCells(rightDirection, this.direction, {x = DirToX(rightDirection), y = DirToY(rightDirection)})
    
    -- Generate cells to the left
    generateCells(leftDirection, this.direction, {x = DirToX(leftDirection), y = DirToY(leftDirection)})
    
    -- Generate cells behind
    generateCells(backDirection, this.direction, {x = DirToX(backDirection) * 2, y = DirToY(backDirection) * 2})
    
    -- Destroy the cell in front
    local frontCell = this.GetCell(this.direction, 1)
    if frontCell.name ~= "EMPTY" then
        frontCell.Delete()
    end

    -- Move like a Mover
    this.Push(this.direction, 1)
end

function DirToX(dir)
    local dx = {1, 0, -1, 0}  -- right, down, left, up
    return dx[dir + 1]
end

function DirToY(dir)
    local dy = {0, 1, 0, -1}  -- right, down, left, up
    return dy[dir + 1]
end

