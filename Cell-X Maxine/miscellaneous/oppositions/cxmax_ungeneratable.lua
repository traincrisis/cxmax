name = "CX-Max Ungeneratable"
id = "CXMAX_UNGENERATABLE"
author = "traincrisis"
texture = "cxmax_ungeneratable.png"
updateIndex = 9000

function Setup(this, x, y, rot, gen)
    if gen then
        this.Delete()
    end
    this.Setup(x, y, rot, gen)
end

