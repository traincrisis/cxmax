name = "CX-Max CCW Hemi-Rotator"
id = "CXMAX_HEMIROTATORCCW"
author = "traincrisis"
texture = "cxmax_hemirotatorCCW.png"
updateIndex = 5060

function Step(this)
    local cellAhead = this.GetCell(this.direction, 1)
    local cellLeft = this.GetCell((this.direction + 3) % 4, 1) -- Left direction relative to the current direction

    if cellAhead.name ~= "EMPTY" then
        cellAhead.Rotate(-1)
    end

    if cellLeft.name ~= "EMPTY" then
        cellLeft.Rotate(-1)
    end
end

