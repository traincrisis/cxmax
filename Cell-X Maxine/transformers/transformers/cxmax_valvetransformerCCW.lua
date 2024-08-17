name = "CX-Max CCW Valve Transformer"
id = "CXMAX_VALVETRANSFORMERCCW"
author = "traincrisis"
texture = "cxmax_valvetransformerCCW.png"
updateIndex = 33000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Step(this)
    -- Direction offsets for getting cells
    local leftDirection = (this.direction + 3) % 4  -- CCW direction (left)
    local aheadDirection = this.direction
    local behindDirection = (this.direction + 2) % 4

    -- Get the cells to the left, ahead, and behind the Transformer
    local cellLeft = this.GetCell(leftDirection, 1)
    local cellAhead = this.GetCell(aheadDirection, 1)
    local cellBehind = this.GetCell(behindDirection, 1)

    if cellBehind and cellLeft and cellAhead and 
       cellBehind.name ~= "EMPTY" and 
       cellLeft.name ~= "EMPTY" and 
       cellAhead.name ~= "EMPTY" then
        -- Delete the cells to the left and ahead
        cellLeft.Delete()
        cellAhead.Delete()
        
        -- Create the cell from behind at the left and ahead's positions
        grid.CreateCell(cellBehind.name, cellLeft.x, cellLeft.y, cellBehind.direction)
        grid.CreateCell(cellBehind.name, cellAhead.x, cellAhead.y, cellBehind.direction)
    end
end

