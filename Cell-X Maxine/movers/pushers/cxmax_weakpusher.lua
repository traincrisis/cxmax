name = "CX-Max Weak Mover"
id = "CXMAX_WEAKPUSHER"
author = "traincrisis"
texture = "cxmax_weakpusher.png"
updateIndex = 9000

function Step(this)
    this.Push(this.direction, 1)
end
