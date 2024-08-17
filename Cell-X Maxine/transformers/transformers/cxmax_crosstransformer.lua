name = "CX-Max Cross Transformer"
id = "CXMAX_CROSSTRANSFORMER"
author = "traincrisis"
texture = "cxmax_crosstransformer.png"
updateIndex = 34000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Step(this)
    -- Direction offsets for getting cells
    local frontDirection = this.direction
    local backDirection = (this.direction + 2) % 4
    local rightDirection = (this.direction + 1) % 4
    local leftDirection = (this.direction + 3) % 4

    -- Get the cells on the front, back, right, and left of the Transformer
    local cellFront = this.GetCell(frontDirection, 1)
    local cellBack = this.GetCell(backDirection, 1)
    local cellRight = this.GetCell(rightDirection, 1)
    local cellLeft = this.GetCell(leftDirection, 1)

    if cellBack and cellFront and cellRight and cellLeft and 
       cellBack.name ~= "EMPTY" and 
       cellFront.name ~= "EMPTY" and 
       cellRight.name ~= "EMPTY" and 
       cellLeft.name ~= "EMPTY" then
        -- Delete the cells on the front and left
        cellFront.Delete()
        cellLeft.Delete()
        
        -- Create the cells from the back and right at the front and left's positions
        grid.CreateCell(cellBack.name, cellFront.x, cellFront.y, cellBack.direction)
        grid.CreateCell(cellRight.name, cellLeft.x, cellLeft.y, cellRight.direction)
    end
end

