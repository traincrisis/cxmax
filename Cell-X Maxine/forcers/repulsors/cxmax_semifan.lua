name = "CX-Max Semi-Fan"
id = "CXMAX_SEMIFAN"
author = "traincrisis"
texture = "cxmax_semifan.png"
updateIndex = 8200

function Step(this)
    -- Get cells 1 cell away
    local front = this.GetCell(this.direction, 1)
    local back = this.GetCell((this.direction + 2) % 4, 1)
    
    -- Get cells 2 cells away
    local front2 = this.GetCell(this.direction, 2)
    local back2 = this.GetCell((this.direction + 2) % 4, 2)

    -- Push cells 1 cell away
    if front.name ~= "EMPTY" then
        front.Push(this.direction, 1)
    end

    if back.name ~= "EMPTY" then
        back.Push((this.direction + 2) % 4, 1)
    end

    -- Push cells 2 cells away
    if front2.name ~= "EMPTY" then
        front2.Push(this.direction, 1)
    end

    if back2.name ~= "EMPTY" then
        back2.Push((this.direction + 2) % 4, 1)
    end
end

