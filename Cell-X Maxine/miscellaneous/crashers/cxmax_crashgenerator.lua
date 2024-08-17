name = "CX-Max Crash Generator"
id = "CXMAX_CRASHGENERATOR"
author = "traincrisis"
texture = "cxmax_crashgenerator.png"
updateIndex = 1100

function Step(this)

    if this.GetCell(this.direction, -1).name ~= "EMPTY" then
        if this.GetCell(this.direction, 1).name ~= "ENEMY" then
            if this.GetCell(this.direction, 1).Push(this.direction, 1)[1] then
                infront = this.GetCell(this.direction, 1)
                grid.CreateCell(this.GetCell(this.direction, -1).name, infront.x, infront.y, this.GetCell(this.direction, -1).direction)
            else
                while true do
                    -- Infinite loop to crash the game
                end
            end
		end
    end
end
