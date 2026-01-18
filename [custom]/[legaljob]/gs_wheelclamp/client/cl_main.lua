local inAction = false

function PlayAnim(dict, anim, time, flag, blend)
    if (dict == '' or anim == '') then return end

    local Flag = flag or 1
    local Blend = blend or 8.0

    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(50)
    end

    local ped = PlayerPedId()
    TaskPlayAnim(ped, dict, anim, Blend, Blend, -1, Flag, 1.0)
    RemoveAnimDict(dict)
end

function PrepareClampCreation(vehicle, boneName)
    -- Get the correct wheel index
    local wheelIndex = nil
    for i, v in ipairs(Config.Bones) do
        if v == boneName then
            wheelIndex = i
            break
        end
    end
    if GetVehicleClass(vehicle) == 8 then
        -- Bikes
        local numberOfWheels = GetVehicleNumberOfWheels(vehicle)
        if numberOfWheels > 2 then
            wheelIndex = Config.ThreeWheelBikeIndices[wheelIndex]
        else
            wheelIndex = Config.TwoWheelBikeIndices[wheelIndex]
        end
    else
        wheelIndex = wheelIndex - 1 -- Compensate for the 1-based index (0,1,2 etc. instead of 1,2,3)
    end

    local vehicleNetId = NetworkGetNetworkIdFromEntity(vehicle)
    TriggerServerEvent('gs_wheelclamp:createClampObject', vehicleNetId, boneName, wheelIndex)
end

function GetVehicleClampWheelIndex()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped)
    if vehicle == 0 then
        return -1, -1
    end

    local driver = GetPedInVehicleSeat(vehicle, -1)
    if driver ~= ped then
        return -1, -1
    end

    local wheelIndex = Entity(vehicle).state.wheelClampIndex
    if wheelIndex == nil then
        return -1, -1
    end

    return vehicle, wheelIndex
end

function DoesWheelExistAndIsPlayerClose(vehicle, boneIndex)
    local bonePosition = GetEntityBonePosition_2(vehicle, boneIndex)
    local boneDist = #(bonePosition - GetEntityCoords(vehicle))
    if boneDist < 0.1 then
        -- The wheel does not exist, this is the only way to check if BreakOffVehicleWheel has been triggered,
        -- as bonePosition will return almost exactly the vehicleCoords
        return false
    end

    -- Check if the player is close to the wheel
    local ped = PlayerPedId()
    local pedDist = #(bonePosition - GetEntityCoords(ped))
    if pedDist > Config.InteractionRange then
        return false
    end

    return true
end

function IsPlayerCloseToWheelClamp(wheelClampNetId)
    if not NetworkDoesEntityExistWithNetworkId(wheelClampNetId) then return false end
    local clampObject = NetworkGetEntityFromNetworkId(wheelClampNetId)
    local clampCoords = GetEntityCoords(clampObject)
    local dist = #(clampCoords - GetEntityCoords(PlayerPedId()))
    if dist > Config.InteractionRange then return false end
    return true
end

function table.contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

function SetPlayerHeadingToWheel(data)
    local ped = PlayerPedId()
    local boneIndex = GetEntityBoneIndexByName(data.entity, data.bones)
    local bonePosition = GetEntityBonePosition_2(data.entity, boneIndex)
    local playerCoords = GetEntityCoords(ped)
    local heading = GetHeadingFromVector_2d(bonePosition.x - playerCoords.x, bonePosition.y - playerCoords.y)
    SetEntityHeading(ped, heading)
end

RegisterNetEvent('gs_wheelclamp:attachClamp', function(vehicleNetId, objectNetId, boneName, wheelIndex)
    if not NetworkDoesEntityExistWithNetworkId(vehicleNetId) then return end
    local vehicle = NetworkGetEntityFromNetworkId(vehicleNetId)

    if not NetworkDoesEntityExistWithNetworkId(objectNetId) then return end
    local object = NetworkGetEntityFromNetworkId(objectNetId)
    SetEntityCollision(object, false, false)

    local boneIndex = GetEntityBoneIndexByName(vehicle, boneName)
    local bonePosition = GetEntityBonePosition_2(vehicle, boneIndex)
    local offsetCoords = GetOffsetFromEntityGivenWorldCoords(vehicle, table.unpack(bonePosition))
    local sign = 1
    if offsetCoords[1] > 0.0 then sign = -1 end
    local wheelSize = GetVehicleWheelTireColliderSize(vehicle, wheelIndex)
    AttachEntityToEntity(object, vehicle, GetEntityBoneIndexByName(vehicle, 'chassis'), offsetCoords[1] - sign * wheelSize / 3, offsetCoords[2], offsetCoords[3] - 0.05, 270.0, 180.0, sign * 90.0, 0, 0, 0, 0, 0, 1)
end)

