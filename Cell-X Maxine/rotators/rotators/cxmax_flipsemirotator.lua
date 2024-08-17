name = "CX-Max Flip Semi-Rotator"
id = "CXMAX_SEMIROTATORFLIP"
author = "traincrisis"
texture = "cxmax_flipsemirotator.png"
updateIndex = 5062

function Step(this)
    local cellAhead = this.GetCell(this.direction, 1)
    local cellBehind = this.GetCell(this.direction, -1)

    if cellAhead.name ~= "EMPTY" then
        cellAhead.Rotate(2)
    end

    if cellBehind.name ~= "EMPTY" then
        cellBehind.Rotate(2)
    end
end

