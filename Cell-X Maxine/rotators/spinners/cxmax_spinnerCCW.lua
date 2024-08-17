name = "CX-Max CCW Spinner"
id = "CXMAX_SPINNERCCW"
author = "traincrisis"
texture = "cxmax_spinnerCCW.png"
updateIndex = 6001

function Step(this)
    -- Get the four adjacent cells in counter-clockwise order
    local adjacent = {
        this.GetCell(this.direction, 1),  -- Right
        this.GetCell((this.direction + 3) % 4, 1),  -- Top
        this.GetCell((this.direction + 2) % 4, 1),  -- Left
        this.GetCell((this.direction + 1) % 4, 1)   -- Bottom
    }

    -- Store the positions of the cells
    local positions = {}
    for i, cell in ipairs(adjacent) do
        positions[i] = {x = cell.x, y = cell.y}
    end

    -- Delete all adjacent cells
    for _, cell in ipairs(adjacent) do
        if cell.name ~= "EMPTY" then
            cell.Delete()
        end
    end

    -- Create new cells in their new positions and rotate them CCW
    for i, cell in ipairs(adjacent) do
        local newDir = (this.direction + i - 1) % 4  -- Calculate new direction CCW
        local newPos = positions[(i % 4) + 1]       -- Rotate positions in a circular manner

        if cell.name ~= "EMPTY" then
            grid.CreateCell(cell.name, newPos.x, newPos.y, newDir)
        end
    end
end

