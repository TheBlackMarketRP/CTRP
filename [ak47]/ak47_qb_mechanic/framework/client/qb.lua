QBCore = exports['qb-core']:GetCoreObject()
PlayerData = {}

pError = function(err)
    print(string.format("^1SCRIPT ERROR: %s^0", err))
end

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

RegisterNetEvent('ak47_qb_mechanic:notify', function(msg, type)
    Notify(msg, type)
end)

IsSpawnPointClear = function(coords, radius, ignore)
    if coords then
        coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
    else
        coords = GetEntityCoords(PlayerPedId())
    end
    local vehicles = GetGamePool('CVehicle')
    local closeVeh = {}
    for i = 1, #vehicles, 1 do
        if not ignore or (ignore and vehicles[i] ~= ignore) then
            local vehicleCoords = GetEntityCoords(vehicles[i])
            local distance = #(vehicleCoords - coords)
            if distance <= radius then
                closeVeh[#closeVeh + 1] = vehicles[i]
            end
        end
    end
    if #closeVeh > 0 then return false end
    return true
end

NetControl = function(vehicle)
    local lastTime = GetGameTimer()
    if not NetworkHasControlOfEntity(vehicle) then
        while not NetworkHasControlOfEntity(vehicle) do
            NetworkRequestControlOfEntity(vehicle)
            Wait(100)
            if GetGameTimer() - lastTime > 5000 then
                return false
            end
        end
    end
    return true
end


SetVehicleProperties = function(vehicle, properties)
    QBCore.Functions.SetVehicleProperties(vehicle, properties)
end

GetVehicleProperties = function(vehicle)
    local prop = QBCore.Functions.GetVehicleProperties(vehicle)
    if GetResourceState('LegacyFuel') == 'started' then
        prop.fuelLevel = exports['LegacyFuel']:GetFuel(vehicle)
    elseif GetResourceState('ps-fuel') == 'started' then
        prop.fuelLevel = exports['ps-fuel']:GetFuel(vehicle)
    end
    if prop.windowTint == -1 then
        prop.windowTint = 0
    end
    if prop.modTurbo == false then
        prop.modTurbo = 0
    end
    if prop.modXenon == false then
        prop.modXenon = 0
    end
    if prop.modSmokeEnabled == false then
        prop.modSmokeEnabled = 0
    end
    return prop
end

function GetClosestVehicle(coords)
    local ped = PlayerPedId()
    local vehicles = GetGamePool('CVehicle')
    local closestDistance = -1
    local closestVehicle = -1
    if coords then
        coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
    else
        coords = GetEntityCoords(ped)
    end
    for i = 1, #vehicles, 1 do
        local vehicleCoords = GetEntityCoords(vehicles[i])
        local distance = #(vehicleCoords - coords)

        if closestDistance == -1 or closestDistance > distance then
            closestVehicle = vehicles[i]
            closestDistance = distance
        end
    end
    return closestVehicle, closestDistance
end

local WheelBones = {
    [0] = 'wheel_lf',
    [1] = 'wheel_rf',
    [2] = 'wheel_lm',
    [3] = 'wheel_rm',
    [4] = 'wheel_lr',
    [5] = 'wheel_rr',
}

function GetClosestWheel(vehicle)
    local playerCoords = GetEntityCoords(PlayerPedId())
    local closestWheelIndex
    for wheelIndex, wheelBone in pairs(WheelBones) do
        local wheelBoneIndex = GetEntityBoneIndexByName(vehicle, wheelBone)
        if wheelBoneIndex ~= -1 then
            local wheelPos = GetWorldPositionOfEntityBone(vehicle, wheelBoneIndex)
            if #(playerCoords - wheelPos) <= 1.5 then
                closestWheelIndex = wheelIndex
                break
            end
        end
    end
    return closestWheelIndex
end

function ToggleHood(vehicle)
    if GetVehicleDoorAngleRatio(vehicle, 4) > 0.0 then
        SetVehicleDoorShut(vehicle, 4, false)
    else
        SetVehicleDoorOpen(vehicle, 4, false, false)
    end
end

function IsNearBone(vehicle, bone)
    local playerCoords = GetEntityCoords(PlayerPedId())
    local vehicleBoneIndex = GetEntityBoneIndexByName(vehicle, bone)
    if vehicleBoneIndex ~= -1 then
        local bonePos = GetWorldPositionOfEntityBone(vehicle, vehicleBoneIndex)
        if #(playerCoords - bonePos) <= 1.5 then
            return true
        end
    end
    return false
end

GetPlate = function(vehicle)
    return (string.gsub(GetVehicleNumberPlateText(vehicle), '^%s*(.-)%s*$', '%1'))
end

GetPlayerJobName = function()
    return PlayerData and PlayerData.job.name
end

GetPlayerJobRank = function()
    return PlayerData and PlayerData.job.grade.level
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    BeginTextCommandDisplayText('STRING')
    SetTextCentre(true)
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(x, y, z, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

ShowHelpNotification = function(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end