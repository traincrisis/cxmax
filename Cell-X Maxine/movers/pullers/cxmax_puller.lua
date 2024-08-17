name = "CX-Max Puller"
id = "CXMAX_PULLER"
author = "traincrisis"
texture = "cxmax_puller.png"
updateIndex = 9000

function Step(this)
    PullCells(this, this.direction)
end

function PullCells(this, dir)
    local oppositeDir = (dir + 2) % 4
    local step = 1
    local foundCells = false

    -- Ensure there's an empty cell ahead of the Puller
    if this:GetCell(dir, 1) and this:GetCell(dir, 1).name == "EMPTY" then
        local lastCell = nil
        -- Find the last cell in the sequence
        while true do
            local cell = this:GetCell(oppositeDir, step)
            if cell and cell.name ~= "EMPTY" then
                lastCell = cell
                step = step + 1
                foundCells = true
            else
                break
            end
        end
        -- Push the last cell found
        if lastCell then
            lastCell:Push(dir, 1)
        end
        -- Act like a Mover if no cells to pull and empty cell behind
        if not foundCells and this:GetCell(oppositeDir, 1) and this:GetCell(oppositeDir, 1).name == "EMPTY" then
            this:Push(dir, 1)
        end
    end
end

