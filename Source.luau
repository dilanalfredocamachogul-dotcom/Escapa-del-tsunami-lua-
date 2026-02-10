-- Esperar a que cargue el jugador
repeat task.wait() until game.Players.LocalPlayer.Character

local player = game.Players.LocalPlayer
local char = player.Character
local hrp = char:WaitForChild("HumanoidRootPart")

-- ===== GUI =====
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "BrainrotsGUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 260, 0, 200)
Frame.Position = UDim2.new(0.5, -130, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

local title = Instance.new("TextLabel", Frame)
title.Size = UDim2.new(1,0,0,40)
title.Text = "🧠 Brainrots"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.TextScaled = true

-- ===== BOTÓN TELEPORT =====
local tpBtn = Instance.new("TextButton", Frame)
tpBtn.Size = UDim2.new(0.9,0,0,45)
tpBtn.Position = UDim2.new(0.05,0,0.3,0)
tpBtn.Text = "Brainrots (Escapar Tsunami)"
tpBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
tpBtn.TextColor3 = Color3.new(1,1,1)
tpBtn.TextScaled = true

-- ===== BOTÓN AUTO DINERO =====
local moneyBtn = Instance.new("TextButton", Frame)
moneyBtn.Size = UDim2.new(0.9,0,0,45)
moneyBtn.Position = UDim2.new(0.05,0,0.6,0)
moneyBtn.Text = "Recolectar Dinero AUTO"
moneyBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
moneyBtn.TextColor3 = Color3.new(1,1,1)
moneyBtn.TextScaled = true

-- ===== TELETRANSPORTE (AJUSTABLE) =====
tpBtn.MouseButton1Click:Connect(function()
    -- POSICIÓN SEGURA (AJUSTAR SI ES NECESARIO)
    hrp.CFrame = CFrame.new(0, 150, 0)
end)

-- ===== AUTO MONEY =====
local autoMoney = false

moneyBtn.MouseButton1Click:Connect(function()
    autoMoney = not autoMoney
    moneyBtn.Text = autoMoney and "Auto Dinero: ON" or "Auto Dinero: OFF"

    task.spawn(function()
        while autoMoney do
            for _,v in pairs(workspace:GetDescendants()) do
                if v:IsA("TouchTransmitter") and v.Parent:IsA("BasePart") then
                    firetouchinterest(hrp, v.Parent, 0)
                    firetouchinterest(hrp, v.Parent, 1)
                end
            end
            task.wait(0.5)
        end
    end)
end)
