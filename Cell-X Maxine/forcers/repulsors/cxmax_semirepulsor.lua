name = "CX-Max Semi-Repulsor"
id = "CXMAX_SEMIREPULSOR"
author = "traincrisis"
texture = "cxmax_semirepulsor.png"
updateIndex = 7001

function Step(this)
    -- Get the front and back adjacent cells
    local front = this.GetCell(this.direction, 1)
    local back = this.GetCell((this.direction + 2) % 4, 1)

    -- Push the front and back cells away from the Repulsor
    if front.name ~= "EMPTY" then
        front.Push(this.direction, 1)
    end

    if back.name ~= "EMPTY" then
        back.Push((this.direction + 2) % 4, 1)
    end
end

