QBCore = exports['qb-core']:GetCoreObject()
PlayerData = {}
PlayerLoaded = false

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        local data = QBCore.Functions.GetPlayerData()
        if data and data.job then
            PlayerData = data
            PlayerLoaded = true
            Init()
        end
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    while not QBCore.Functions.GetPlayerData().job do Wait(1000) end
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerLoaded = true
    Init()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(data)
    PlayerData = data
end)

RegisterNetEvent('ak47_qb_drugmanagerv2:notify', function(msg, type)
    Notify(msg, type)
end)

GetJobList = function()
    return QBCore.Shared.Jobs
end

GetGangList = function()
    if GetResourceState('ak47_qb_gangs') == 'started' or GetResourceState('ak47_qb_territories') == 'started' then
        local gangs = lib.callback.await('ak47_qb_drugmanagerv2:getakganglist')
        local gangTable = {}
        if gangs and gangs[1] then
            for i, v in pairs(gangs) do
                gangTable[v.tag] = {
                    label = v.label,
                    grades = {}
                }
                local ranks = json.decode(v.ranks)
                for j, k in pairs(ranks) do
                    gangTable[v.tag].grades[k.id] = {
                        name = k.label
                    }
                end
            end
        end
        return gangTable
    end
    return QBCore.Shared.Gangs
end

GetPlayerJobName = function()
    return PlayerData and PlayerData.job.name
end

GetPlayerJobRank = function()
    return PlayerData and PlayerData.job.grade.level
end

GetPlayerGangName = function()
    if GetResourceState('ak47_qb_gangs') == 'started' then
        local gang = exports['ak47_qb_gangs']:GetPlayerGang()
        return gang and gang.tag
    elseif GetResourceState('ak47_qb_territories') == 'started' then
        local gang = exports['ak47_qb_territories']:GetPlayerGang()
        return gang and gang.tag
    end
    return PlayerData and PlayerData.gang.name
end

GetPlayerGangRank = function()
    if GetResourceState('ak47_qb_gangs') == 'started' then
        local gang = exports['ak47_qb_gangs']:GetPlayerGang()
        return gang and gang.rankid
    elseif GetResourceState('ak47_qb_territories') == 'started' then
        local gang = exports['ak47_qb_territories']:GetPlayerGang()
        return gang and gang.rankid
    end
    return PlayerData and PlayerData.gang.grade.level
end

ReliveStress = function( value )
    TriggerServerEvent('hud:server:RelieveStress', value)
end

IsDead = function()
    return QBCore.Functions.GetPlayerData().metadata['isdead']
end