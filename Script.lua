-- تحميل مكتبة KR4K
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/stysscythe/script/main/LibTest.lua"))()

-- إنشاء نافذة
local Window = Library.Window('Sky Wars by Abo_3le')

-- إنشاء التبويبات
local HomeTab = Window.CreateTab('Home')
local TeleportTab = Window.CreateTab('Teleport')
local KillTab = Window.CreateTab('Kill Players')
local AutoTab = Window.CreateTab('Auto Clicking')

-- تبويب Home
HomeTab.CreateSlider("Hitbox Size", 10, 100, function(value)
    -- منطق تغيير حجم Hitbox
    print("Hitbox Size: " .. value)
end)

HomeTab.CreateButton("Apply Hitbox Size", function()
    -- منطق تطبيق حجم Hitbox
    local hitboxSize = Vector3.new(20, 20, 20) -- يمكن تعديل القيمة هنا
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
end)

-- تبويب Teleport
TeleportTab.CreateButton("VIP Mega", function()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local targetPosition = Vector3.new(0.6567292809486389, 175.9999542236328, 64.98756408691406)
        player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
    end
end)

TeleportTab.CreateButton("VIP", function()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local targetPosition = Vector3.new(1.592913269996643, 175.9999542236328, -66.3504409790039)
        player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
    end
end)

-- تبويب Kill Players
KillTab.CreateButton("Kill all!", function()
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
            wait(0.1) -- تكرار التحقق بسرعة
        end
        wait(0.1) -- الانتظار قليلاً قبل البحث عن لاعب آخر
    end
end)

-- تبويب Auto Clicking
AutoTab.CreateButton("Auto Clicking !", function()
    -- منطق Auto Clicking
    local player = game.Players.LocalPlayer
    game:GetService("RunService").RenderStepped:Connect(function()
        local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("Handle") then
            tool:Activate()
        end
    end)
end)
