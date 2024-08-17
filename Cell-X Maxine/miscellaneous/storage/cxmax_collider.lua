name = "CX-Max Collider"
id = "CXMAX_COLLIDER"
author = "traincrisis"
texture = "cxmax_collider.png"
updateIndex = 32000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Start(this)
    this.data.storedCell = "EMPTY"
    this.data.storedCellRot = 0
end

function Step(this)
    if this.data.storedCell ~= "EMPTY" then
        -- Move the collider forward
        local dir = this.direction
        local infront = this.GetCell(dir, 1)
        
        -- Check for collision with non-empty cell
        if infront and infront.name ~= "EMPTY" then
            -- Place the stored cell at the current position of the collider
            this.Delete()
            grid.CreateCell(this.data.storedCell, this.x, this.y, this.data.storedCellRot)
        else
            -- Move forward if the path is clear
            this.Push(dir, 1)
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

