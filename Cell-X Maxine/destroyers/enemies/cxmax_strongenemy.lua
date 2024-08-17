name = "CX-Max Strong Enemy"
id = "CXMAX_STRONGENEMY"
author = "traincrisis"
texture = "cxmax_strongenemy.png"
updateIndex = 19000

function Setup(this, x, y, rot, gen)
    -- Set up the Strong Enemy cell
    this.Setup(x, y, rot, gen)
    grid.enemyCount = grid.enemyCount + 1
end

function Push(this, dir, bias)
    -- Decrement the enemy count and handle the death
    grid.enemyCount = grid.enemyCount - 1
    this.PlaySound("cxmax_enemydeath.wav")
    
    -- Emit particles for destruction
    this.EmitParticles(0.887,0,0)
    this.EmitParticles(0.478,0,0) -- Red particles for strong enemy
    
    -- Transform into a regular enemy
    local x, y = this.x, this.y
    this.Delete() -- Remove the Strong Enemy
    
    -- Create a regular enemy at the same position
    grid.CreateCell("CXMAX_ENEMY", x, y, this.direction)
    
    return {false, true}
end

