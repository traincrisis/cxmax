name = "CX-Max Replicator"
id = "CXMAX_REPLICATOR"
author = "traincrisis"
texture = "cxmax_replicator.png"
updateIndex = 1000

function Step(this)
    local cellAhead = this.GetCell(this.direction, 1)

    if cellAhead.name ~= "EMPTY" and cellAhead.name ~= "ENEMY" then
        if this.GetCell(this.direction, 2).Push(this.direction, 1)[1] then
            local newCell = this.GetCell(this.direction, 2)
            grid.CreateCell(cellAhead.name, newCell.x, newCell.y, cellAhead.direction)
        end
    end
end

