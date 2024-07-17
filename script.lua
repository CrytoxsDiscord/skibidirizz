local VirtualInputManager = game:GetService("VirtualInputManager")

local function walkToPosAndHold(x, y, z, key, holdDuration)
    local character = player.Character
    if not character then
        warn("Character not found for player: " .. player.Name)
        return
    end

    local humanoid = character:FindFirstChildWhichIsA("Humanoid")
    if not humanoid then
        warn("Humanoid not found in character")
        return
    end

    local originalWalkSpeed = humanoid.WalkSpeed
    humanoid.WalkSpeed = 25

    humanoid:MoveTo(Vector3.new(x, y, z))
    print("Walking to position (" .. x .. ", " .. y .. ", " .. z .. ")")

    -- Wait until the humanoid reaches the target position
    humanoid.MoveToFinished:Wait()

    -- Hold the specified key
    local keyCode = Enum.KeyCode[string.upper(key)]
    if keyCode then
        VirtualInputManager:SendKeyEvent(true, keyCode, false, game)
        print("Pressing " .. key .. " key for " .. holdDuration .. " seconds")
        wait(holdDuration)
        VirtualInputManager:SendKeyEvent(false, keyCode, false, game)
        print("Releasing " .. key .. " key")
    else
        warn("Invalid key: " .. key)
    end
end

-- Function to equip a tool from the backpack to the character
local function equipToolFromBackpack(toolName)
    local character = player.Character
    if not character then
        warn("Character not found for player: " .. player.Name)
        return
    end

    local tool = player.Backpack:FindFirstChild(toolName)
    if not tool then
        warn("Tool not found in backpack: " .. toolName)
        return
    end

    tool.Parent = character
    tool:Activate()
    print("Equipped " .. toolName)
end

function grind()
    for i = 1, 3 do
        walkToPosAndHold(700.81884765625, 3.537200450897217, 164.52391052246094, 'e', 2)
        equipToolFromBackpack("TrashBag")
        walkToPosAndHold(726.8204956054688, 3.412196636199951, 211.7213897705078, 'e', 2)
        print("finished")    
        end
end


grind()
