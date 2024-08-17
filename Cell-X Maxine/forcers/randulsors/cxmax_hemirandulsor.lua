name = "CX-Max Hemi-Randulsor"
id = "CXMAX_HEMIRANDULSOR"
author = "traincrisis"
texture = "cxmax_hemirandulsor.png"
updateIndex = 20000

function Start(this)
    math.randomseed(os.time())
end

function Step(this)
    local function PullCells(this, dir)
        local oppositeDir = (dir + 2) % 4
        local cell = this:GetCell(dir, 2)
        
        if cell and cell.name ~= "EMPTY" and cell ~= this then
            local step = 2
            local lastCell = cell
            
            while lastCell and lastCell.name ~= "EMPTY" do
                local nextCell = this:GetCell(dir, step + 1)
                if nextCell and nextCell.name ~= "EMPTY" and nextCell ~= this then
                    nextCell:Push(oppositeDir, 1)
                end
                step = step + 1
                lastCell = this:GetCell(dir, step)
            end
            
            cell:Push(oppositeDir, 1)
        end
    end

    local function PushCells(this, dir)
        local cell = this:GetCell(dir, 1)
        if cell and cell.name ~= "EMPTY" and cell ~= this then
            cell:Push(dir, 1)
        end
    end

    local function CanPull(this)
        for i = 0, 3 do
            if i == 1 or i == 3 then -- Only check front (1) and left (3) directions
                local targetCell = this:GetCell(i, 1)
                if targetCell and targetCell.name ~= "EMPTY" and targetCell ~= this then
                    return false
                end
            end
        end
        return true
    end

    local action = math.random(1, 2)
    local canPull = CanPull(this)

    if action == 1 and canPull then
        PullCells(this, 1) -- Right
        PullCells(this, 0) -- Up
    elseif action == 2 then
        PushCells(this, 1) -- Right
        PushCells(this, 0) -- Up
    end
end

