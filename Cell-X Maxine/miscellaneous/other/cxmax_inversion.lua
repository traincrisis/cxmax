name = "CX-Max Inversion"
id = "CXMAX_INVERSION"
author = "traincrisis"
texture = "cxmax_inversion.png"
updateIndex = 26000

function Push(this, dir, bias)
    -- Calculate the opposite direction
    local oppositeDir = (dir + 2) % 4
    local pushAmount = 9999  -- The push bias; adjust if needed
    this.Push(oppositeDir, pushAmount)
end

