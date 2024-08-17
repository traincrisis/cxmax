name = "CX-Max Flip Rotator"
id = "CXMAX_FLIPROTATOR"
author = "traincrisis"
texture = "cxmax_fliprotator.png"
updateIndex = 5061

function Step(this)
    for rot=0,3 do
        if this.GetCell(rot, 1).name ~= "EMPTY" then
            this.GetCell(rot, 1).Rotate(2)
        end
    end
end

