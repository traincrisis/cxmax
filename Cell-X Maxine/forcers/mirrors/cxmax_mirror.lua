name = "CX-Max Mirror"
id = "CXMAX_MIRROR"
author = "traincrisis"
texture = "cxmax_mirror.png"
updateIndex = 10000

function Step(this)
    local frontDir = this.direction
    local backDir = (frontDir + 2) % 4

    -- Get cells in front and behind the Mirror
    local frontCell = this:GetCell(frontDir, 1)
    local backCell = this:GetCell(backDir, 1)

    -- Ensure both cells are present and not empty
    if frontCell and backCell and frontCell.name ~= "EMPTY" and backCell.name ~= "EMPTY" then
        -- Swap the cells
        local frontCellName = frontCell.name
        local frontCellDir = frontCell.direction
        local backCellName = backCell.name
        local backCellDir = backCell.direction

        -- Get positions
        local frontPos = {x = frontCell.x, y = frontCell.y}
        local backPos = {x = backCell.x, y = backCell.y}

        -- Delete the original cells
        frontCell:Delete()
        backCell:Delete()

        -- Create new cells in swapped positions
        grid.CreateCell(backCellName, frontPos.x, frontPos.y, backCellDir)
        grid.CreateCell(frontCellName, backPos.x, backPos.y, frontCellDir)
    end
end

