RegisterNetEvent('ak47_qb_mechanic:onuse:tirerepairkit', function()
    local vehicle, distance = GetClosestVehicle()
    if vehicle == 0 or distance > 5.0 then return end
    local closestWheel = GetClosestWheel(vehicle)
    if not closestWheel then return end
    ShowProgress({
        label = _U('repair_tire'),
        duration = 10 * 1000,
        canCancel = true,
        disable = {
            combat = true,
            move = true,
            car = true
        },
        anim = {
            dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            clip = 'machinic_loop_mechandplayer',
            flag = 1
        },
        prop = {
            model = 'prop_wheel_tyre',
            pos = vector3(-0.05, 0.16, 0.32),
            rot = vector3(-130.0, -55.0, 150.0),
            bone = 60309
        }
    }, function()
        if lib.callback.await('ak47_qb_mechanic:hasitem', nil, 'tirerepairkit') then
            TriggerServerEvent('ak47_qb_mechanic:removeitem', 'tirerepairkit')
            SetVehicleTyreFixed(vehicle, closestWheel)
            Notify(_U('tire_repaired'), 'success')
        end
    end)
end)

RegisterNetEvent('ak47_qb_mechanic:onuse:repairkit', function()
    local vehicle, distance = GetClosestVehicle()
    if vehicle == 0 or distance > 5.0 then return end
    if not IsNearBone(vehicle, 'engine') then return end
    ToggleHood(vehicle)
    ShowProgress({
        label = _U('repair_vehicle'),
        duration = 10 * 1000,
        canCancel = true,
        disable = {
            combat = true,
            move = true,
            car = true
        },
        anim = {
            dict = 'mini@repair',
            clip = 'fixing_a_player',
            flag = 1
        },
        prop = {
            model = 'imp_prop_impexp_span_03',
            pos = vector3(0.06, 0.01, -0.02),
            rot = vector3(0.0, 0.0, 0.0),
            bone = 28422
        }
    }, function()
        if lib.callback.await('ak47_qb_mechanic:hasitem', nil, 'repairkit') then
            SetVehicleEngineHealth(vehicle, 1000.0)
            SetVehicleBodyHealth(vehicle, 1000.0)
            ToggleHood(vehicle)
            Notify(_U('repaired'), 'success')
            TriggerServerEvent('ak47_qb_mechanic:removeitem', 'repairkit')
        end
    end, function()
        ToggleHood(vehicle)
    end)
end)

RegisterNetEvent('ak47_qb_mechanic:onuse:advancedrepairkit', function()
    local vehicle, distance = GetClosestVehicle()
    if vehicle == 0 or distance > 5.0 then return end
    if not IsNearBone(vehicle, 'engine') then return end
    ToggleHood(vehicle)
    ShowProgress({
        label = _U('repair_vehicle'),
        duration = 10 * 1000,
        canCancel = true,
        disable = {
            combat = true,
            move = true,
            car = true
        },
        anim = {
            dict = 'mini@repair',
            clip = 'fixing_a_player',
            flag = 1
        },
        prop = {
            model = 'imp_prop_impexp_span_03',
            pos = vector3(0.06, 0.01, -0.02),
            rot = vector3(0.0, 0.0, 0.0),
            bone = 28422
        }
    }, function()
        if lib.callback.await('ak47_qb_mechanic:hasitem', nil, 'advancedrepairkit') then
            SetVehicleEngineHealth(vehicle, 1000.0)
            SetVehicleBodyHealth(vehicle, 1000.0)
            SetVehicleDeformationFixed(vehicle)
            SetVehiclePetrolTankHealth(vehicle, 1000.0)
            SetVehicleFixed(vehicle)
            ToggleHood(vehicle)
            Notify(_U('repaired'), 'success')
            TriggerServerEvent('ak47_qb_mechanic:removeitem', 'advancedrepairkit')
        end
    end, function()
        ToggleHood(vehicle)
    end)
end)

RegisterNetEvent('ak47_qb_mechanic:onuse:cleaningkit', function()
    local vehicle, distance = GetClosestVehicle()
    if vehicle == 0 or distance > 5.0 then return end
    ShowProgress({
        label = _U('cleaning'),
        duration = 10 * 1000,
        canCancel = true,
        disable = {
            combat = true,
            move = true,
            car = true
        },
        anim = {
            dict = 'amb@world_human_maid_clean@',
            clip = 'base',
            flag = 1
        },
        prop = {
            model = 'prop_sponge_01',
            pos = vector3(0.0, 0.0, -0.01),
            rot = vector3(90.0, 0.0, 0.0),
            bone = 28422
        }
    }, function()
        if lib.callback.await('ak47_qb_mechanic:hasitem', nil, 'cleaningkit') then
            SetVehicleDirtLevel(vehicle, 0.0)
            Notify(_U('cleaned'), 'success')
            TriggerServerEvent('ak47_qb_mechanic:removeitem', 'cleaningkit')
        end
    end)
end)

RegisterNetEvent('qb-mechanicjob:client:fixEverything', function()
    FixEverything()
end)

RegisterNetEvent('ak47_qb_mechanic:fixvehicle', function()
    FixEverything()
end)

FixEverything = function()
    local vehicle = GetVehiclePedIsUsing(PlayerPedId())
    SetVehicleUndriveable(vehicle, false)
    WashDecalsFromVehicle(vehicle, 1.0)
    SetVehicleEngineHealth(vehicle, 1000.0)
    SetVehicleBodyHealth(vehicle, 1000.0)
    SetVehiclePetrolTankHealth(vehicle, 1000.0)
    SetVehicleDirtLevel(vehicle, 0.0)
    SetVehicleDeformationFixed(vehicle)
    for i = 0, 5 do
        SetVehicleTyreFixed(vehicle, i)
    end
    for i = 0, 7 do
        FixVehicleWindow(vehicle, i)
    end
    SetVehicleFixed(vehicle)
    setVehicleFuel(vehicle, 100)
    Notify(_U('repaired'), 'success')
end
