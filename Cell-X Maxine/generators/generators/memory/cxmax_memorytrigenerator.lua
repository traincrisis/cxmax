-- Memory Trigenerator
name = "CX-Max Memory Trigenerator"
id = "CXMAX_MEMORYTRIGENERATOR"
author = "traincrisis"
texture = "cxmax_memorytrigenerator.png"
updateIndex = 9017

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

    -- Generate the remembered cell on the left side and push cells if needed
    local leftDirection = (this.direction + 3) % 4
    local leftOutputCell = this.GetCell(leftDirection, 1)
    if leftOutputCell.name ~= "EMPTY" then
        leftOutputCell.Push(leftDirection, 1)
        leftOutputCell = this.GetCell(leftDirection, 1)
    end
    if leftOutputCell.name == "EMPTY" and rememberedCell ~= "EMPTY" then
        grid.CreateCell(rememberedCell, leftOutputCell.x, leftOutputCell.y, rememberedDirection)
    end

    -- Generate the remembered cell on the right side and push cells if needed
    local rightDirection = (this.direction + 1) % 4
    local rightOutputCell = this.GetCell(rightDirection, 1)
    if rightOutputCell.name ~= "EMPTY" then
        rightOutputCell.Push(rightDirection, 1)
        rightOutputCell = this.GetCell(rightDirection, 1)
    end
    if rightOutputCell.name == "EMPTY" and rememberedCell ~= "EMPTY" then
        grid.CreateCell(rememberedCell, rightOutputCell.x, rightOutputCell.y, rememberedDirection)
    end

    -- Generate the remembered cell in the front direction and push cells if needed
    local frontOutputCell = this.GetCell(this.direction, 1)
    if frontOutputCell.name ~= "EMPTY" then
        frontOutputCell.Push(this.direction, 1)
        frontOutputCell = this.GetCell(this.direction, 1)
    end
    if frontOutputCell.name == "EMPTY" and rememberedCell ~= "EMPTY" then
        grid.CreateCell(rememberedCell, frontOutputCell.x, frontOutputCell.y, rememberedDirection)
    end
end

