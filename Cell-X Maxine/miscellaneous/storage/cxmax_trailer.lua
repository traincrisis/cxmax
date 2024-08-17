name = "CX-Max Trailer"
id = "CXMAX_TRAILER"
author = "traincrisis"
texture = "cxmax_trailer.png"
updateIndex = 34000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Start(this)
    this.data.storedCell = "EMPTY"
    this.data.storedCellRot = 0
end

function Step(this)
    if this.data.storedCell ~= "EMPTY" then
        -- Attempt to move the trailer forward
        local dir = this.direction
        local infront = this.GetCell(dir, 1)
        
        -- Check if it can push itself
        local canPush = this.Push(dir, 1)
        if canPush[1] then
            -- Create the stored cell behind the trailer
            local behind = this.GetCell((dir + 2) % 4, 1)
            if behind and behind.name == "EMPTY" then
                grid.CreateCell(this.data.storedCell, behind.x, behind.y, this.data.storedCellRot)
            end
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

