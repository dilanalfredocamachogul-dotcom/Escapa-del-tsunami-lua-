-- -- Esperar carga
repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players.LocalPlayer

local player = game.Players.LocalPlayer

-- (Opcional) retardo silencioso
task.wait(2)

-- Pantalla negra inmediata (no GUI visible antes)
local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

local black = Instance.new("Frame", gui)
black.Size = UDim2.fromScale(1,1)
black.BackgroundColor3 = Color3.new(0,0,0)
black.BorderSizePixel = 0

-- Texto breve (opcional, muy realista)
local txt = Instance.new("TextLabel", black)
txt.Size = UDim2.fromScale(1,1)
txt.BackgroundTransparency = 1
txt.TextColor3 = Color3.new(1,1,1)
txt.TextScaled = true
txt.Text = "Verificando cuenta…"

task.wait(1.2)

-- KICK REALISTA (solo al que ejecuta)
player:Kick("Has sido expulsado de esta experiencia por los moderadores.\n\nMotivo: Actividad sospechosa detectada.")
