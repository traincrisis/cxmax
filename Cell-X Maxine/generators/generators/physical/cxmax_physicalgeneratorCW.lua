name = "CX-Max CW Physical Generator"
id = "CXMAX_PHYSICALGENERATORCW"
author = "traincrisis"
texture = "cxmax_physicalgeneratorCW.png"
updateIndex = 1002

function Step(this)
    local dir = this.direction
    local rightDir = (dir + 1) % 4
    local leftDir = (dir + 3) % 4
    
    -- Check if there is a cell behind the generator
    if this.GetCell(dir, -1).name ~= "EMPTY" then
        -- Attempt to push cells on the right
        local pushed = this.GetCell(rightDir, 1).Push(rightDir, 1)[1]
        
        -- If cells were pushed, generate the cell on the right
        if pushed then
            local rightFrontCell = this.GetCell(rightDir, 1)
            if rightFrontCell.name == "EMPTY" then
                grid.CreateCell(this.GetCell(dir, -1).name, rightFrontCell.x, rightFrontCell.y, this.GetCell(dir, -1).direction)
            end
        else
            -- Move left if pushing was not successful
            this.Push(leftDir, 1)
            
            -- After moving, try to push again
            pushed = this.GetCell(rightDir, 1).Push(rightDir, 1)[1]
            if pushed then
                local rightFrontCell = this.GetCell(rightDir, 1)
                if rightFrontCell.name == "EMPTY" then
                    grid.CreateCell(this.GetCell(dir, -1).name, rightFrontCell.x, rightFrontCell.y, this.GetCell(dir, -1).direction)
                end
            end
        end
    end
end

