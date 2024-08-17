name = "CX-Max Freaky CW Spinner"
id = "CXMAX_FREAKYSPINNERCW"
author = "traincrisis"
texture = "cxmax_freakyspinnerCW.png"
updateIndex = 41000

function Step(this)
    -- Determine the directions for the CW rotation
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
        local nextDir = directions[(i % 8) + 1]  -- CW Rotation

        if cell.name ~= "EMPTY" then
            -- Move cell in the direction it's facing
            local pushed = cell.Push(nextDir, 1)
            if pushed[1] then
                -- Rotate the cell in the CW direction
                cell.Rotate(1)
            end
        end
    end
end
