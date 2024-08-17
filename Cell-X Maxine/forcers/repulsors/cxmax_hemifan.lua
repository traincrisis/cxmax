name = "CX-Max Hemi-Fan"
id = "CXMAX_HEMIFAN"
author = "traincrisis"
texture = "cxmax_hemifan.png"
updateIndex = 8400

function Step(this)
    -- Get cells 1 cell away
    local front = this.GetCell(this.direction, 1)
    local left = this.GetCell((this.direction + 3) % 4, 1)
    
    -- Get cells 2 cells away
    local front2 = this.GetCell(this.direction, 2)
    local left2 = this.GetCell((this.direction + 3) % 4, 2)

    -- Push cells 1 cell away
    if front.name ~= "EMPTY" then
        front.Push(this.direction, 1)
    end

    if left.name ~= "EMPTY" then
        left.Push((this.direction + 3) % 4, 1)
    end

    -- Push cells 2 cells away
    if front2.name ~= "EMPTY" then
        front2.Push(this.direction, 1)
    end

    if left2.name ~= "EMPTY" then
        left2.Push((this.direction + 3) % 4, 1)
    end
end

