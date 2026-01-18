local QBCore = exports[Config.Core]:GetCoreObject()
local LootedPeds = {}

CreateThread(function()
    while true do 
        Wait(Config.DropInterVal * 60 * 1000)
        if Config.CurrentPurge.Active and not Config.CurrentPurge.Dropped then 
            local dest = Config.DropCoords[math.random(#Config.DropCoords)]
            local Target = GetPlayers()[1]
            Config.CurrentPurge.Dropped = true
            TriggerClientEvent('kael-purge:client:updatecfg', -1, Config.CurrentPurge)
            TriggerClientEvent('kael-purge:client:spawnitemdrop', -1, dest)
            TriggerClientEvent('kael-purge:client:startsmoke', Target, dest)
        end
    end
end)

QBCore.Functions.CreateCallback("kael-purge:server:getsatus", function(source, cb)
    cb(Config.CurrentPurge)
end)

RegisterCommand(Config.StartCommand, function(source, _)
    if Config.CurrentPurge.Active then return false end
    Config.CurrentPurge = {
        Active = false,
        Dropped = false,
        KillScores = {},
        StoredItems = {},
    }
    exports["qb-weathersync"]:setWeather(Config.WeatherName);
    exports["qb-weathersync"]:setTime(22, 00)
    Config.CurrentPurge.Active = true
    TriggerClientEvent('kael-purge:client:startpurge', -1, Config.CurrentPurge)
end, true)

RegisterCommand(Config.StopCommand, function(source, _)
    if not Config.CurrentPurge.Active then return false end
    Config.CurrentPurge.Active = false
    exports["qb-weathersync"]:setWeather("CLEAR");
    exports["qb-weathersync"]:setTime(8, 10)
    TriggerClientEvent('kael-purge:client:stoppurge', -1, Config.CurrentPurge)
end, true)


RegisterNetEvent("kael-purge:server:storeinventory", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local Items = Player.PlayerData.items
    local ID = Player.PlayerData.citizenid 
    if not Config.CurrentPurge.StoredItems[ID] then
        Config.CurrentPurge.StoredItems[ID] = Items
        for k, v in pairs(Items) do 
            if GetResourceState('ox_inventory') == 'started' then
                Player.Functions.RemoveItem(v.name, v.count)
            else
                Player.Functions.RemoveItem(v.name, v.amount)
            end
        end   
    end
end)

RegisterNetEvent("kael-purge:server:giveinventory", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local ID = Player.PlayerData.citizenid 

    if Config.CurrentPurge.StoredItems[ID] then
        for k, v in pairs(Config.CurrentPurge.StoredItems[ID]) do 
            if GetResourceState('ox_inventory') == 'started' then
                Player.Functions.AddItem(v.name, v.count, nil, v.metadata)
            else
                Player.Functions.AddItem(v.name, v.amount, nil, v.info)
            end
        end
    end   
end)

RegisterNetEvent("kael-purge:server:lootsync", function()
    local Player = QBCore.Functions.GetPlayer(source)
    if Config.CurrentPurge.Dropped then 
        Config.CurrentPurge.Dropped = false
        TriggerClientEvent("kael-purge:client:lootsync", -1, Config.CurrentPurge)
        
        for k, v in pairs(Config.DropItems) do 
            Player.Functions.AddItem(v.name, math.random(v.amount.min, v.amount.max))
        end
    end
end)

RegisterNetEvent("kael-purge:server:lootbody", function(netId)
    local Player = QBCore.Functions.GetPlayer(source)
    if not LootedPeds[netId] then 
        LootedPeds[netId] = netId
        if math.random(100) <= Config.Peds.LootChance then 
            local rndItem = Config.Peds.Loots[math.random(#Config.Peds.Loots)]
            Player.Functions.AddItem(rndItem.name, math.random(rndItem.amount.min, rndItem.amount.max))
        else
            TriggerClientEvent('QBCore:Notify', source, "Nothing Found", "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', source, "Alrady Looted", "error")
    end
end)

RegisterNetEvent("kael-purge:server:updatekills", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local Name = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
    local CID = Player.PlayerData.citizenid
    if Config.CurrentPurge.KillScores[CID] then 
        Config.CurrentPurge.KillScores[CID].kills = Config.CurrentPurge.KillScores[CID].kills + 1
    else
        Config.CurrentPurge.KillScores[CID] = {
            name = Name,
            kills = 1, 
        }
    end

    TriggerClientEvent('kael-purge:client:updatecfg', -1, Config.CurrentPurge)
end)