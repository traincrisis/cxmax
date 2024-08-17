name = "CX-Max Slow Driller"
id = "CXMAX_SLOWDRILLER"
author = "traincrisis"
texture = "cxmax_slowdriller.png"
updateIndex = 9001

-- Counter for ticks
local tickCounter = 0

function Step(this)
    -- Increment the tick counter
    tickCounter = tickCounter + 1

    -- Move only on even ticks (every other tick)
    if tickCounter % 2 == 0 then
        local nextCell = this.GetCell(this.direction, 1)
        if nextCell.name ~= "EMPTY" then
            local x_post = this.x + 2 * DirToX(this.direction)  -- Calculate new x position 2 cells ahead of Driller
            local y_post = this.y + 2 * DirToY(this.direction)  -- Calculate new y position 2 cells ahead of Driller

            -- Create a new Slow Driller cell at the new position
            grid.CreateCell(CellID("CXMAX_SLOWDRILLER"), x_post, y_post, this.direction)

            -- Delete the current Slow Driller cell
            this.Delete()
        else
            this.Push(this.direction, 1)  -- Move normally if there's an empty space ahead
        end
    end
end

function DirToX(dir)
    local dx = {1, 0, -1, 0}  -- right, down, left, up
    return dx[dir + 1]
end

function DirToY(dir)
    local dy = {0, 1, 0, -1}  -- right, down, left, up
    return dy[dir + 1]
end

