local QBCore = exports['qb-core']:GetCoreObject()

local function ShowNotification(title, message, type)
    if Config.NotificationSystem == 'okokNotify' then
        TriggerEvent('okokNotify:Alert', title, message, 5000, type)
    elseif Config.NotificationSystem == 'QBCore' then
        QBCore.Functions.Notify(message, type)
    elseif Config.NotificationSystem == 'ox_lib' then
        lib.notify({
            title = title,
            description = message,
            type = type
        })
    end
end

local function IsRestrictedVehicle(vehicle)
    local model = GetEntityModel(vehicle)
    for job, data in pairs(Config.JobVehicles) do
        for _, allowedModel in ipairs(data.vehicles) do
            if model == allowedModel then
                return job
            end
        end
    end
    return nil
end

local function TeleportToLeftOfVehicle(ped, vehicle)
    local offset = GetOffsetFromEntityInWorldCoords(vehicle, 
        Config.TeleportOffset.x, 
        Config.TeleportOffset.y, 
        Config.TeleportOffset.z)
    SetEntityCoords(ped, offset.x, offset.y, offset.z) 
end

CreateThread(function()
    while true do
        Wait(Config.CheckInterval)

        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)

        if vehicle and DoesEntityExist(vehicle) and GetPedInVehicleSeat(vehicle, -1) == ped then
            local PlayerData = QBCore.Functions.GetPlayerData()
            if PlayerData and PlayerData.job then
                local job = PlayerData.job.name
                local restrictedJob = IsRestrictedVehicle(vehicle)

                if restrictedJob and restrictedJob ~= job then
                    TaskLeaveVehicle(ped, vehicle, 0)
                    Wait(500)

                    TeleportToLeftOfVehicle(ped, vehicle)

                    ShowNotification(
                        Config.Translations.error_title, 
                        Config.Translations.no_permission, 
                        'error'
                    )
                end
            end
        end
    end
end)