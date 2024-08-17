name = "CX-Max Redirector"
id = "CXMAX_REDIRECTOR"
author = "traincrisis"
texture = "cxmax_redirector.png"
updateIndex = 6000

function Step(this)
    for direction=0,3 do
        local adjacentCell = this.GetCell(direction, 1)
        if adjacentCell.name ~= "EMPTY" then
            adjacentCell.direction = this.direction
        end
    end
end

