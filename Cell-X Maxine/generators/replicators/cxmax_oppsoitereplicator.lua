name = "CX-Max Opposite Replicator"
id = "CXMAX_OPPOSITEREPLICATOR"
author = "traincrisis"
texture = "cxmax_oppositereplicator.png"
updateIndex = 1000

function Step(this)
    local frontDirection = this.direction
    local backDirection = (frontDirection + 2) % 4

    -- Handle front replication
    local cellAhead = this.GetCell(frontDirection, 1)
    if cellAhead.name ~= "EMPTY" and cellAhead.name ~= "ENEMY" then
        if this.GetCell(frontDirection, 2).Push(frontDirection, 1)[1] then
            local newCell = this.GetCell(frontDirection, 2)
            grid.CreateCell(cellAhead.name, newCell.x, newCell.y, cellAhead.direction)
        end
    end

    -- Handle back replication
    local cellBehind = this.GetCell(backDirection, 1)
    if cellBehind.name ~= "EMPTY" and cellBehind.name ~= "ENEMY" then
        if this.GetCell(backDirection, 2).Push(backDirection, 1)[1] then
            local newCell = this.GetCell(backDirection, 2)
            grid.CreateCell(cellBehind.name, newCell.x, newCell.y, cellBehind.direction)
        end
    end
end

