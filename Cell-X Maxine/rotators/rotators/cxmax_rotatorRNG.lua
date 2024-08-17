name = "CX-Max Random Rotator"
id = "CXMAX_ROTATORRNG"
author = "traincrisis"
texture = "cxmax_rotatorRNG.png"
updateIndex = 5065

function Step(this)
    math.randomseed(os.time())  -- Set random seed based on OS time

    for rot = 0, 3 do
        if this.GetCell(rot, 1).name ~= "EMPTY" then
            local rotation = math.random(0, 1) * 2 - 1  -- Randomly choose -1 (CCW) or 1 (CW)
            this.GetCell(rot, 1).Rotate(rotation)
        end
    end
end

