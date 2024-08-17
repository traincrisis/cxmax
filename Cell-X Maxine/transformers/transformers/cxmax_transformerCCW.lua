name = "CX-Max CCW Transformer"
id = "CXMAX_TRANSFORMERCCW"
author = "traincrisis"
texture = "cxmax_transformerCCW.png"
updateIndex = 29000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Step(this)
    -- Direction offsets for getting cells
    local leftDirection = (this.direction + 3) % 4  -- CCW direction (left)
    local behindDirection = (this.direction + 2) % 4

    -- Get the cells to the left and behind the Transformer
    local cellLeft = this.GetCell(leftDirection, 1)
    local cellBehind = this.GetCell(behindDirection, 1)

    if cellBehind and cellLeft and cellBehind.name ~= "EMPTY" and cellLeft.name ~= "EMPTY" then
        -- Delete the cell to the left
        cellLeft.Delete()
        
        -- Create the cell from behind at the cell to the left's position
        grid.CreateCell(cellBehind.name, cellLeft.x, cellLeft.y, cellBehind.direction)
    end
end

