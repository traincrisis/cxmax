name = "CX-Max Random Semi-Rotator"
id = "CXMAX_SEMIROTATORRNG"
author = "traincrisis"
texture = "cxmax_semirotatorRNG.png"
updateIndex = 5066

function Step(this)
    math.randomseed(os.time())  -- Set random seed based on OS time

    local cellAhead = this.GetCell(this.direction, 1)
    local cellBehind = this.GetCell(this.direction, -1)

    if cellAhead.name ~= "EMPTY" then
        local rotation = math.random(0, 1) * 2 - 1  -- Randomly choose -1 (CCW) or 1 (CW)
        cellAhead.Rotate(rotation)
    end

    if cellBehind.name ~= "EMPTY" then
        local rotation = math.random(0, 1) * 2 - 1
        cellBehind.Rotate(rotation)
    end
end

