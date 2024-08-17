name = "CX-Max Info Cell"
id = "CXMAX_INFOCELL"
author = "traincrisis"
texture = "cxmax_infocell.png"
updateIndex = 25000

function Setup(this, x, y, rot, gen)
    this.ChangeTexture("cxmax_infocell.png")
    this.Setup(x, y, rot, gen)
end

function Push(this, dir, bias)
    this.ChangeTexture("cxmax_infocellPUSH.png")
    return this.Push(dir, bias)
end

function Rotate(this, amount)
    if amount == 1 then
        this.ChangeTexture("cxmax_infocellCW.png")
    end
    if amount == -1 then
        this.ChangeTexture("cxmax_infocellCCW.png")
    end
    if amount == 2 or amount == -2 then
        this.ChangeTexture("cxmax_infocellFLIP.png")
    end
    this.Rotate(amount)
end

function Start(this)
    this.ChangeTexture("cxmax_infocellSTART.png")
end
