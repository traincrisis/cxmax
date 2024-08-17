name = "CX-Max Enemy"
id = "CXMAX_ENEMY"
author = "traincrisis"
texture = "cxmax_enemy.png"
updateIndex = 9000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
    grid.enemyCount = grid.enemyCount + 1
end

function Push(this, dir, bias)
    grid.enemyCount = grid.enemyCount - 1
    this.PlaySound("cxmax_enemydeath.wav")
    this.Delete()
    this.EmitParticles(0.887,0,0)
    this.EmitParticles(0.478,0,0)
    return {false, true}
end
