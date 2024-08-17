name = "CX-Max Physical Generator"
id = "CXMAXPHYSICALGENERATOR"
author = "traincrisis"
texture = "cxmax_physicalgenerator.png"
updateIndex = 1001

function Step(this)
    local dir = this.direction
    local backCell = this.GetCell(dir, -1)
    local frontCell = this.GetCell(dir, 1)
    
    -- Check if there is a cell behind
    if backCell.name ~= "EMPTY" then
        -- Push cells ahead
        local pushResult = frontCell.Push(dir, 1)
        
        -- Check if the push was successful
        if not pushResult[1] then
            -- Move backwards if push was not successful
            this.Push((dir + 2) % 4, 1)  -- Move backwards
            -- Try pushing again
            frontCell.Push(dir, 1)
        end
        
        -- Generate the new cell if front is empty
        local newFrontCell = this.GetCell(dir, 1)
        if newFrontCell.name == "EMPTY" then
            grid.CreateCell(backCell.name, newFrontCell.x, newFrontCell.y, backCell.direction)
        end
    end
end

