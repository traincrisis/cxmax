name = "CX-Max CCW Valve Shifter"
id = "CXMAX_VALVESHIFTERCCW"
author = "traincrisis"
texture = "cxmax_valveshifterCCW.png"
updateIndex = 17000

function Step(this)
    local leftDirection = (this.direction + 3) % 4

    -- Step 1: Perform the shifting operation
    if this:GetCell(this.direction, -1).name ~= "EMPTY" then
        -- Shift to the front
        if this:GetCell(this.direction, 1).name ~= "ENEMY" and this:GetCell(this.direction, 1).Push(this.direction, 1)[1] then
            local infrontFront = this:GetCell(this.direction, 1)
            grid.CreateCell(this:GetCell(this.direction, -1).name, infrontFront.x, infrontFront.y, this:GetCell(this.direction, -1).direction)
        end
        
        -- Shift to the left
        if this:GetCell(leftDirection, 1).name ~= "ENEMY" and this:GetCell(leftDirection, 1).Push(leftDirection, 1)[1] then
            local infrontLeft = this:GetCell(leftDirection, 1)
            grid.CreateCell(this:GetCell(this.direction, -1).name, infrontLeft.x, infrontLeft.y, this:GetCell(this.direction, -1).direction)
        end

        -- Delete the original cell behind the Valve Shifter after shifting
        this:GetCell(this.direction, -1).Delete()
    end

    -- Step 2: Pull cells from 2 cells away behind the Valve Shifter
    local function PullCellsBehind(this, dir)
        local oppositeDir = (dir + 2) % 4

        -- Ensure there's an empty cell right next to the Valve Shifter
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

