-- Memory Bigenerator
name = "CX-Max Memory Bigenerator"
id = "CXMAX_MEMORYBIGENERATOR"
author = "traincrisis"
texture = "cxmax_memorybigenerator.png"
updateIndex = 9016

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
end

