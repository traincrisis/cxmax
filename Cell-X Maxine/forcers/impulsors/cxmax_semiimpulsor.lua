name = "CX-Max Semi-Impulsor"
id = "CXMAX_SEMIIMPULSOR"
author = "traincrisis"
texture = "cxmax_semiimpulsor.png"
updateIndex = 10000

function Step(this)
    local function PullCells(this, dir)
        local oppositeDir = (dir + 2) % 4

        -- Ensure there's an empty cell right next to the Impulsor
        if this:GetCell(dir, 1) and this:GetCell(dir, 1).name == "EMPTY" then
            local targetCell = this:GetCell(dir, 2)
            local foundCells = false

            -- Pull cells from the target position and the rows behind it
            if targetCell and targetCell.name ~= "EMPTY" then
                local step = 0
                local cell = targetCell

                while cell and cell.name ~= "EMPTY" do
                    foundCells = true
                    cell:Push(oppositeDir, 1)
                    cell = this:GetCell(dir, 2 + step + 1)
                    step = step + 1
                end

                -- Handle the case for a single cell
                if not foundCells then
                    targetCell:Push(oppositeDir, 1)
                end
            end
        end
    end

    -- Pull cells from the front and back directions
    PullCells(this, 0) -- Up
    PullCells(this, 2) -- Down
end

