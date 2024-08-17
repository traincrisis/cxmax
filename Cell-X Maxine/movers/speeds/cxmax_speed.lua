name = "CX-Max Speed"
id = "CXMAX_SPEED"
author = "traincrisis"
texture = "cxmax_speed.png"
updateIndex = 9000

function Step(this)
    -- Move forward if the cell ahead is empty
    if this.GetCell(this.direction, 1).name == "EMPTY" then
        this.Push(this.direction, 1)
    end
end

