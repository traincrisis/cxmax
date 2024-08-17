name = "CX-Max Inwards Redirector"
id = "CXMAX_REDIRECTORINWARDS"
author = "traincrisis"
texture = "cxmax_redirectorInwards.png"
updateIndex = 6003

function Step(this)
    for direction=0,3 do
        local adjacentCell = this.GetCell(direction, 1)
        if adjacentCell.name ~= "EMPTY" then
            adjacentCell.direction = (direction + 2) % 4  -- Rotate to face towards the redirector
        end
    end
end

