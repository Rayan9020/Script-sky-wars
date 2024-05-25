-- تحميل مكتبة جديدة
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

-- إنشاء نافذة
local MainWindow = Rayfield:CreateWindow({
    Name = "Sky Wars by Abo_3le",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "Please wait",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "SkyWars",
        FileName = "MainConfig"
    }
})

-- إنشاء التبويبات
local HomeTab = MainWindow:CreateTab("Home")
local TeleportTab = MainWindow:CreateTab("Teleport")
local KillTab = MainWindow:CreateTab("Kill Players")
local AutoTab = MainWindow:CreateTab("Auto Clicking")
local FlingTab = MainWindow:CreateTab("Fling Player")

-- تبويب Home
HomeTab:CreateSlider({
    Name = "Hitbox Size",
    Range = {10, 100},
    Increment = 1,
    Suffix = "Size",
    CurrentValue = 20,
    Callback = function(value)
        print("Hitbox Size: " .. value)
    end
})

HomeTab:CreateButton({
    Name = "Apply Hitbox Size",
    Callback = function()
        local hitboxSize = Vector3.new(20, 20, 20)
        game:GetService("RunService").RenderStepped:Connect(function()
            local player = game.Players.LocalPlayer
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
})

-- تبويب Teleport
TeleportTab:CreateButton({
    Name = "VIP Mega",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local targetPosition = Vector3.new(0.6567292809486389, 175.9999542236328, 64.98756408691406)
            player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
        end
    end
})

TeleportTab:CreateButton({
    Name = "VIP",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local targetPosition = Vector3.new(1.592913269996643, 175.9999542236328, -66.3504409790039)
            player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
        end
    end
})

-- تبويب Kill Players
KillTab:CreateButton({
    Name = "Kill all!",
    Callback = function()
        local player = game.Players.LocalPlayer
        local function findSwordHolder()
            for _, v in pairs(game:GetService("Players"):GetPlayers()) do
                if v ~= nil and v ~= player and v.Character ~= nil then
                    if v.Character:FindFirstChild("Sword") or v.Backpack:FindFirstChild("Sword") then
                        return v
                    end
                end
            end
            return nil
        end
        while true do
            local targetPlayer = findSwordHolder()
            while targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") and targetPlayer.Character.Humanoid.Health > 0 do
                player.Character:SetPrimaryPartCFrame(targetPlayer.Character:GetPrimaryPartCFrame())
                wait(0.1)
            end
            wait(0.1)
        end
    end
})

-- تبويب Auto Clicking
AutoTab:CreateButton({
    Name = "Auto Clicking !",
    Callback = function()
        local player = game.Players.LocalPlayer
        game:GetService("RunService").RenderStepped:Connect(function()
            local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
            if tool and tool:FindFirstChild("Handle") then
                tool:Activate()
            end
        end)
    end
})

-- تبويب Fling Player
FlingTab:CreateButton({
    Name = "Fling Player",
    Callback = function()
        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        local bv = Instance.new("BodyVelocity")
        bv.Velocity = Vector3.new(0, 100, 0)
        bv.MaxForce = Vector3.new(100000, 100000, 100000)
        bv.P = 1000
        bv.Parent = hrp
        wait(1)
        bv:Destroy()
    end
})
