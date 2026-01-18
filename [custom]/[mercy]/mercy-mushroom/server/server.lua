local QBCore = exports[Config.Core]:GetCoreObject()

RegisterNetEvent("kael-harvest:server:harvest", function(amount)
    local Player = QBCore.Functions.GetPlayer(source)
    local rnd = math.random(#Config.HarvestZone.Items)
    local Item = Config.HarvestZone.Items[rnd]
    local Amount = math.random(Item.amount.min, Item.amount.max)
    Player.Functions.AddItem(Item.name, Amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Item.name], "add", Amount)
end)


function Notify(src, title, message, ntype)
    TriggerClientEvent('QBCore:Notify', src, message, ntype)
end
