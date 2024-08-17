name = "CX-Max CW Hemi-Rotator"
id = "CXMAX_HEMIROTATORCW"
author = "traincrisis"
texture = "cxmax_hemirotatorCW.png"
updateIndex = 5056

function Step(this)
    -- Rotate cell on the front
    local frontCell = this.GetCell(this.direction, 1)
    if frontCell.name ~= "EMPTY" then
        frontCell.Rotate(1)
    end

    -- Rotate cell on the left side
    local leftDirection = (this.direction + 3) % 4
    local leftCell = this.GetCell(leftDirection, 1)
    if leftCell.name ~= "EMPTY" then
        leftCell.Rotate(1)
    end
end

