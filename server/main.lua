local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-elecsearch:server:recieveItem', function(item, itemAmount)
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    ply.Functions.AddItem(item, itemAmount)
end)

RegisterNetEvent('qb-elecsearch:server:givemoney', function()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    ply.Functions.AddMoney("cash", Config.MoneyReward)
end)