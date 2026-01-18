local QBCore = exports[Config.Core]:GetCoreObject()

QBCore.Functions.CreateUseableItem('bgasbottleb', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent("mgas:client:usinggasbottle", src)
        -- Player.Functions.RemoveItem(item.name, 1)
    end
end)

QBCore.Functions.CreateUseableItem('bgasbottlef', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent("mgas:client:usinggasbottle", src)
        -- Player.Functions.RemoveItem(item.name, 1)
    end
end)

QBCore.Functions.CreateUseableItem('bgasbottles', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent("mgas:client:usinggasbottle", src)
        -- Player.Functions.RemoveItem(item.name, 1)
    end
end)

QBCore.Functions.CreateUseableItem('bgasbottlet', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent("mgas:client:usinggasbottle", src)
        -- Player.Functions.RemoveItem(item.name, 1)
    end
end)

RegisterNetEvent("mgas:server:syncSmoke", function(pedNet, pos)
	TriggerClientEvent("mgas:client:syncSmoke", -1, pedNet, pos)
end)