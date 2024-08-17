name = "CX-Max Random Trishifter"
id = "CXMAX_TRISHIFTER"
author = "traincrisis"
texture = "cxmax_trishifterRNG.png"
updateIndex = 15000

function Start(this)
    math.randomseed(os.time()) -- Seed the random number generator
end

-- Function to get a random direction
function GetRandomDirection()
    return math.random(0, 3) -- Returns 0 (all), 1 (right), 2 (left), or 3 (front)
end

function Step(this)
    local rightDirection = (this.direction + 1) % 4
    local leftDirection = (this.direction + 3) % 4
    local frontDirection = this.direction
    local randomChoice = GetRandomDirection() -- Randomly choose between 0 (all), 1 (right), 2 (left), or 3 (front)

    -- Check if there is a cell behind to operate
    local cellBehind = this:GetCell(this.direction, -1)
    if cellBehind.name ~= "EMPTY" then
        -- Based on random choice, decide where to output
        if randomChoice == 0 then
            -- Shift to the front, right, and left
            if this:GetCell(frontDirection, 1).name ~= "ENEMY" and this:GetCell(frontDirection, 1).Push(frontDirection, 1)[1] then
                local infrontFront = this:GetCell(frontDirection, 1)
                grid.CreateCell(cellBehind.name, infrontFront.x, infrontFront.y, cellBehind.direction)
            end
            if this:GetCell(rightDirection, 1).name ~= "ENEMY" and this:GetCell(rightDirection, 1).Push(rightDirection, 1)[1] then
                local infrontRight = this:GetCell(rightDirection, 1)
                grid.CreateCell(cellBehind.name, infrontRight.x, infrontRight.y, cellBehind.direction)
            end
            if this:GetCell(leftDirection, 1).name ~= "ENEMY" and this:GetCell(leftDirection, 1).Push(leftDirection, 1)[1] then
                local infrontLeft = this:GetCell(leftDirection, 1)
                grid.CreateCell(cellBehind.name, infrontLeft.x, infrontLeft.y, cellBehind.direction)
            end
        elseif randomChoice == 1 then
            -- Shift to the right
            if this:GetCell(rightDirection, 1).name ~= "ENEMY" and this:GetCell(rightDirection, 1).Push(rightDirection, 1)[1] then
                local infrontRight = this:GetCell(rightDirection, 1)
                grid.CreateCell(cellBehind.name, infrontRight.x, infrontRight.y, cellBehind.direction)
            end
        elseif randomChoice == 2 then
            -- Shift to the left
            if this:GetCell(leftDirection, 1).name ~= "ENEMY" and this:GetCell(leftDirection, 1).Push(leftDirection, 1)[1] then
                local infrontLeft = this:GetCell(leftDirection, 1)
                grid.CreateCell(cellBehind.name, infrontLeft.x, infrontLeft.y, cellBehind.direction)
            end
        elseif randomChoice == 3 then
            -- Shift to the front
            if this:GetCell(frontDirection, 1).name ~= "ENEMY" and this:GetCell(frontDirection, 1).Push(frontDirection, 1)[1] then
                local infrontFront = this:GetCell(frontDirection, 1)
                grid.CreateCell(cellBehind.name, infrontFront.x, infrontFront.y, cellBehind.direction)
            end
        end

        -- Delete the original cell behind the Trishifter after shifting
        cellBehind.Delete()
    end

    -- Step 2: Pull cells from 2 cells away behind the Trishifter
    local function PullCellsBehind(this, dir)
        local oppositeDir = (dir + 2) % 4

        -- Ensure there's an empty cell right next to the Trishifter
        if this:GetCell(dir, -1) and this:GetCell(dir, -1).name == "EMPTY" then
            local targetCell = this:GetCell(dir, -2)
            local foundCells = false

            -- Pull cells from the target position and the rows behind it
            if targetCell and targetCell.name ~= "EMPTY" then
                local step = 0
                local cell = targetCell

                while cell and cell.name ~= "EMPTY" do
                    foundCells = true
                    cell:Push(dir, 1)
                    cell = this:GetCell(dir, -(2 + step + 1))
                    step = step + 1
                end

                -- Handle the case for a single cell
                if not foundCells then
                    targetCell:Push(dir, 1)
                end
            end
        end
    end

    -- Pull cells from behind after shifting
    PullCellsBehind(this, this.direction)
end

