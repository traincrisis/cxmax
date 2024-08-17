name = "CX-Max Hemi-Weak Enemy"
id = "CXMAX_HEMIWEAKENEMY"
author = "traincrisis"
texture = "cxmax_hemiweakenemy.png"
updateIndex = 15000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
    grid.enemyCount = grid.enemyCount + 1
end

function Push(this, dir, bias)
    if (dir == (this.direction + 2)%4 or dir == (this.direction + 1)%4) then
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
