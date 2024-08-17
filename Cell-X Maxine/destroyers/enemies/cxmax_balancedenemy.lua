name = "CX-Max Balanced Enemy"
id = "CXMAX_BALANCEDENEMY"
author = "traincrisis"
texture = "cxmax_balancedenemy.png"
updateIndex = 9000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
    grid.enemyCount = grid.enemyCount + 1
end

function Push(this, dir, bias)
    grid.enemyCount = grid.enemyCount - 1
    this.PlaySound("cxmax_enemydeath.wav")
    this.EmitParticles(196, 85, 0)
    this.EmitParticles(196, 85, 0)
    -- Create a Weak Enemy at the current position
    this.Delete()
    grid.CreateCell("CXMAX_WEAKENEMY", this.x, this.y, this.direction)
    return {false, true}
end

