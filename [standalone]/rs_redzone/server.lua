local ESX = nil
local QBCore = nil
local activeZones = {}
local zoneTimers = {}

CreateThread(function()
    if GetResourceState('es_extended') == 'started' then
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        print("[SERVER] ESX detected")
    elseif GetResourceState('qb-core') == 'started' then
        QBCore = exports['qb-core']:GetCoreObject()
        print("[SERVER] QBCore detected")
    else
        print("[SERVER] No framework detected")
    end
end)

CreateThread(function()
    Wait(5000)
    
    for seriesName, seriesData in pairs(Config.ZoneSeries) do
        InitializeZoneSeries(seriesName, seriesData)
    end
end)

function InitializeZoneSeries(seriesName, seriesData)
    local allZones = {}
    for zoneName, zoneData in pairs(seriesData) do
        if type(zoneData) == 'table' and zoneData.Zone then
            table.insert(allZones, zoneName)
        end
    end

    ActivateRandomZones(seriesName, allZones, seriesData.ActiveZoneCount)
    
    SetTimeout(seriesData.ChangeInternal * 60000, function()
        RotateZones(seriesName, allZones, seriesData)
    end)
end

function ActivateRandomZones(seriesName, allZones, count)
    if not activeZones[seriesName] then
        activeZones[seriesName] = {}
    end
    
    activeZones[seriesName] = {}
    
    local shuffledZones = {}
    for i, zoneName in ipairs(allZones) do
        shuffledZones[i] = zoneName
    end
    
    for i = #shuffledZones, 2, -1 do
        local j = math.random(i)
        shuffledZones[i], shuffledZones[j] = shuffledZones[j], shuffledZones[i]
    end

    for i = 1, math.min(count, #shuffledZones) do
        activeZones[seriesName][shuffledZones[i]] = true
        if Config.Debug == true then
            print(string.format("[SERVER] Activated zone: %s in series: %s", shuffledZones[i], seriesName))
        end
    end

    TriggerClientEvent('rs_redzone:updateActiveZones', -1, activeZones)
end

function RotateZones(seriesName, allZones, seriesData)
    if Config.Debug == true then
        print(string.format("[SERVER] Rotating zones for series: %s", seriesName))
    end
    
    ActivateRandomZones(seriesName, allZones, seriesData.ActiveZoneCount)
    
    TriggerClientEvent('rs_redzone:notifyZoneChange', -1)
    
    SetTimeout(seriesData.ChangeInternal * 60000, function()
        RotateZones(seriesName, allZones, seriesData)
    end)
end

RegisterServerEvent('rs_redzone:rewardKill')
AddEventHandler('rs_redzone:rewardKill', function(zoneName, seriesName, victim)
    local killer = source 
    if Config.Debug == true then
        print(string.format("[SERVER] RewardKill event - killer: %s, zone: %s, series: %s", killer, tostring(zoneName), tostring(seriesName)))
    end
    local zoneConfig = Config.ZoneSeries[seriesName] and Config.ZoneSeries[seriesName][zoneName]
    if not zoneConfig then 
        if Config.Debug == true then
            print("[SERVER] ERROR: ZoneConfig not found for "..tostring(seriesName).." / "..tostring(zoneName))
        end
        return 
    end
    
    local droppedAny = false

    for _, reward in pairs(zoneConfig.Items) do
        local chance = math.random(1, 100)

        if chance <= reward.chance then
            local count = reward.count
            if type(count) ~= 'number' then
                count = 1
            end

            GivePlayerItem(killer, reward.item, count)
            droppedAny = true
            if Config.Debug == true then
            print(string.format("[SERVER] Player %s dostal %dx %s za kill v %s (chance %d/%d)", 
                killer, count, reward.item, zoneName, chance, reward.chance))
            end
        else
            if Config.Debug == true then
            print(string.format("[SERVER] Player %s minul item %s (chance %d/%d)", 
                killer, reward.item, chance, reward.chance))
            end
        end
    end

    if not droppedAny and #zoneConfig.Items > 0 then
        local fallback = zoneConfig.Items[math.random(1, #zoneConfig.Items)]
        local count = fallback.count
        if type(count) ~= 'number' then
            count = 1
        end
        GivePlayerItem(killer, fallback.item, count)
        if Config.Debug == true then
        print(string.format("[SERVER] Player %s nedostal nic, proto vynuceně padl %dx %s (garantovaný drop)", 
            killer, count, fallback.item))
        end
    end

    
    TriggerClientEvent('rs_redzone:killReward', killer)
    TriggerClientEvent('rs_redzone:checkvicinzone', victim, killer)
end)

RegisterNetEvent("rs_redzone:server:punishkiller", function(killer)
    TriggerClientEvent("rs_redzone:client:punishkiller", killer)
end)


function GivePlayerItem(playerId, item, count)
    if Config.Debug == true then
    print(string.format("[SERVER] Adding item %s x%d to player %s", item, count, playerId))
    end
    if Config.Inventory == 'ox' then
        exports.ox_inventory:AddItem(playerId, item, count)
    elseif Config.Inventory == 'esx' then
        if ESX then
            local xPlayer = ESX.GetPlayerFromId(playerId)
            if xPlayer then
                xPlayer.addInventoryItem(item, count)
            end
        end
    elseif Config.Inventory == 'codem' then
        exports['codem-inventory']:AddItem(playerId, item, count)
    end
end

RegisterServerEvent('rs_redzone:requestActiveZones')
AddEventHandler('rs_redzone:requestActiveZones', function()
    local source = source
    TriggerClientEvent('rs_redzone:updateActiveZones', source, activeZones)
    if Config.Debug == true then
    print(string.format("[SERVER] Sent active zones to player %s", source))
    end
end)
