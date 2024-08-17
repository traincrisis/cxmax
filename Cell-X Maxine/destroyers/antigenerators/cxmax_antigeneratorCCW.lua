name = "CX-Max CCW Anti-Generator"
id = "CXMAX_ANTIGENERATORCCW"
author = "traincrisis"
texture = "cxmax_antigeneratorCCW.png"
updateIndex = 15110

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Step(this)
    local cellBehind = this.GetCell(this.direction, -1)
    local leftDirection = (this.direction + 3) % 4
    local cellLeft = this.GetCell(leftDirection, 1)

    -- Check if the cell on the left matches the cell behind
    if cellBehind and cellLeft and cellBehind.name == cellLeft.name then
        -- Destroy the cell on the left
        cellLeft.Delete()
        this.PlaySound("cxmax_trashed.wav")
    end
end

