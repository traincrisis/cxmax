name = "CX-Max Outwards Redirector"
id = "CXMAX_REDIRECTOROUTWARDS"
author = "traincrisis"
texture = "cxmax_redirectorOutwards.png"
updateIndex = 6002

function Step(this)
    for direction=0,3 do
        local adjacentCell = this.GetCell(direction, 1)
        if adjacentCell.name ~= "EMPTY" then
            adjacentCell.direction = direction  -- Rotate to face away from the redirector
        end
    end
end

