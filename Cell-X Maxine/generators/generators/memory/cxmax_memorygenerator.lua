-- Memory Generator
name = "CX-Max Memory Generator"
id = "CXMAX_MEMORYGENERATOR"
author = "traincrisis"
texture = "cxmax_memorygenerator.png"
updateIndex = 9010

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
        
        -- Push cells ahead in the front direction
        this.GetCell(this.direction, 1).Push(this.direction, 1)
        
        -- Output the cell in front
        local frontCell = this.GetCell(this.direction, 1)
        if frontCell.name == "EMPTY" then
            grid.CreateCell(backCell.name, frontCell.x, frontCell.y, backCell.direction)
        end
    else
        -- If no cells behind, generate the remembered cell with remembered direction
        if rememberedCell ~= "EMPTY" then
            -- Push cells ahead in the front direction
            this.GetCell(this.direction, 1).Push(this.direction, 1)
            
            -- Output the remembered cell in front
            local frontCell = this.GetCell(this.direction, 1)
            if frontCell.name == "EMPTY" then
                grid.CreateCell(rememberedCell, frontCell.x, frontCell.y, rememberedDirection)
            end
        end
    end
end

