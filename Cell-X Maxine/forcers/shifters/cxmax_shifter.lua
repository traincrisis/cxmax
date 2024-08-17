name = "CX-Max Shifter"
id = "CXMAX_SHIFTER"
author = "traincrisis"
texture = "cxmax_shifter.png"
updateIndex = 11000

function Step(this)
    -- Step 1: Perform the shifting operation
    if this:GetCell(this.direction, -1).name ~= "EMPTY" then
        if this:GetCell(this.direction, 1).name ~= "ENEMY" and this:GetCell(this.direction, 1).Push(this.direction, 1)[1] then
            local infront = this:GetCell(this.direction, 1)
            grid.CreateCell(this:GetCell(this.direction, -1).name, infront.x, infront.y, this:GetCell(this.direction, -1).direction)
            this:GetCell(this.direction, -1).Delete()
        end
    end

    -- Step 2: Pull cells from 2 cells away behind the Shifter
    local function PullCellsBehind(this, dir)
        local oppositeDir = (dir + 2) % 4

        -- Ensure there's an empty cell right next to the Shifter
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

