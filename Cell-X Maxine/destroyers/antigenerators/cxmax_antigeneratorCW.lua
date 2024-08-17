name = "CX-Max CW Anti-Generator"
id = "CXMAX_ANTIGENERATORCW"
author = "traincrisis"
texture = "cxmax_antigeneratorCW.png"
updateIndex = 15100

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Step(this)
    local cellBehind = this.GetCell(this.direction, -1)
    local rightDirection = (this.direction + 1) % 4
    local cellRight = this.GetCell(rightDirection, 1)

    -- Check if the cell on the right matches the cell behind
    if cellBehind and cellRight and cellBehind.name == cellRight.name then
        -- Destroy the cell on the right
        cellRight.Delete()
        this.PlaySound("cxmax_trashed.wav")
    end
end

