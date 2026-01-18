QBCore = exports['qb-core']:GetCoreObject()
PlayerData = {}

Citizen.CreateThread(function()
    while QBCore.Functions.GetPlayerData() == nil do
        Citizen.Wait(0)
    end
    while QBCore.Functions.GetPlayerData().job == nil do
        Citizen.Wait(0)
    end
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

Notify = function(msg, type)
	if type == 'success' then
		QBCore.Functions.Notify(msg, 'success')
	elseif type == 'warning' then
		QBCore.Functions.Notify(msg, 'error')
	elseif type == 'error' then
		QBCore.Functions.Notify(msg, 'error')
	else
		QBCore.Functions.Notify(msg)
	end
end