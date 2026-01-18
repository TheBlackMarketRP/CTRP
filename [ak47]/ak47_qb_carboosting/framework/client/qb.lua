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
    Init()
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
	NotifyNui(msg, type)
end

GetVehicleProperties = function(vehicle)
    local prop = QBCore.Functions.GetVehicleProperties(vehicle)
    if GetResourceState('LegacyFuel') == 'started' then
        prop.fuelLevel = exports['LegacyFuel']:GetFuel(vehicle)
    elseif GetResourceState('ps-fuel') == 'started' then
        prop.fuelLevel = exports['ps-fuel']:GetFuel(vehicle)
    end
    return prop
end

GetPlate = function(vehicle)
    return (string.gsub(GetVehicleNumberPlateText(vehicle), '^%s*(.-)%s*$', '%1'))
end

GetSpawnPointVehicles = function(coords, radius, ignore)
    coords = vector3(coords.x, coords.y, coords.z)
    local vehicles = GetGamePool('CVehicle')
    local closeVeh = {}
    for i = 1, #vehicles, 1 do
        if not ignore or (ignore and vehicles[i] ~= ignore) then
            local vehicleCoords = GetEntityCoords(vehicles[i])
            local distance = #(vehicleCoords - coords)
            if distance <= radius then
                closeVeh[#closeVeh + 1] = VehToNet(vehicles[i])
            end
        end
    end
    return closeVeh
end