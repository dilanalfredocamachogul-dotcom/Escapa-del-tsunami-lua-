-- ServerScriptService/InventoryServer.lua
local DSS = game:GetService("DataStoreService"):GetDataStore("INV_V1")
local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(plr)
    local inv = Instance.new("Folder")
    inv.Name = "Inventory"
    inv.Parent = plr

    local brainrots = Instance.new("IntValue")
    brainrots.Name = "Brainrots"
    brainrots.Parent = inv
    brainrots.Value = 0
end)
