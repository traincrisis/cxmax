name = "CX-Max Cross Memory Generator"
id = "CXMAX_CROSSMEMORYGENERATOR"
author = "traincrisis"
texture = "cxmax_crossmemorygenerator.png"
updateIndex = 9021

-- Remembered cells and directions
local rememberedBackCell = "EMPTY"
local rememberedBackDirection = 0
local rememberedRightCell = "EMPTY"
local rememberedRightDirection = 0

function Start(this)
    -- Reset remembered cells and directions at the start
    rememberedBackCell = "EMPTY"
    rememberedBackDirection = 0
    rememberedRightCell = "EMPTY"
    rememberedRightDirection = 0
end

function Step(this)
    -- Handle memory for the cell behind
    local backCell = this.GetCell(this.direction, -1)
    if backCell.name ~= "EMPTY" then
        rememberedBackCell = backCell.name
        rememberedBackDirection = backCell.direction
    end

    -- Handle memory for the cell to the right
    local rightDirection = (this.direction + 1) % 4
    local rightCell = this.GetCell(rightDirection, 1)
    if rightCell.name ~= "EMPTY" then
        rememberedRightCell = rightCell.name
        rememberedRightDirection = rightCell.direction
    end

    -- Only push cells if there is memory
    if rememberedBackCell ~= "EMPTY" then
        PushCells(this, this.direction)  -- Front
    end

    if rememberedRightCell ~= "EMPTY" then
        PushCells(this, (this.direction + 3) % 4)  -- Left
    end

    -- Generate new cells based on memory
    if rememberedBackCell ~= "EMPTY" then
        GenerateCell(this, this.direction, rememberedBackCell, rememberedBackDirection)  -- Front
    end

    if rememberedRightCell ~= "EMPTY" then
        GenerateCell(this, (this.direction + 3) % 4, rememberedRightCell, rememberedRightDirection)  -- Left
    end
end

function PushCells(this, direction)
    local cell = this.GetCell(direction, 1)
    if cell.name ~= "EMPTY" then
        cell.Push(direction, 1)
    end
end

function GenerateCell(this, direction, memoryCell, memoryDirection)
    local cell = this.GetCell(direction, 1)
    if cell.name == "EMPTY" then
        grid.CreateCell(memoryCell, cell.x, cell.y, memoryDirection)
    end
end

