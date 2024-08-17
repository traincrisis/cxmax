name = "CX-Max Hemi-Trash"
id = "CXMAX_HEMITRASH"
author = "traincrisis"
texture = "cxmax_hemitrash.png"
updateIndex = 17000

function Push(this, dir, bias)
    if (dir == (this.direction + 2)%4 or dir == (this.direction + 1)%4) then
        this.PlaySound("cxmax_trashed.wav")
        return {false, true}
    else
        return this.Push(dir, bias)
    end
end

