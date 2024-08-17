name = "CX-Max One-Directional"
id = "CXMAX_ONEDIR"
author = "traincrisis"
texture = "cxmax_onedir.png" 
updateIndex = 9000

function Push(this, dir, bias)
    if not (dir == this.direction) then
        return {false, false}
    else
        return this.Push(dir, bias)
    end
end
