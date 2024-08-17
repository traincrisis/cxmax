name = "CX-Max Semi-Trash"
id = "CXMAX_SEMITRASH"
author = "traincrisis"
texture = "cxmax_semitrash.png"
updateIndex = 15000

function Push(this, dir, bias)
    if (dir == this.direction or dir == (this.direction + 2)%4) then
        this.PlaySound("cxmax_trashed.wav")
        return {false, true}
    else
        return this.Push(dir, bias)
    end
end
