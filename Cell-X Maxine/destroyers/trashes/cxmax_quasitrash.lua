name = "CX-Max Quasi-Trash"
id = "CXMAX_QUASITRASH"
author = "traincrisis"
texture = "cxmax_quasitrash.png"
updateIndex = 16000

function Push(this, dir, bias)
    if dir == (this.direction + 2)%4 then
        this.PlaySound("cxmax_trashed.wav")
        return {false, true}
    else
        return this.Push(dir, bias)
    end
end

