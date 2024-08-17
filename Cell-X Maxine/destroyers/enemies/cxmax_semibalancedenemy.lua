name = "CX-Max Semi-Balanced Enemy"
id = "CXMAX_SEMIBALANCEDENEMY"
author = "traincrisis"
texture = "cxmax_semibalancedenemy.png"
updateIndex = 9000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
    grid.enemyCount = grid.enemyCount + 1
end

function Push(this, dir, bias)
    if (dir == this.direction or dir == (this.direction + 2)%4) then
    -- Decrement the enemy count and handle the death
    grid.enemyCount = grid.enemyCount - 1
    this.PlaySound("cxmax_enemydeath.wav")
    
    -- Emit particles for destruction
    this.EmitParticles(196, 85, 0)
    this.EmitParticles(196, 85, 0)
    
    -- Transform into a regular enemy
    local x, y = this.x, this.y
    this.Delete() -- Remove the Strong Enemy
    
    -- Create a regular enemy at the same position
    grid.CreateCell("CXMAX_SEMIWEAKENEMY", x, y, this.direction)
        return {false, true}
    else
        return this.Push(dir, bias)
    end
end
