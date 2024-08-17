name = "CX-Max Random Quasi-Rotator"
id = "CXMAX_QUASIROTATORRNG"
author = "traincrisis"
texture = "cxmax_quasirotatorRNG.png"
updateIndex = 5067

function Step(this)
    math.randomseed(os.time())  -- Set random seed based on OS time

    local cellAhead = this.GetCell(this.direction, 1)

    if cellAhead.name ~= "EMPTY" then
        local rotation = math.random(0, 1) * 2 - 1  -- Randomly choose -1 (CCW) or 1 (CW)
        cellAhead.Rotate(rotation)
    end
end

