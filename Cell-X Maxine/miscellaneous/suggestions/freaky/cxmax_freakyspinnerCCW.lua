name = "CX-Max Freaky CCW Spinner"
id = "CXMAX_FREAKYSPINNERCCW"
author = "traincrisis"
texture = "cxmax_freakyspinnerCCW.png"
updateIndex = 7003

function Step(this)
    -- Determine the directions for the CCW rotation
    local spinnerDirection = this.direction
    local directions = {
        (spinnerDirection + 0) % 4,  -- Front
        (spinnerDirection + 1) % 4,  -- Right
        (spinnerDirection + 2) % 4,  -- Back
        (spinnerDirection + 3) % 4,  -- Left
        (spinnerDirection + 1) % 4,  -- Front-right diagonal
        (spinnerDirection + 3) % 4,  -- Front-left diagonal
        (spinnerDirection + 2) % 4,  -- Back-right diagonal
        (spinnerDirection + 0) % 4   -- Back-left diagonal
    }

    -- Move and rotate cells around the Spinner
    for i, dir in ipairs(directions) do
        local cell = this.GetCell(dir, 1)
        local nextDir = directions[((i - 2 + 8) % 8) + 1]  -- CCW Rotation

        if cell.name ~= "EMPTY" then
            -- Move cell in the direction it's facing
            local pushed = cell.Push(nextDir, 1)
            if pushed[1] then
                -- Rotate the cell in the CCW direction
                cell.Rotate(3)
            end
        end
    end
end

