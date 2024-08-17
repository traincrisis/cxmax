name = "CX-Max Eagle"
id = "CXMAX_BIRDDRILLER"
author = "traincrisis"
texture = "cxmax_birddriller.png"
updateIndex = 9001

local zigzagState = 0

function Step(this)
    local direction = this.direction
    local nextCell = this.GetCell(direction, 1)
    
    if direction == 0 or direction == 2 then
        -- Moving left or right (zigzag pattern)
        if zigzagState == 0 then
            if nextCell.name ~= "EMPTY" then
                local x_post = this.x + 2 * DirToX(direction)  -- Calculate new x position 2 cells ahead
                local y_post = this.y + 2 * DirToY(direction)  -- Calculate new y position 2 cells ahead

                -- Create a new Bird Driller cell at the new position
                grid.CreateCell(CellID("CXMAX_BIRDDRILLER"), x_post, y_post, direction)

                -- Delete the current Bird Driller cell
                this.Delete()
            else
                this.Push(1, 1)  -- Move down if there's an empty space ahead
            end
        elseif zigzagState == 1 then
            this.Push(direction, 1)  -- Move forward
        elseif zigzagState == 2 then
            this.Push(3, 1)  -- Move up
        elseif zigzagState == 3 then
            this.Push(direction, 1)  -- Move forward
        end

        zigzagState = (zigzagState + 1) % 4  -- Cycle through the states
    else
        -- Moving up or down (straight line)
        if nextCell.name ~= "EMPTY" then
            local x_post = this.x + 2 * DirToX(direction)  -- Calculate new x position 2 cells ahead
            local y_post = this.y + 2 * DirToY(direction)  -- Calculate new y position 2 cells ahead

            -- Create a new Bird Driller cell at the new position
            grid.CreateCell(CellID("CXMAX_BIRDDRILLER"), x_post, y_post, direction)

            -- Delete the current Bird Driller cell
            this.Delete()
        else
            this.Push(direction, 1)  -- Move forward if there's an empty space ahead
        end
    end
end

function Start(this)
    zigzagState = 0
end

function DirToX(dir)
    local dx = {1, 0, -1, 0}  -- right, down, left, up
    return dx[dir + 1]
end

function DirToY(dir)
    local dy = {0, 1, 0, -1}  -- right, down, left, up
    return dy[dir + 1]
end

