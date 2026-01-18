local QBCore = exports[Config.Core]:GetCoreObject()

for k, v in pairs(Config.Packs) do 
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        if Player.Functions.GetItemByName(item.name) then
            local job = Player.PlayerData.job.name 
            if v.jobLock and v.job ~= job then 
                TriggerClientEvent('QBCore:Notify', source, "You can't use this item.", "error")
                return false
            end
            Player.Functions.RemoveItem(k, 1)
            TriggerClientEvent("kael-starter:client:openbox", src, k)
        end
    end)
end


RegisterCommand("givestarter", function(source, args)
    local TargetId = tonumber(args[1])
    local Player = QBCore.Functions.GetPlayer(TargetId)
    if Player then
        local PlayerName = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
        local Gender = Player.PlayerData.charinfo.gender == 0 and "Male" or "Female"
        local Job = Player.PlayerData.job.label
        TriggerClientEvent("kael-starter:client:opengivemneu", source, TargetId, PlayerName, Gender, Job)
    else
        TriggerClientEvent('QBCore:Notify', source, "Invalid Player Id!", "error")
    end
end, true)

RegisterNetEvent("kael-starter:server:givepack", function(id, item)
    local Player = QBCore.Functions.GetPlayer(tonumber(id))
    if Player then
        Player.Functions.AddItem(item, 1)
    else
        TriggerClientEvent('QBCore:Notify', source, "Invalid Player Id!", "error")
    end
end)

RegisterNetEvent("kael-starter:client:openbox", function(item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        for k, v in pairs(Config.Packs[item].rewardItems) do 
            Player.Functions.AddItem(v.name, v.amount)
        end
    end
end)