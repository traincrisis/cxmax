name = "CX-Max Flip Quasi-Rotator"
id = "CXMAX_QUASIROTATORFLIP"
author = "traincrisis"
texture = "cxmax_flipquasirotator.png"
updateIndex = 5063

function Step(this)
    local cellAhead = this.GetCell(this.direction, 1)

    if cellAhead.name ~= "EMPTY" then
        cellAhead.Rotate(2)
    end
end

