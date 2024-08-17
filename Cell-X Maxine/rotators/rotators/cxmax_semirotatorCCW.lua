name = "CX-Max CCW Semi-Rotator"
id = "CXMAX_SEMIROTATORCCW"
author = "traincrisis"
texture = "cxmax_semirotatorCCW.png"
updateIndex = 5058

function Step(this)
    local cellAhead = this.GetCell(this.direction, 1)
    local cellBehind = this.GetCell(this.direction, -1)

    if cellAhead.name ~= "EMPTY" then
        cellAhead.Rotate(-1)
    end

    if cellBehind.name ~= "EMPTY" then
        cellBehind.Rotate(-1)
    end
end

