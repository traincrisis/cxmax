name = "CX-Max Anti-Trigenerator"
id = "CXMAX_ANTITRIGENERATOR"
author = "traincrisis"
texture = "cxmax_antitrigenerator.png"
updateIndex = 15130

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Step(this)
    local cellBehind = this:GetCell(this.direction, -1)
    local rightDirection = (this.direction + 1) % 4
    local leftDirection = (this.direction + 3) % 4
    local frontDirection = this.direction
    local cellRight = this:GetCell(rightDirection, 1)
    local cellLeft = this:GetCell(leftDirection, 1)
    local cellFront = this:GetCell(frontDirection, 1)

    -- Check if the cell on the right matches the cell behind
    if cellBehind and cellRight and cellBehind.name == cellRight.name then
        -- Destroy the cell on the right
        cellRight.Delete()
        this.PlaySound("cxmax_trashed.wav")
    end

    -- Check if the cell on the left matches the cell behind
    if cellBehind and cellLeft and cellBehind.name == cellLeft.name then
        -- Destroy the cell on the left
        cellLeft.Delete()
        this.PlaySound("cxmax_trashed.wav")
    end

    -- Check if the cell in front matches the cell behind
    if cellBehind and cellFront and cellBehind.name == cellFront.name then
        -- Destroy the cell in front
        cellFront.Delete()
        this.PlaySound("cxmax_trashed.wav")
    end
end

