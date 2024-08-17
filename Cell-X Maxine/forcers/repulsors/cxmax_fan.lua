name = "CX-Max Fan"
id = "CXMAX_FAN"
author = "traincrisis"
texture = "cxmax_fan.png"
updateIndex = 8000

function Step(this)
    -- Get the four adjacent cells and cells 2 cells away
    local front = this.GetCell(this.direction, 1)
    local right = this.GetCell((this.direction + 1) % 4, 1)
    local back = this.GetCell((this.direction + 2) % 4, 1)
    local left = this.GetCell((this.direction + 3) % 4, 1)
    
    local front2 = this.GetCell(this.direction, 2)
    local right2 = this.GetCell((this.direction + 1) % 4, 2)
    local back2 = this.GetCell((this.direction + 2) % 4, 2)
    local left2 = this.GetCell((this.direction + 3) % 4, 2)

    -- Push the adjacent cells
    if front.name ~= "EMPTY" then
        front.Push(this.direction, 1)
    end

    if right.name ~= "EMPTY" then
        right.Push((this.direction + 1) % 4, 1)
    end

    if back.name ~= "EMPTY" then
        back.Push((this.direction + 2) % 4, 1)
    end

    if left.name ~= "EMPTY" then
        left.Push((this.direction + 3) % 4, 1)
    end

    -- Push cells 2 cells away
    if front2.name ~= "EMPTY" then
        front2.Push(this.direction, 2)
    end

    if right2.name ~= "EMPTY" then
        right2.Push((this.direction + 1) % 4, 2)
    end

    if back2.name ~= "EMPTY" then
        back2.Push((this.direction + 2) % 4, 2)
    end

    if left2.name ~= "EMPTY" then
        left2.Push((this.direction + 3) % 4, 2)
    end
end

