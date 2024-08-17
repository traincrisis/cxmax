name = "CX-Max Anti-Generator"
id = "CXMAX_ANTIGENERATOR"
author = "traincrisis"
texture = "cxmax_antigenerator.png"
updateIndex = 15000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Step(this)
    local cellBehind = this.GetCell(this.direction, -1)
    local cellAhead = this.GetCell(this.direction, 1)

    -- Check if the cell ahead matches the cell behind
    if cellBehind and cellAhead and cellBehind.name == cellAhead.name then
        -- Destroy the cell ahead
        cellAhead.Delete()
        this.PlaySound("cxmax_trashed.wav")
    end
end