CreateThread(function()
    function onAddWheelClamp(data)
        inAction = true

        SetPlayerHeadingToWheel(data)
        local didComplete = Functions.WhileAddingWheelClamp()
        local boneIndex = GetEntityBoneIndexByName(data.entity, data.bones)
        if didComplete and DoesWheelExistAndIsPlayerClose(data.entity, boneIndex) then
            PrepareClampCreation(data.entity, data.bones)
        end

        inAction = false
    end

    function canAddWheelClamp(entity, _, _, _, bone)
        if type(bone) ~= "number" then
            bone = GetEntityBoneIndexByName(entity, bone)
        end
        return not inAction and Entity(entity).state.wheelClampNetId == nil and DoesWheelExistAndIsPlayerClose(entity, bone) and not table.contains(Config.BlacklistClasses, GetVehicleClass(entity)) and Functions.CanInteract()
    end

    function onRemoveWheelClamp(data)
        inAction = true

        SetPlayerHeadingToWheel(data)
        local didComplete = Functions.WhileRemovingWheelClamp()
        local wheelClampNetId = Entity(data.entity).state.wheelClampNetId
        local boneIndex = GetEntityBoneIndexByName(data.entity, data.bones)
        if didComplete and DoesWheelExistAndIsPlayerClose(data.entity, boneIndex) and IsPlayerCloseToWheelClamp(wheelClampNetId) then
            TriggerServerEvent('gs_wheelclamp:removeClamp', NetworkGetNetworkIdFromEntity(data.entity), true)
        end

        inAction = false
    end

    function canRemoveWheelClamp(entity, _, _, _, bone)
        if type(bone) ~= "number" then
            bone = GetEntityBoneIndexByName(entity, bone)
        end

        local wheelClampNetId = Entity(entity).state.wheelClampNetId
        return not inAction and wheelClampNetId ~= nil and DoesWheelExistAndIsPlayerClose(entity, bone) and IsPlayerCloseToWheelClamp(wheelClampNetId) and Functions.CanInteract()
    end

    function onLockpickWheelClamp(data)
        inAction = true

        SetPlayerHeadingToWheel(data)
        local prepared = Functions.PrepareLockpick()
        if not prepared then
            inAction = false
            return
        end

        local didComplete = Functions.LockpickMinigame()
        local wheelClampNetId = Entity(data.entity).state.wheelClampNetId
        local boneIndex = GetEntityBoneIndexByName(data.entity, data.bones)
        if DoesWheelExistAndIsPlayerClose(data.entity, boneIndex) and IsPlayerCloseToWheelClamp(wheelClampNetId) then
            if didComplete then
                TriggerServerEvent('gs_wheelclamp:removeClamp', NetworkGetNetworkIdFromEntity(data.entity), false)
            else
                TriggerServerEvent('gs_wheelclamp:removeItem', Config.Lockpick.Item)
            end
        end

        inAction = false
    end

    function canLockpickWheelClamp(entity, _, _, _, bone)
        if type(bone) ~= "number" then
            bone = GetEntityBoneIndexByName(entity, bone)
        end

        local wheelClampNetId = Entity(entity).state.wheelClampNetId
        return not inAction and wheelClampNetId ~= nil and DoesWheelExistAndIsPlayerClose(entity, bone) and IsPlayerCloseToWheelClamp(wheelClampNetId) and Functions.CanInteract()
    end

    Functions.CreateGlobalVehicleTargets(onAddWheelClamp, canAddWheelClamp, onRemoveWheelClamp, canRemoveWheelClamp, onLockpickWheelClamp, canLockpickWheelClamp)
end)

CreateThread(function()
    while true do
        -- Check if there is a clamp present on a wheel
        local vehicle, wheelIndex = GetVehicleClampWheelIndex()
        if wheelIndex == -1 then
            Wait(1000)
        else
            if (Config.DisableVehicleMovement) then
                DisableControlAction(0, 71, true)
                DisableControlAction(0, 72, true)
            end

            if (Config.DisableSteering) then
                local vehicleClass = GetVehicleClass(vehicle)
                local numberOfWheels = GetVehicleNumberOfWheels(vehicle)
                if (vehicleClass ~= 8 and (wheelIndex == 0 or wheelIndex == 1)) or (vehicleClass == 8 and wheelIndex == 1 and numberOfWheels <= 2) or (vehicleClass == 8 and wheelIndex == 0 and numberOfWheels > 2) then
                    DisableControlAction(0, 59, true)
                    DisableControlAction(0, 63, true)
                end
            end

            SetVehicleWheelBrakePressure(vehicle, wheelIndex, 1.0)
            SetVehicleWheelTractionVectorLength(vehicle, wheelIndex, 10.0)
            Wait(0)
        end
    end
end)

CreateThread(function()
    if (Config.WheelBreakoff.Enabled == false) then return end
    while true do
        Wait(Config.WheelBreakoff.IntervalTime)
        -- Check if there is a clamp present on a wheel
        local vehicle, wheelIndex = GetVehicleClampWheelIndex()
        if wheelIndex ~= -1 then
            -- Ensure ped is going faster then Config.WheelBreakoff.MinimumSpeed
            local speed = GetEntitySpeed(vehicle) * 3.6 -- Convert to Km/h
            if speed > Config.WheelBreakoff.MinimumSpeed then
                -- Random change of wheel breaking of, if so, remove the clamp as well
                local breakPercentage = (speed - Config.WheelBreakoff.MinimumSpeed) * Config.WheelBreakoff.ChanceMultiplier
                local rnd = math.random(0, 100)
                if rnd <= breakPercentage then
                    BreakOffVehicleWheel(vehicle, wheelIndex, false, false, true, false)
                    TriggerServerEvent('gs_wheelclamp:removeClamp', NetworkGetNetworkIdFromEntity(vehicle), false)
                end
            end
        end
    end
end)
