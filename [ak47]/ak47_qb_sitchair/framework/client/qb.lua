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

function IsDead(target)
    local ped = target and GetPlayerPed(GetPlayerFromServerId(target)) or PlayerPedId()
    if target then
        if Player(target).state.down or Player(target).state.dead then
            return true
        end
    else
        if LocalPlayer.state.down or LocalPlayer.state.dead then
            return true
        end
    end
    if IsEntityDead(ped) or
        IsEntityPlayingAnim(ped, 'combat@damage@writhe', 'writhe_loop', 3) or
        IsEntityPlayingAnim(ped, 'dead', 'dead_a', 3) or
        IsEntityPlayingAnim(ped, 'dead', 'dead_b', 3) or
        IsEntityPlayingAnim(ped, 'dead', 'dead_c', 3) then
        return true
    end
    return false
end