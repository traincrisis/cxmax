name = "CX-Max CW Valve Transformer"
id = "CXMAX_VALVETRANSFORMERCW"
author = "traincrisis"
texture = "cxmax_valvetransformerCW.png"
updateIndex = 32000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Step(this)
    -- Direction offsets for getting cells
    local rightDirection = (this.direction + 1) % 4  -- CW direction (right)
    local aheadDirection = this.direction
    local behindDirection = (this.direction + 2) % 4

    -- Get the cells to the right, ahead, and behind the Transformer
    local cellRight = this.GetCell(rightDirection, 1)
    local cellAhead = this.GetCell(aheadDirection, 1)
    local cellBehind = this.GetCell(behindDirection, 1)

    if cellBehind and cellRight and cellAhead and 
       cellBehind.name ~= "EMPTY" and 
       cellRight.name ~= "EMPTY" and 
       cellAhead.name ~= "EMPTY" then
        -- Delete the cells to the right and ahead
        cellRight.Delete()
        cellAhead.Delete()
        
        -- Create the cell from behind at the right and ahead's positions
        grid.CreateCell(cellBehind.name, cellRight.x, cellRight.y, cellBehind.direction)
        grid.CreateCell(cellBehind.name, cellAhead.x, cellAhead.y, cellBehind.direction)
    end
end

