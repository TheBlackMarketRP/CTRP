local QBCore = exports[Config.Core]:GetCoreObject()

QBCore.Functions.CreateCallback("edo-pimping:server:checkpimpingitem", function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName(Config.PimpingItem)
    if Item then 
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback("edo-pimping:server:giveearnedmoneytopimp", function(source, cb, price)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem('markedbills', price)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['markedbills'], "add", price)
    cb(true)
end)

RegisterNetEvent('edo-pimping:sever:removepimpingitem', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName(Config.PimpingItem)
    if Item then 
        Player.Functions.RemoveItem(Config.PimpingItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.PimpingItem], "remove", 1)
    end
end)