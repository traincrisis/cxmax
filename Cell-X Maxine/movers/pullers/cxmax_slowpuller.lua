name = "CX-Max Slow Puller"
id = "CXMAX_SLOWPULLER"
author = "traincrisis"
texture = "cxmax_slowpuller.png"
updateIndex = 9000

-- Declare tickCounter as a local variable
local tickCounter = 0

function Start(this)
    -- Initialize the local tickCounter variable
    tickCounter = 0
end

function PullCell(this, dir)
    if this.GetCell(dir, 1).name == "EMPTY" then
        for i = 0, math.max(grid.width, grid.height) + 1 do
            if (this.GetCell(dir, -i).name == "EMPTY") then
                this.GetCell(dir, -i + 1).Push(dir, 1)
                break
            end
        end
    end
end

function Step(this)
    -- Increment the tickCounter variable
    tickCounter = tickCounter + 1

    -- Move the Slow Puller once every other tick
    if tickCounter % 2 == 0 then
        PullCell(this, this.direction)
    end
end

