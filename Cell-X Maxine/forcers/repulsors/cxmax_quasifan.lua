name = "CX-Max Quasi-Fan"
id = "CXMAX_QUASIFAN"
author = "traincrisis"
texture = "cxmax_quasifan.png"
updateIndex = 8300

function Step(this)
    -- Get cells 1 cell away
    local front = this.GetCell(this.direction, 1)
    
    -- Get cells 2 cells away
    local front2 = this.GetCell(this.direction, 2)

    -- Push cells 1 cell away
    if front.name ~= "EMPTY" then
        front.Push(this.direction, 1)
    end

    -- Push cells 2 cells away
    if front2.name ~= "EMPTY" then
        front2.Push(this.direction, 1)
    end
end

