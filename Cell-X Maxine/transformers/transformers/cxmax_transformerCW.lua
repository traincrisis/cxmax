name = "CX-Max CW Transformer"
id = "CXMAX_TRANSFORMERCW"
author = "traincrisis"
texture = "cxmax_transformerCW.png"
updateIndex = 28000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Step(this)
    -- Direction offsets for getting cells
    local rightDirection = (this.direction + 1) % 4
    local behindDirection = (this.direction + 2) % 4

    -- Get the cells to the right and behind the Transformer
    local cellRight = this.GetCell(rightDirection, 1)
    local cellBehind = this.GetCell(behindDirection, 1)

    if cellBehind and cellRight and cellBehind.name ~= "EMPTY" and cellRight.name ~= "EMPTY" then
        -- Delete the cell to the right
        cellRight.Delete()
        
        -- Create the cell from behind at the cell to the right's position
        grid.CreateCell(cellBehind.name, cellRight.x, cellRight.y, cellBehind.direction)
    end
end

