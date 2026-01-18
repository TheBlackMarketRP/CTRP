function setVehicleFuel(vehicle, fuel)
    local fuel = fuel or 100
    if GetResourceState('LegacyFuel') == 'started' then
        exports['LegacyFuel']:SetFuel(vehicle, tonumber(fuel) + 0.0)
    elseif GetResourceState('ps-fuel') == 'started' then
        exports['ps-fuel']:SetFuel(vehicle, tonumber(fuel) + 0.0)
    else
        --custom fuel code here
        SetVehicleFuelLevel(vehicle, 100.0)
    end
end

function givekey(vehicle, plate)
    -- give vehicle key here
    if GetResourceState('ak47_qb_vehiclekeys') == 'started' then
        exports['ak47_qb_vehiclekeys']:GiveKey(plate)
    elseif GetResourceState('wasabi_carlock') == 'started' then
        exports['wasabi_carlock']:GiveKey(plate)
    elseif GetResourceState('cd_garage') == 'started' then
        TriggerEvent('cd_garage:AddKeys', exports['cd_garage']:GetPlate(vehicle))
    elseif GetResourceState('qs-vehiclekeys') == 'started' then
        exports['qs-vehiclekeys']:GiveKeys(plate, GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)), true)
    elseif GetResourceState('qb-vehiclekeys') == 'started' then
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
    else
        --custom code here

    end
end

function CustomDispatch(coords)
    --your export here
    if GetResourceState('cd_dispatch3d') == 'started' or GetResourceState('cd_dispatch') == 'started' then
        local dispatch = GetResourceState('cd_dispatch3d') == 'started' and 'cd_dispatch3d' or (GetResourceState('cd_dispatch') == 'started' and 'cd_dispatch')
        local data = exports[dispatch]:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = {'police'},
            coords = data.coords,
            title = 'Car Boosting',
            message = ('A %s is involved in car boosting at %s'):format(data.sex, data.street),
            flash = false,
            sound = 1,
            blip = {
                sprite = 225,
                scale = 1.2,
                colour = 3,
                flashes = false,
                text = 'Car Boosting',
                time = 5,
                radius = 0,
            }
        })
    else
        -- your export here
    end
end