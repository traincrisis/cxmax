name = "CX-Max Anti-CW Valve Generator"
id = "CXMAX_ANTIVALVEGENERATORCW"
author = "traincrisis"
texture = "cxmax_antivalvegeneratorCW.png"
updateIndex = 15150

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Step(this)
    local cellBehind = this:GetCell(this.direction, -1)
    local frontDirection = this.direction
    local rightDirection = (this.direction + 1) % 4
    local cellFront = this:GetCell(frontDirection, 1)
    local cellRight = this:GetCell(rightDirection, 1)

    -- Check if the cell in front matches the cell behind
    if cellBehind and cellFront and cellBehind.name == cellFront.name then
        -- Destroy the cell in front
        cellFront.Delete()
        this.PlaySound("cxmax_trashed.wav")
    end

    -- Check if the cell on the right matches the cell behind
    if cellBehind and cellRight and cellBehind.name == cellRight.name then
        -- Destroy the cell on the right
        cellRight.Delete()
        this.PlaySound("cxmax_trashed.wav")
    end
end

