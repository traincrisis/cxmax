name = "CX-Max RNG Redirector"
id = "CXMAX_REDIRECTORRNG"
author = "traincrisis"
texture = "cxmax_redirectorRNG.png"
updateIndex = 6001

function Start(this)
    math.randomseed(os.time())
end

function Step(this)
    for direction=0,3 do
        local adjacentCell = this.GetCell(direction, 1)
        if adjacentCell.name ~= "EMPTY" then
            adjacentCell.direction = math.random(0, 3)
        end
    end
end

