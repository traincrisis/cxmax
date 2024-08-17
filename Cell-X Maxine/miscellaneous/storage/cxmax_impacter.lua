name = "CX-Max Impacter"
id = "CXMAX_IMPACTOR"
author = "traincrisis"
texture = "cxmax_impacter.png"
updateIndex = 33000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Start(this)
    this.data.storedCell = "EMPTY"
    this.data.storedCellRot = 0
end

function Step(this)
    if this.data.storedCell ~= "EMPTY" then
        -- Attempt to move the impacter forward
        local dir = this.direction
        local infront = this.GetCell(dir, 1)
        
        -- Check if it can push itself
        local canPush = this.Push(dir, 1)
        if not canPush[1] then
            -- Convert to the stored cell if unable to push
            this.Delete()
            grid.CreateCell(this.data.storedCell, this.x, this.y, this.data.storedCellRot)
        end
    end
end

function Push(this, dir, bias)
    local pushedCell = this.GetCell(dir, -1)
    
    if pushedCell and pushedCell.name ~= "EMPTY" then
        -- Store the cell
        this.data.storedCell = pushedCell.name
        this.data.storedCellRot = pushedCell.direction
        pushedCell.Delete()
        
        -- Indicate successful push
        return {true, true}
    end
    
    return {false, false}
end

