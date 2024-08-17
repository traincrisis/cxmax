name = "CX-Max Hungry AI"
id = "CXMAX_HUNGRYAI"
author = "traincrisis"
texture = "cxmax_hungryAI.png"
updateIndex = 22000

local lastEaten = 0

-- Define the blacklist of cells that should not be eaten
local blacklist = {
    ["CXMAX_WALL"] = true,
    ["CXMAX_GHOSTWALL"] = true,
    ["CXMAX_GENERATABLEWALL"] = true,
    ["CXMAX_ROTATABLEWALL"] = true,
    ["CXMAX_TRASH"] = true,
    ["CXMAX_SEMITRASH"] = true,
    ["CXMAX_QUASITRASH"] = true,
    ["CXMAX_HEMITRASH"] = true,
    ["CXMAX_PHANTOM"] = true,
    ["CXMAX_SEMIPHANTOM"] = true,
    ["CXMAX_QUASIPHANTOM"] = true,
    ["CXMAX_HEMIPHANTOM"] = true
}

function Setup(this, x, y, rot, gen)
    -- Initialize the lastEaten timer
    lastEaten = 0
    this.Setup(x, y, rot, gen)
end

function Start(this)
    -- Initialize the lastEaten timer when the cell starts
    lastEaten = 0
end

function Step(this)
    local canPush = this.Push(this.direction, 1)

    if not canPush then
        -- Rotate like a Mover AI if it cannot push
        this.SetDirection((this.direction + 1) % 4)
        return
    end

    local cellAhead = this.GetCell(this.direction, 1)

    -- Eat the cell ahead if it's not in the blacklist
    if cellAhead and cellAhead.name ~= "EMPTY" and not blacklist[cellAhead.name] then
        cellAhead.Delete()
        lastEaten = 0

        -- Spawn a Fungal Virus 2 cells behind only after eating a cell
        local behindDirection = (this.direction + 2) % 4
        local behindCell = this.GetCell(behindDirection, 2)
        if behindCell and behindCell.name ~= "CXMAX_FUNGALVIRUS" then
            grid.CreateCell("CXMAX_FUNGALVIRUS", behindCell.x, behindCell.y, behindDirection)
        end
    end

    -- Increment the timer
    lastEaten = lastEaten + 1

    -- Check if it hasn't eaten for 100 ticks
    if lastEaten >= 100 then
        -- Transform into a Mover AI
        grid.CreateCell("CXMAX_MOVERAI", this.x, this.y, this.direction)
        this.Delete()
    end
end

