name = "CX-Max Quasi-Repulsor"
id = "CXMAX_QUASIREPULSOR"
author = "traincrisis"
texture = "cxmax_quasirepulsor.png"
updateIndex = 7002

function Step(this)
    -- Get the front adjacent cell
    local front = this.GetCell(this.direction, 1)

    -- Push the front cell away from the Repulsor
    if front.name ~= "EMPTY" then
        front.Push(this.direction, 1)
    end
end

