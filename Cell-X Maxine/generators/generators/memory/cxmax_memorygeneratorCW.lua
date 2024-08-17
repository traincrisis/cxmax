-- Memory CW Generator
name = "CX-Max Memory CW Generator"
id = "CXMAX_MEMORYGENERATORCW"
author = "traincrisis"
texture = "cxmax_memorygeneratorCW.png"
updateIndex = 9014

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
        
        -- Push cells to the right
        local rightDirection = (this.direction + 1) % 4
        this.GetCell(rightDirection, 1).Push(rightDirection, 1)
        
        -- Output the cell to the right
        local rightCell = this.GetCell(rightDirection, 1)
        if rightCell.name == "EMPTY" then
            grid.CreateCell(backCell.name, rightCell.x, rightCell.y, backCell.direction)
        end
    else
        -- If no cells behind, generate the remembered cell with remembered direction
        if rememberedCell ~= "EMPTY" then
            -- Push cells to the right
            local rightDirection = (this.direction + 1) % 4
            this.GetCell(rightDirection, 1).Push(rightDirection, 1)
            
            -- Output the remembered cell to the right
            local rightCell = this.GetCell(rightDirection, 1)
            if rightCell.name == "EMPTY" then
                grid.CreateCell(rememberedCell, rightCell.x, rightCell.y, rememberedDirection)
            end
        end
    end
end

