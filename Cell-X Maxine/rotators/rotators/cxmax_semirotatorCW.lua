name = "CX-Max CW Semi-Rotator"
id = "CXMAX_SEMIROTATORCW"
author = "traincrisis"
texture = "cxmax_semirotatorCW.png"
updateIndex = 2001

function Step(this)
    local cellAhead = this.GetCell(this.direction, 1)
    local cellBehind = this.GetCell(this.direction, -1)

    if cellAhead.name ~= "EMPTY" then
        cellAhead.Rotate(1)
    end

    if cellBehind.name ~= "EMPTY" then
        cellBehind.Rotate(1)
    end
end

