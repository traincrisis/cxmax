name = "CX-Max CCW Rotator"
id = "CXMAX_ROTATORCCW"
author = "traincrisis"
texture = "cxmax_rotatorCCW.png"
updateIndex = 5057

function Step(this)
    for rot=0,3 do
        local cell = this.GetCell(rot, 1)
        if cell.name ~= "EMPTY" then
            cell.Rotate(-1) -- CCW rotation
        end
    end
end

