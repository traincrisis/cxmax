name = "CX-Max Fast Driller"
id = "CXMAX_FASTDRILLER"
author = "traincrisis"
texture = "cxmax_fastdriller.png"
updateIndex = 9000

function Step(this)
    local nextCell = this.GetCell(this.direction, 1)
    if nextCell.name ~= "EMPTY" then
        local x_post = this.x + 2 * DirToX(this.direction)  -- Calculate new x position 2 cells ahead of Unstable Mover
        local y_post = this.y + 2 * DirToY(this.direction)  -- Calculate new y position 2 cells ahead of Unstable Mover

        -- Create a new Unstable Mover cell at the new position
        grid.CreateCell(CellID("CXMAX_FASTDRILLER"), x_post, y_post, this.direction)

        -- Delete the current Unstable Mover cell
        this.Delete()
    else
        this.Push(this.direction, 1)  -- Move normally if there's an empty space ahead
    end
    if nextCell.name ~= "EMPTY" then
        local x_post = this.x + 2 * DirToX(this.direction)  -- Calculate new x position 2 cells ahead of Unstable Mover
        local y_post = this.y + 2 * DirToY(this.direction)  -- Calculate new y position 2 cells ahead of Unstable Mover

        -- Create a new Unstable Mover cell at the new position
        grid.CreateCell(CellID("CXMAX_FASTDRILLER"), x_post, y_post, this.direction)

        -- Delete the current Unstable Mover cell
        this.Delete()
    else
        this.Push(this.direction, 1)  -- Move normally if there's an empty space ahead
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

