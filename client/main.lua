local QBCore = exports['qb-core']:GetCoreObject()

local searched = {}
local canSearch = true

RegisterNetEvent('qb-elecsearch:client:searchelec', function()
    if canSearch then
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local elecFound = falses

        for k, v in pairs(Config.Objects) do
            local elec = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, k, false, false, false)
            local elecPos = GetEntityCoords(elec)
            local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, elecPos.x, elecPos.y, elecPos.z, true)
            if dist < 1.8 then
                if searched[elec] ~= nil then
                    QBCore.Functions.Notify("Already Searched", "error")
                    return
                end
                local itemType = math.random(#Config.RewardTypes)
                TriggerEvent('qb-elecsearch:client:progressbar',itemType, Config.Objects[k])
                searched[elec] = true
            end
        end
    end
end)

RegisterNetEvent('qb-elecsearch:client:progressbar', function(itemType, pEntity)
	local src = source
    print(pEntity)
    local pEntity = tostring(pEntity)
    local item = math.random(#Config.Rewardes[pEntity])
    QBCore.Functions.Progressbar("elec_find", "Searching..", math.random (5000, 10000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@prop_human_bum_bin@idle_b",
        anim = "idle_d",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "idle_d", 1.0)
        if Config.RewardTypes[itemType].type == "nothing" then 
            QBCore.Functions.Notify("Found Nothing", "error")
            return
        end
        if Config.RewardTypes[itemType].type == "item" then
            QBCore.Functions.Notify("Found Something", "success")
            TriggerServerEvent('qb-elecsearch:server:recieveItem', Config.Rewardes[pEntity][item].item, math.random (Config.Rewardes[pEntity][item].minAmount, Config.Rewardes[pEntity][item].maxAmount))
            TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[Config.Rewardes[pEntity][item].item], "add")
        elseif Config.RewardTypes[itemType].type == "money" then
            QBCore.Functions.Notify("Found Some Money", "success")
            TriggerServerEvent('qb-elecsearch:server:givemoney')
        end
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "idle_d", 1.0)
        QBCore.Functions.Notify("Stopped Searching", "error")
    end)
end)

CreateThread(function()
    for k, v in pairs(Config.Objects) do
        exports['qb-target']:AddTargetModel(k, {
            options = {
                {
                    type = "client",
                    event = "qb-elecsearch:client:searchelec",
                    icon = "fas fa-pencil-ruler",
                    label = "Search",
                },
            },
            distance = 2.1
        })
    end
end)
