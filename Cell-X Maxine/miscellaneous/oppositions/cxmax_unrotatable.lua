name = "CX-Max Unrotatable"
id = "CXMAX_UNROTATABLE"
author = "traincrisis"
texture = "cxmax_unrotatable.png"
updateIndex = 9100

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Rotate(this, dir)
    -- Override Rotate to do nothing
end

