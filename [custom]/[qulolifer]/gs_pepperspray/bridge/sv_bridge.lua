local ESX = nil
local QBCore = nil

-- Select the correct framework
CreateThread(function()
    if (GetResourceState('es_extended') == 'started') then
        ESX = exports['es_extended']:getSharedObject()
    elseif (GetResourceState('qb-core') == 'started') then
        QBCore = exports['qb-core']:GetCoreObject()
    end
end)

Functions = {}

Functions.CanPlayerApplySprayEffect = function(source)
    if (not Config.JobRequirement.Enabled) then
        return true
    end

    local playerJobName = 'unemployed'
    if (ESX ~= nil) then
        local xPlayer = ESX.GetPlayerFromId(source)
        playerJobName = xPlayer.job.name or 'unemployed'
    elseif (QBCore ~= nil) then
        local Player = QBCore.Functions.GetPlayer(source)
        playerJobName = Player.PlayerData.job?.name or 'unemployed'
    end

    for _, jobName in ipairs(Config.JobRequirement.JobNames or {}) do
        if (playerJobName == jobName) then
            return true
        end
    end
    return false
end
