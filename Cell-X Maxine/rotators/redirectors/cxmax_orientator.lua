name = "CX-Max Orientator"
id = "CXMAX_ORIENTATOR"
author = "traincrisis"
texture = "cxmax_orientator.png"
updateIndex = 6004

function Step(this)
    -- Get the direction of the cell behind the Orientator
    local behindCell = this.GetCell(this.direction, -1)
    
    -- Only proceed if there's a cell behind the Orientator
    if behindCell.name ~= "EMPTY" then
        local targetDirection = behindCell.direction  -- The direction to match
        
        -- Rotate adjacent cells to match the direction of the cell behind
        for direction = 0, 3 do
            local adjacentCell = this.GetCell(direction, 1)
            if adjacentCell.name ~= "EMPTY" then
                adjacentCell.direction = targetDirection
            end
        end
    end
end

