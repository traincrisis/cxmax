name = "CX-Max Transporter"
id = "CXMAX_TRANSPORTER"
author = "traincrisis"
texture = "cxmax_transporter.png"
updateIndex = 35000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Start(this)
    this.data.storedCell = "EMPTY"
    this.data.storedCellRot = 0
end

function Step(this)
    if this.data.storedCell ~= "EMPTY" then
        local dir = this.direction
        local infront = this.GetCell(dir, 1)

        if infront and infront.name ~= "EMPTY" then
            -- Eject the stored cell on the opposite side
            local oppositeDir = (dir + 2) % 4
            local targetCell = this.GetCell(oppositeDir, 1)

            if targetCell and targetCell.name == "EMPTY" then
                -- Correct syntax for CreateCell
                grid.CreateCell(this.data.storedCell, targetCell.x, targetCell.y, this.data.storedCellRot)
                -- Reset stored cell data
                this.data.storedCell = "EMPTY"
                this.data.storedCellRot = 0
            end
        elseif infront and infront.name == "EMPTY" then
            -- Move forward only if there's an empty cell ahead
            this.Push(dir, 1)
        end
    end
end

function Push(this, dir, bias)
    local pushedCell = this.GetCell(dir, -1)

    if pushedCell and pushedCell.name ~= "EMPTY" then
        -- Store the cell
        this.data.storedCell = pushedCell.name
        this.data.storedCellRot = pushedCell.direction
        pushedCell.Delete()

        -- Do not push if there's a cell ahead
        return {false, false}
    end

    -- Allow pushing if no cell is ahead
    return {true, true}
end

