ESX = nil
QBCore = nil

if (GetResourceState('es_extended') == 'started') then
    ESX = exports['es_extended']:getSharedObject()
elseif (GetResourceState('qb-core') == 'started') then
    QBCore = exports['qb-core']:GetCoreObject()
end

Functions = {}

-- This function should return true if the playerId can use the wheelclamp (Kijken of dit niet alleen in ox-target al kan verwerkt worden)
Functions.CanUseClamp = function(playerId)
    local jobName = nil

    if ESX then
        local xPlayer = ESX.GetPlayerFromId(playerId)
        jobName = xPlayer and xPlayer.job and xPlayer.job.name
    elseif QBCore then
        local Player = QBCore.Functions.GetPlayer(playerId)
        jobName = Player and Player.PlayerData and Player.PlayerData.job and Player.PlayerData.job.name
    end

    if Config.AllowedJobs ~= nil and Config.AllowedJobs[jobName] ~= nil then return true end

    return false
end

-- Removes the item from the player inventory, ensure function returns true on succes
Functions.RemoveItem = function(playerId, itemName)
    -- We only remove the required item if it is enabled
    if (itemName == Config.RequiredItem.Item and not Config.RequiredItem.Enabled) then
        return true
    end

    -- If the item is not defined, we return true
    if (itemName == nil) then
        return true
    end

    if ESX then
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer.getInventoryItem(itemName).count < 1 then
            return false
        end
        xPlayer.removeInventoryItem(itemName, 1)
    elseif QBCore then
        local Player = QBCore.Functions.GetPlayer(playerId)
        if not Player.Functions.GetItemByName(itemName) then
            return false
        end
        Player.Functions.RemoveItem(itemName, 1)
    end
    return true
end

-- Adds the item back to the player inventory
Functions.AddItem = function(playerId, itemName)
    -- We only add the required item if it is enabled
    if (itemName == Config.RequiredItem.Item and not Config.RequiredItem.Enabled) then
        return
    end

    if ESX then
        local xPlayer = ESX.GetPlayerFromId(playerId)
        xPlayer.addInventoryItem(itemName, 1)
    elseif QBCore then
        local Player = QBCore.Functions.GetPlayer(playerId)
        Player.Functions.AddItem(itemName, 1)
    end
end
