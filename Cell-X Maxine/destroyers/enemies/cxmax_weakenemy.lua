name = "CX-Max Weak Enemy"
id = "CXMAX_WEAKENEMY"
author = "traincrisis"
texture = "cxmax_weakenemy.png"
updateIndex = 9000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
    grid.enemyCount = grid.enemyCount + 1
end

function Push(this, dir, bias)
    grid.enemyCount = grid.enemyCount - 1
    this.PlaySound("cxmax_enemydeath.wav")
    this.EmitParticles(152, 0, 161)
    this.EmitParticles(152, 0, 161)
    this.Delete()
    return {true, false}  -- The Weak Enemy does not delete the cell it is pushed into.
end

