name = "CX-Max Transformer"
id = "CXMAX_TRANSFORMER"
author = "traincrisis"
texture = "cxmax_transformer.png"
updateIndex = 27000

function Step(this)
    local cellBehind = this.GetCell((this.direction + 2) % 4, 1)
    local cellAhead = this.GetCell(this.direction, 1)

    if cellBehind.name ~= "EMPTY" and cellAhead.name ~= "EMPTY" then
        cellAhead.Delete()
        grid.CreateCell(cellBehind.name, cellAhead.x, cellAhead.y, cellBehind.direction)
    end
end

