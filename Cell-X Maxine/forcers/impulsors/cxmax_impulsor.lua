name = "CX-Max Impulsor"
id = "CXMAX_IMPULSOR"
author = "traincrisis"
texture = "cxmax_impulsor.png"
updateIndex = 9000

function Step(this)
    -- Function to pull cells in a specific direction
    local function PullCells(this, dir)
        local oppositeDir = (dir + 2) % 4

        -- Ensure there's an empty cell right next to the Impulsor
        if this:GetCell(dir, 1) and this:GetCell(dir, 1).name == "EMPTY" then
            -- Check if there's a non-empty cell 2 cells away
            local targetCell = this:GetCell(dir, 2)
            local foundCells = false

            -- Pull all cells starting from 2 cells away
            if targetCell and targetCell.name ~= "EMPTY" then
                local step = 0
                local cell = targetCell

                -- Pull cells from the target position and the rows behind it
                while cell and cell.name ~= "EMPTY" do
                    foundCells = true
                    -- Push cell towards the Impulsor
                    cell:Push(oppositeDir, 1)
                    -- Move to the next cell in the chain
                    cell = this:GetCell(dir, 2 + step + 1)
                    step = step + 1
                end

                -- If no cells found in the chain, handle the single cell scenario
                if not foundCells then
                    targetCell:Push(oppositeDir, 1)
                end
            end
        end
    end

    -- Pull cells from all 4 sides
    PullCells(this, 0) -- Up
    PullCells(this, 1) -- Right
    PullCells(this, 2) -- Down
    PullCells(this, 3) -- Left
end

