name = "CX-Max Quasi-Vacuum"
id = "CXMAX_QUASIVACUUM"
author = "traincrisis"
texture = "cxmax_quasivacuum.png"
updateIndex = 15000

function Step(this)
    local function PullCells(this, dir)
        local oppositeDir = (dir + 2) % 4

        -- Ensure there's an empty cell right next to the Vacuum
        if this:GetCell(dir, 1) and this:GetCell(dir, 1).name == "EMPTY" then
            -- Pull cells 2 cells away and up to 3 cells away
            local function pullFromPosition(startPos)
                local step = 0
                local cell = this:GetCell(dir, startPos)
                
                while cell and cell.name ~= "EMPTY" do
                    cell:Push(oppositeDir, 1)
                    cell = this:GetCell(dir, startPos + step + 1)
                    step = step + 1
                end
            end

            -- Pull from both 2 cells away and 3 cells away
            pullFromPosition(2)
            pullFromPosition(3)
        end
    end

    -- Pull cells only from the front direction
    PullCells(this, 0) -- Up
end

