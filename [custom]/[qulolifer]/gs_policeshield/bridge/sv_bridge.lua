---@diagnostic disable: undefined-field
ESX = nil
QBCore = nil

if (GetResourceState('es_extended') == 'started') then
    ESX = exports['es_extended']:getSharedObject()
elseif (GetResourceState('qb-core') == 'started') then
    QBCore = exports['qb-core']:GetCoreObject()
end

Functions = {}

Functions.CanUseShield = function(playerId, shieldType)
    if not Config.shields[shieldType].jobs then
        return true
    end

    if ESX then
        local xPlayer = ESX.GetPlayerFromId(playerId)
        local playerJobName = xPlayer.job.name
        local playerJobGrade = xPlayer.job.grade

        for job, grade in pairs(Config.shields[shieldType].jobs) do
            if (playerJobName == job) and (playerJobGrade >= grade) then
                return true
            end
        end

        return false
    elseif QBCore then
        local Player = QBCore.Functions.GetPlayer(playerId)
        local playerJobName = Player.PlayerData.job?.name or 'unemployed'
        local playerJobGrade = Player.PlayerData.job?.grade?.level or 0

        for job, grade in pairs(Config.shields[shieldType].jobs) do
            if (playerJobName == job) and (playerJobGrade >= grade) then
                return true
            end
        end
    end

    return false
end

Functions.HasItem = function(playerId, itemName)
    if (not Config.enableItems) then
        return true
    end

    if ESX then
        local xPlayer = ESX.GetPlayerFromId(playerId)
        return xPlayer.getInventoryItem(itemName).count > 0
    elseif QBCore then
        local Player = QBCore.Functions.GetPlayer(playerId)
        return Player.Functions.GetItemByName(itemName).amount > 0
    end
end

Functions.OnShieldUse = function(playerId, shieldType)
    local itemName = Config.shields[shieldType].itemName

    if Config.removeItem and Config.enableItems then
        if ESX then
            local xPlayer = ESX.GetPlayerFromId(playerId)
            xPlayer.removeInventoryItem(itemName, 1)
        elseif QBCore then
            local Player = QBCore.Functions.GetPlayer(playerId)
            Player.Functions.RemoveItem(itemName, 1)
        end
    end
end

Functions.OnShieldRemove = function(playerId, shieldType)
    local itemName = Config.shields[shieldType].itemName

    if Config.removeItem and Config.enableItems then
        if ESX then
            local xPlayer = ESX.GetPlayerFromId(playerId)
            xPlayer.addInventoryItem(itemName, 1)
        elseif QBCore then
            local Player = QBCore.Functions.GetPlayer(playerId)
            Player.Functions.AddItem(itemName, 1)
        end
    end
end

Functions.RegisterItem = function(itemName, onItemUse)
    if (GetResourceState('ox_inventory') == 'started') then
        exports(itemName, function(event, item, inventory, slot, data)
            local playerId = inventory.id
            if (event == 'usingItem') then
                onItemUse(playerId)
                return false
            end
        end)
    elseif (GetResourceState('es_extended') == 'started') then
        ESX.RegisterUsableItem(itemName, function(source)
            onItemUse(source)
        end)
    elseif (GetResourceState('qb-core') == 'started') then
        QBCore.Functions.CreateUseableItem(itemName, function(source)
            onItemUse(source)
        end)
    else
        print('gs_policeshield: [ERROR] No inventory framework detected')
    end
end
