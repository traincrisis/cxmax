name = "CX-Max Flip Hemi-Rotator"
id = "CXMAX_HEMIROTATORFLIP"
author = "traincrisis"
texture = "cxmax_fliphemirotator.png"
updateIndex = 5064

function Step(this)
    local cellAhead = this.GetCell(this.direction, 1)
    local cellLeft = this.GetCell((this.direction + 3) % 4, 1)

    if cellAhead.name ~= "EMPTY" then
        cellAhead.Rotate(2)
    end

    if cellLeft.name ~= "EMPTY" then
        cellLeft.Rotate(2)
    end
end

