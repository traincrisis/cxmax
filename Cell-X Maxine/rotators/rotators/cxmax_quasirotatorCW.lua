name = "CX-Max CW Quasi-Rotator"
id = "CXMAX_QUASIROTATORCW"
author = "traincrisis"
texture = "cxmax_quasirotatorCW.png"
updateIndex = 5055

function Step(this)
    local cellAhead = this.GetCell(this.direction, 1)

    if cellAhead.name ~= "EMPTY" then
        cellAhead.Rotate(1)
    end
end

