name = "CX-Max Flip Spinner"
id = "CXMAX_FLIPSPINNER"
author = "traincrisis"
texture = "cxmax_flipspinner.png"
updateIndex = 6002

function Step(this)
    -- Get the cells on the front and back
    local frontCell = this.GetCell(this.direction, 1)
    local backCell = this.GetCell((this.direction + 2) % 4, 1)

    -- Store the positions of the cells
    local frontPos = {x = frontCell.x, y = frontCell.y}
    local backPos = {x = backCell.x, y = backCell.y}

    -- Rotate cells 180 degrees
    if frontCell.name ~= "EMPTY" then
        frontCell.Rotate(2)
    end
    if backCell.name ~= "EMPTY" then
        backCell.Rotate(2)
    end

    -- Delete the cells
    if frontCell.name ~= "EMPTY" then
        frontCell.Delete()
    end
    if backCell.name ~= "EMPTY" then
        backCell.Delete()
    end

    -- Create new cells in swapped positions
    if frontCell.name ~= "EMPTY" then
        grid.CreateCell(frontCell.name, backPos.x, backPos.y, frontCell.rotation)
    end
    if backCell.name ~= "EMPTY" then
        grid.CreateCell(backCell.name, frontPos.x, frontPos.y, backCell.rotation)
    end
end

