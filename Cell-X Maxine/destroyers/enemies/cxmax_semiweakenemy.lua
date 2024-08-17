name = "CX-Max Semi-Weak Enemy"
id = "CXMAX_SEMIWEAKENEMY"
author = "traincrisis"
texture = "cxmax_semiweakenemy.png"
updateIndex = 15000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
    grid.enemyCount = grid.enemyCount + 1
end

function Push(this, dir, bias)
    if (dir == this.direction or dir == (this.direction + 2)%4) then
        grid.enemyCount = grid.enemyCount - 1
        this.PlaySound("cxmax_enemydeath.wav")
        this.Delete()
        this.EmitParticles(152, 0, 161)
        this.EmitParticles(152, 0, 161)
        return {true, false}
    else
        return this.Push(dir, bias)
    end
end
