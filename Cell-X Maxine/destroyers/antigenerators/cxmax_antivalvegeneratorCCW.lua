name = "CX-Max Anti-CCW Valve Generator"
id = "CXMAX_ANTIVALVEGENERATORCCW"
author = "traincrisis"
texture = "cxmax_antivalvegeneratorCCW.png"
updateIndex = 15160

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Step(this)
    local cellBehind = this:GetCell(this.direction, -1)
    local frontDirection = this.direction
    local leftDirection = (this.direction + 3) % 4
    local cellFront = this:GetCell(frontDirection, 1)
    local cellLeft = this:GetCell(leftDirection, 1)

    -- Check if the cell in front matches the cell behind
    if cellBehind and cellFront and cellBehind.name == cellFront.name then
        -- Destroy the cell in front
        cellFront.Delete()
        this.PlaySound("cxmax_trashed.wav")
    end

    -- Check if the cell on the left matches the cell behind
    if cellBehind and cellLeft and cellBehind.name == cellLeft.name then
        -- Destroy the cell on the left
        cellLeft.Delete()
        this.PlaySound("cxmax_trashed.wav")
    end
end

