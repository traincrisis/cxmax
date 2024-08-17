name = "CX-Max CW Rotator"
id = "CXMAX_ROTATORCW"
author = "traincrisis"
texture = "cxmax_rotatorCW.png"
updateIndex = 5054

function Step(this)
    for rot=0,3 do
        if this.GetCell(rot,1).name ~= "EMPTY" then
            this.GetCell(rot, 1).Rotate(1)
        end
    end
end
