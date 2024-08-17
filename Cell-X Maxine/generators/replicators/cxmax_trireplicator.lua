name = "CX-Max Trireplicator"
id = "CXMAX_TRIREPLICATOR"
author = "traincrisis"
texture = "cxmax_trireplicator.png"
updateIndex = 1000

function Step(this)
    local upDirection = this.direction
    local rightDirection = (this.direction + 1) % 4
    local leftDirection = (this.direction + 3) % 4

    -- Handle upward replication
    local cellUp = this.GetCell(upDirection, 1)
    if cellUp.name ~= "EMPTY" and cellUp.name ~= "ENEMY" then
        if this.GetCell(upDirection, 2).Push(upDirection, 1)[1] then
            local newCell = this.GetCell(upDirection, 2)
            grid.CreateCell(cellUp.name, newCell.x, newCell.y, cellUp.direction)
        end
    end

    -- Handle rightward replication
    local cellRight = this.GetCell(rightDirection, 1)
    if cellRight.name ~= "EMPTY" and cellRight.name ~= "ENEMY" then
        if this.GetCell(rightDirection, 2).Push(rightDirection, 1)[1] then
            local newCell = this.GetCell(rightDirection, 2)
            grid.CreateCell(cellRight.name, newCell.x, newCell.y, cellRight.direction)
        end
    end

    -- Handle leftward replication
    local cellLeft = this.GetCell(leftDirection, 1)
    if cellLeft.name ~= "EMPTY" and cellLeft.name ~= "ENEMY" then
        if this.GetCell(leftDirection, 2).Push(leftDirection, 1)[1] then
            local newCell = this.GetCell(leftDirection, 2)
            grid.CreateCell(cellLeft.name, newCell.x, newCell.y, cellLeft.direction)
        end
    end
end

