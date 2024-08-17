name = "CX-Max Repulsor"
id = "CXMAX_REPULSOR"
author = "traincrisis"
texture = "cxmax_repulsor.png"
updateIndex = 7000

function Step(this)
    -- Get the four adjacent cells in clockwise order
    local adjacent = {
        this.GetCell(this.direction, 1),  -- Right
        this.GetCell((this.direction + 1) % 4, 1),  -- Bottom
        this.GetCell((this.direction + 2) % 4, 1),  -- Left
        this.GetCell((this.direction + 3) % 4, 1)   -- Top
    }

    -- Push all adjacent cells away from the Repulsor
    for i, cell in ipairs(adjacent) do
        if cell.name ~= "EMPTY" then
            local pushDirection = (this.direction + i - 1) % 4
            cell.Push(pushDirection, 1)
        end
    end
end

