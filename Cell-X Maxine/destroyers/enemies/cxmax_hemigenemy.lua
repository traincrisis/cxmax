name = "CX-Max Hemi-Genemy"
id = "CXMAX_HEMIGENEMY"
author = "traincrisis"
texture = "cxmax_hemigenemy.png"
updateIndex = 17000

function Setup(this, x, y, rot, gen)
    if gen then
        this.Delete()
        return {false, true}
    end
    this.Setup(x, y, rot, gen)
    grid.enemyCount = grid.enemyCount + 1
end

function Push(this, dir, bias)
    if (dir == (this.direction + 2)%4 or dir == (this.direction + 1)%4) then
        grid.enemyCount = grid.enemyCount - 1
        this.PlaySound("cxmax_enemydeath.wav")
        this.Delete()
        this.EmitParticles(0, 128, 0)
        this.EmitParticles(0, 94, 0)
        return {false, true}
    else
        return this.Push(dir, bias)
    end
end

