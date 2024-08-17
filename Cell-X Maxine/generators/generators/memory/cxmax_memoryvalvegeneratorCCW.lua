name = "CX-Max Memory CCW Valve Generator"
id = "CXMAX_MEMORYVALVEGENERATORCCW"
author = "traincrisis"
texture = "cxmax_memoryvalvegeneratorCCW.png"
updateIndex = 9019

-- Remembered cell and direction
local rememberedCell = "EMPTY"
local rememberedDirection = 0

function Start(this)
    -- Reset remembered cell and direction at the start
    rememberedCell = "EMPTY"
    rememberedDirection = 0
end

function Step(this)
    -- Handle memory for the cell behind
    local backCell = this.GetCell(this.direction, -1)
    if backCell.name ~= "EMPTY" then
        rememberedCell = backCell.name
        rememberedDirection = backCell.direction
    end

    -- Push cells
    PushCells(this, this.direction)
    PushCells(this, (this.direction + 3) % 4)  -- Left direction

    -- Generate new cells
    GenerateCell(this, this.direction)
    GenerateCell(this, (this.direction + 3) % 4)  -- Left direction
end

function PushCells(this, direction)
    local cell = this.GetCell(direction, 1)
    if cell.name ~= "EMPTY" then
        cell.Push(direction, 1)
    end
end

function GenerateCell(this, direction)
    local cell = this.GetCell(direction, 1)
    if cell.name == "EMPTY" then
        grid.CreateCell(rememberedCell, cell.x, cell.y, rememberedDirection)
    end
end

