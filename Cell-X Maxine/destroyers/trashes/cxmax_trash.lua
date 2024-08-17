name = "CX-Max Trash"
id = "CXMAX_TRASH"
author = "traincrisis"
texture = "cxmax_trash.png"
updateIndex = 14000

function Push(this, dir, bias)
    this.PlaySound("cxmax_trashed.wav")
    return {false, true}
end

