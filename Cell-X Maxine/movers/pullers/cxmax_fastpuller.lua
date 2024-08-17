name = "CX-Max Fast Puller"
id = "CXMAX_FASTPULLER"
author = "traincrisis"
texture = "cxmax_fastpuller.png"
updateIndex = 9000

function Step(this)
    FastPullCell(this, this.direction)
end

function FastPullCell(this, dir)
    for _ = 1, 2 do
        if this.GetCell(dir, 1).name == "EMPTY" then
            for i = 0, math.max(grid.width, grid.height) + 1 do
                if this.GetCell(dir, -i).name == "EMPTY" then
                    this.GetCell(dir, -i + 1).Push(dir, 1)
                    break
                end
            end
        end
    end
end

