name = "CX-Max Genemy"
id = "CXMAX_GENEMY"
author = "traincrisis"
texture = "cxmax_genemy.png"
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
    grid.enemyCount = grid.enemyCount - 1
    this.PlaySound("cxmax_enemydeath.wav")
    this.Delete()
    this.EmitParticles(0, 128, 0)
    this.EmitParticles(0, 94, 0)
    return {false, true}
end

