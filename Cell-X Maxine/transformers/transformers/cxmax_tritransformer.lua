name = "CX-Max Tritransformer"
id = "CXMAX_TRITRANSFORMER"
author = "traincrisis"
texture = "cxmax_tritransformer.png"
updateIndex = 31000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Step(this)
    -- Direction offsets for getting cells
    local leftDirection = (this.direction + 3) % 4  -- CCW direction (left)
    local rightDirection = (this.direction + 1) % 4  -- CW direction (right)
    local aheadDirection = this.direction
    local behindDirection = (this.direction + 2) % 4

    -- Get the cells to the left, right, ahead, and behind the Transformer
    local cellLeft = this.GetCell(leftDirection, 1)
    local cellRight = this.GetCell(rightDirection, 1)
    local cellAhead = this.GetCell(aheadDirection, 1)
    local cellBehind = this.GetCell(behindDirection, 1)

    if cellBehind and cellLeft and cellRight and cellAhead and 
       cellBehind.name ~= "EMPTY" and 
       cellLeft.name ~= "EMPTY" and 
       cellRight.name ~= "EMPTY" and 
       cellAhead.name ~= "EMPTY" then
        -- Delete the cells to the left, right, and ahead
        cellLeft.Delete()
        cellRight.Delete()
        cellAhead.Delete()
        
        -- Create the cell from behind at the left, right, and ahead's positions
        grid.CreateCell(cellBehind.name, cellLeft.x, cellLeft.y, cellBehind.direction)
        grid.CreateCell(cellBehind.name, cellRight.x, cellRight.y, cellBehind.direction)
        grid.CreateCell(cellBehind.name, cellAhead.x, cellAhead.y, cellBehind.direction)
    end
end

