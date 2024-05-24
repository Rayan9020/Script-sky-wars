
-- Load Orion Library
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Create Window
local Window = OrionLib:MakeWindow({Name = "Sky Wars by Abo_3le", HidePremium = false, SaveConfig = true, ConfigFolder = "SkyWarsConfig"})

-- Home Tab
local HomeTab = Window:MakeTab({
    Name = "Home",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Hitbox Section
local HitboxSection = HomeTab:AddSection({
    Name = "Hitbox"
})

local hitboxSize = Vector3.new(20, 20, 20)

HitboxSection:AddSlider({
    Name = "Hitbox Size",
    Min = 10,
    Max = 100,
    Default = 20,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Size",
    Callback = function(value)
        hitboxSize = Vector3.new(value, value, value)
    end
})

HitboxSection:AddButton({
    Name = "Apply Hitbox Size",
    Callback = function()
        repeat wait() until game.Players.LocalPlayer
        local player = game.Players.LocalPlayer
        if player then
            game:GetService("RunService").RenderStepped:Connect(function()
                for _, enemy in pairs(game.Players:GetPlayers()) do
                    if enemy ~= player and not player:IsFriendsWith(enemy.UserId) and enemy.Character and enemy.Character:FindFirstChild("HumanoidRootPart") then
                        local hrp = enemy.Character.HumanoidRootPart
                        hrp.Size = hitboxSize
                        hrp.Transparency = 0.5
                        hrp.CanCollide = false
                    end
                end
            end)
        end
    end
})

-- Teleport Tab
local TeleportTab = Window:MakeTab({
    Name = "Teleport",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local TeleportSection = TeleportTab:AddSection({
    Name = "Teleport Locations"
})

TeleportSection:AddButton({
    Name = "VIP Mega",
    Callback = function()
        repeat wait() until game.Players.LocalPlayer
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local targetPosition = Vector3.new(0.6567292809486389, 175.9999542236328, 64.98756408691406)
            player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
        end
    end
})

TeleportSection:AddButton({
    Name = "VIP",
    Callback = function()
        repeat wait() until game.Players.LocalPlayer
        local player = game.Players.LocalPlayer
        local targetPosition = Vector3.new(1.592913269996643, 175.9999542236328, -66.3504409790039)
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
        end
    end
})

TeleportSection:AddButton({
    Name = "Autofarm",
    Callback = function()
        repeat wait() until game.Players.LocalPlayer
        local player = game.Players.LocalPlayer
        local function findCoins()
            local coins = {}
            for _, part in ipairs(workspace:GetDescendants()) do
                if part:IsA("MeshPart") and part.Name == "Coin" then
                    table.insert(coins, part)
                end
            end
            return coins
        end
        local function collectCoins()
            local coins = findCoins()
            for _, coin in ipairs(coins) do
                player.Character.Humanoid:MoveTo(coin.Position)
                wait(0.5)
            end
        end
        while true do
            collectCoins()
            wait(1)
        end
    end
})

-- Initialize Orion Library
OrionLib:Init()
