name = "CX-Max Random Mover"
id = "CXMAX_PUSHERRNG"
author = "traincrisis"
texture = "cxmax_pusherRNG.png"
updateIndex = 9026

function Start(this)
    -- Seed the random number generator for consistency
    math.randomseed(os.time())
end

function Step(this)
    -- Randomly select a direction (0 = Up, 1 = Right, 2 = Down, 3 = Left)
    local randomDirection = math.random(0, 3)

    -- Move the cell in the randomly selected direction
    this.direction = randomDirection
    this.Push(randomDirection, 1)
end

