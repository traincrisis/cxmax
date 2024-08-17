name = "CX-Max Two-Directional"
id = "CXMAX_TWODIR"
author = "traincrisis"
texture = "cxmax_twodir.png"
updateIndex = 9000

function Push(this, dir, bias)
    if not (dir == (this.direction + 2)%4 or dir == (this.direction + 1)%4) then
        return {false, false}
    else
        return this.Push(dir, bias)
    end
end
