name = "CX-Max Super Random Trigenerator"
id = "CXMAX_SUPERTRIGENERATORRNG"
author = "traincrisis"
texture = "cxmax_supertrigeneratorRNG.png"
updateIndex = 9025

function Start(this)
    -- Seed the random number generator for consistency
    math.randomseed(os.time())
end

function Step(this)
    local rightDirection = (this.direction + 1) % 4
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

    -- Determine the random direction (front, right, left, or combination)
    local randomDirection = math.random(1, 4)

    if randomDirection == 1 or randomDirection == 4 then
        -- Push and generate cells to the front
        local numCells = #sequence
        for i = 1, numCells do
            this.GetCell(frontDirection, i).Push(frontDirection, 1)
        end
        for i = 1, numCells do
            local frontCell = this.GetCell(frontDirection, i)
            if frontCell.name == "EMPTY" then
                grid.CreateCell(sequence[i], frontCell.x, frontCell.y, frontDirection)
            end
        end
    end

    if randomDirection == 2 or randomDirection == 4 then
        -- Push and generate cells to the right
        local numCells = #sequence
        for i = 1, numCells do
            this.GetCell(rightDirection, i).Push(rightDirection, 1)
        end
        for i = 1, numCells do
            local rightCell = this.GetCell(rightDirection, i)
            if rightCell.name == "EMPTY" then
                grid.CreateCell(sequence[i], rightCell.x, rightCell.y, rightDirection)
            end
        end
    end

    if randomDirection == 3 or randomDirection == 4 then
        -- Push and generate cells to the left
        local numCells = #sequence
        for i = 1, numCells do
            this.GetCell(leftDirection, i).Push(leftDirection, 1)
        end
        for i = 1, numCells do
            local leftCell = this.GetCell(leftDirection, i)
            if leftCell.name == "EMPTY" then
                grid.CreateCell(sequence[i], leftCell.x, leftCell.y, leftDirection)
            end
        end
    end
end

