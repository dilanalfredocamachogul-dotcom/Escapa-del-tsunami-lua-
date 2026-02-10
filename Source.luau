-- ESPERAR CARGA
repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players.LocalPlayer.Character

local player = game.Players.LocalPlayer
local char = player.Character
local hrp = char:WaitForChild("HumanoidRootPart")
local hum = char:WaitForChild("Humanoid")

-- BLOQUEAR MUERTE Y CAÍDA
hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)

-- ===== GUI =====
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "BrainrotsV2"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,260,0,210)
frame.Position = UDim2.new(0.5,-130,0.5,-105)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,40)
title.Text = "🧠 Brainrots Final"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.TextScaled = true

-- ===== BOTÓN BRAINROTS =====
local brainBtn = Instance.new("TextButton", frame)
brainBtn.Size = UDim2.new(0.9,0,0,45)
brainBtn.Position = UDim2.new(0.05,0,0.3,0)
brainBtn.Text = "Brainrotslocal moneyBtn = Instance.new("TextButton", Frame)
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
