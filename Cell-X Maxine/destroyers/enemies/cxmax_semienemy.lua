name = "CX-Max Semi-Enemy"
id = "CXMAX_SEMIENEMY"
author = "traincrisis"
texture = "cxmax_semienemy.png"
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
        this.EmitParticles(0.887,0,0)
        this.EmitParticles(0.478,0,0)
        return {false, true}
    else
        return this.Push(dir, bias)
    end
end
