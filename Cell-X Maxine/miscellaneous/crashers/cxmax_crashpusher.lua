name = "CX-Max Crash Mover"
id = "CXMAX_CRASHPUSHER"
author = "traincrisis"
texture = "cxmax_crashpusher.png"
updateIndex = 9000

function Step(this)
    local canPush = this.Push(this.direction, 1)
    if not canPush[1] then
        while true do
            -- This loop will continue indefinitely and likely crash the game
        end
    end
end

