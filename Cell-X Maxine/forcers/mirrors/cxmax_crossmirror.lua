name = "CX-Max Cross Mirror"
id = "CXMAX_CROSSMIRROR"
author = "traincrisis"
texture = "cxmax_crossmirror.png"
updateIndex = 1000

function Step(this)
    -- Horizontal swap (left-right)
    local frontDirH = 0
    local backDirH = 2

    -- Vertical swap (up-down)
    local frontDirV = 1
    local backDirV = 3

    -- Swap horizontally
    local frontCellH = this:GetCell(frontDirH, 1)
    local backCellH = this:GetCell(backDirH, 1)

    if frontCellH and backCellH and frontCellH.name ~= "EMPTY" and backCellH.name ~= "EMPTY" then
        local frontCellNameH = frontCellH.name
        local frontCellDirH = frontCellH.direction
        local backCellNameH = backCellH.name
        local backCellDirH = backCellH.direction

        local frontPosH = {x = frontCellH.x, y = frontCellH.y}
        local backPosH = {x = backCellH.x, y = backCellH.y}

        frontCellH:Delete()
        backCellH:Delete()

        grid.CreateCell(backCellNameH, frontPosH.x, frontPosH.y, backCellDirH)
        grid.CreateCell(frontCellNameH, backPosH.x, backPosH.y, frontCellDirH)
    end

    -- Swap vertically
    local frontCellV = this:GetCell(frontDirV, 1)
    local backCellV = this:GetCell(backDirV, 1)

    if frontCellV and backCellV and frontCellV.name ~= "EMPTY" and backCellV.name ~= "EMPTY" then
        local frontCellNameV = frontCellV.name
        local frontCellDirV = frontCellV.direction
        local backCellNameV = backCellV.name
        local backCellDirV = backCellV.direction

        local frontPosV = {x = frontCellV.x, y = frontCellV.y}
        local backPosV = {x = backCellV.x, y = backCellV.y}

        frontCellV:Delete()
        backCellV:Delete()

        grid.CreateCell(backCellNameV, frontPosV.x, frontPosV.y, backCellDirV)
        grid.CreateCell(frontCellNameV, backPosV.x, backPosV.y, frontCellDirV)
    end
end

