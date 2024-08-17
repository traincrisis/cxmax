name = "CX-Max Random Hemi-Rotator"
id = "CXMAX_HEMIROTATORRNG"
author = "traincrisis"
texture = "cxmax_hemirotatorRNG.png"
updateIndex = 5068

function Step(this)
    math.randomseed(os.time())  -- Set random seed based on OS time

    local cellAhead = this.GetCell(this.direction, 1)
    local cellLeft = this.GetCell((this.direction + 3) % 4, 1)

    if cellAhead.name ~= "EMPTY" then
        local rotation = math.random(0, 1) * 2 - 1  -- Randomly choose -1 (CCW) or 1 (CW)
        cellAhead.Rotate(rotation)
    end

    if cellLeft.name ~= "EMPTY" then
        local rotation = math.random(0, 1) * 2 - 1
        cellLeft.Rotate(rotation)
    end
end

