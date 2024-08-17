name = "CX-Max CCW Quasi-Rotator"
id = "CXMAX_QUASIROTATORCCW"
author = "traincrisis"
texture = "cxmax_quasirotatorCCW.png"
updateIndex = 5059

function Step(this)
    local cellAhead = this.GetCell(this.direction, 1)

    if cellAhead.name ~= "EMPTY" then
        cellAhead.Rotate(-1)
    end
end

