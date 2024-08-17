-- Memory CCW Generator
name = "CX-Max Memory CCW Generator"
id = "CXMAX_MEMORYGENERATORCCW"
author = "traincrisis"
texture = "cxmax_memorygeneratorCCW.png"
updateIndex = 9015

-- Remembered cell name and direction
local rememberedCell = "EMPTY"
local rememberedDirection = 0

function Start(this)
    -- Reset remembered cell and direction at the start
    rememberedCell = "EMPTY"
    rememberedDirection = 0
end

function Step(this)
    -- Get the cell behind the Generator
    local backCell = this.GetCell(this.direction, -1)
    
    -- If there's a cell behind, remember it
    if backCell.name ~= "EMPTY" then
        rememberedCell = backCell.name  -- Remember the cell name
        rememberedDirection = backCell.direction  -- Remember the cell direction
        
        -- Push cells to the left
        local leftDirection = (this.direction + 3) % 4
        this.GetCell(leftDirection, 1).Push(leftDirection, 1)
        
        -- Output the cell to the left
        local leftCell = this.GetCell(leftDirection, 1)
        if leftCell.name == "EMPTY" then
            grid.CreateCell(backCell.name, leftCell.x, leftCell.y, backCell.direction)
        end
    else
        -- If no cells behind, generate the remembered cell with remembered direction
        if rememberedCell ~= "EMPTY" then
            -- Push cells to the left
            local leftDirection = (this.direction + 3) % 4
            this.GetCell(leftDirection, 1).Push(leftDirection, 1)
            
            -- Output the remembered cell to the left
            local leftCell = this.GetCell(leftDirection, 1)
            if leftCell.name == "EMPTY" then
                grid.CreateCell(rememberedCell, leftCell.x, leftCell.y, rememberedDirection)
            end
        end
    end
end

