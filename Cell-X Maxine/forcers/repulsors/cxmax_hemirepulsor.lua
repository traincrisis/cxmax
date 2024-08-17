name = "CX-Max Hemi-Repulsor"
id = "CXMAX_HEMIREPULSOR"
author = "traincrisis"
texture = "cxmax_hemirepulsor.png"
updateIndex = 7003

function Step(this)
    -- Get the front and left adjacent cells
    local front = this.GetCell(this.direction, 1)
    local left = this.GetCell((this.direction + 3) % 4, 1)

    -- Push the front and left cells away from the Repulsor
    if front.name ~= "EMPTY" then
        front.Push(this.direction, 1)
    end

    if left.name ~= "EMPTY" then
        left.Push((this.direction + 3) % 4, 1)
    end
end

