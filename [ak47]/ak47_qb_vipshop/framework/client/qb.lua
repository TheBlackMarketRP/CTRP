QBCore = exports['qb-core']:GetCoreObject()
PlayerData = {}

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        local data = QBCore.Functions.GetPlayerData()
        if data and data.job then
            PlayerData = data
            Init()
        end
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    while not QBCore.Functions.GetPlayerData().job do Wait(1000) end
    PlayerData = QBCore.Functions.GetPlayerData()
    Init()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(data)
    PlayerData = data
end)

RegisterNetEvent('ak47_qb_vipshop:notify', function( msg, type )
    Notify(msg, type)
end)
