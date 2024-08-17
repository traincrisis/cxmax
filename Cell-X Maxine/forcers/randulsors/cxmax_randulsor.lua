name = "CX-Max Randulsor"
id = "CXMAX_RANDULSOR"
author = "traincrisis"
texture = "cxmax_randulsor.png"
updateIndex = 17000

-- Seed the random number generator
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
            
            -- Pull cells in the chain
            while lastCell and lastCell.name ~= "EMPTY" do
                local nextCell = this:GetCell(dir, step + 1)
                if nextCell and nextCell.name ~= "EMPTY" and nextCell ~= this then
                    nextCell:Push(oppositeDir, 1)
                end
                step = step + 1
                lastCell = this:GetCell(dir, step)
            end
            
            -- Pull the target cell to the Randulsor
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
        -- Checks if pulling is possible
        for i = 0, 3 do
            local targetCell = this:GetCell(i, 1)
            if targetCell and targetCell.name ~= "EMPTY" and targetCell ~= this then
                return false
            end
        end
        return true
    end

    -- Randomly choose between pulling and pushing
    local action = math.random(1, 2)
    local canPull = CanPull(this)

    if action == 1 and canPull then
        -- Perform pulling if possible
        for i = 0, 3 do
            PullCells(this, i)
        end
    elseif action == 2 then
        -- Perform pushing
        for i = 0, 3 do
            PushCells(this, i)
        end
    end
end

