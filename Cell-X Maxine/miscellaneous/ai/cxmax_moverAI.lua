name = "CX-Max Mover AI"
id = "CXMAX_MOVERAI"
author = "traincrisis"
texture = "cxmax_moverAI.png"
updateIndex = 25000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Step(this)
    local canPush = this.Push(this.direction, 1)[1]

    if not canPush then
        -- Rotate 90 degrees clockwise
        this.direction = (this.direction + 1) % 4
        canPush = this.Push(this.direction, 1)[1]
        
        if not canPush then
            -- Rotate 180 degrees from the new direction
            this.direction = (this.direction + 2) % 4
        end
    end
end

