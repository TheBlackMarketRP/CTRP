local oxlib = nil
if GetResourceState('ox_lib') == 'started' then
    oxlib = exports.ox_lib
end

Functions = {}

-- If this function returnes true, the player can interact with the target
Functions.CanInteract = function()
    local playerPed = PlayerPedId()

    if IsPedDeadOrDying(playerPed, true) then
        return false
    end

    if IsPedInAnyVehicle(playerPed, false) then
        return false
    end

    return true
end

-- The code in this function is executed when the player is adding a wheel clamp
Functions.WhileAddingWheelClamp = function()
    local didComplete = false
    PlayAnim(Config.Animations.PlaceClamp.Dict, Config.Animations.PlaceClamp.Name, Config.Animations.PlaceClamp.Time, Config.Animations.PlaceClamp.Flag, Config.Animations.PlaceClamp.Blend)
    if (oxlib ~= nil) then
        didComplete = oxlib:progressCircle({
            duration = Config.Animations.PlaceClamp.Time,
            position = 'middle',
            label = Config.Locales['wheel_clamp_attaching'],
            canCancel = true,
            disable = { car = true, move = true, combat = true },
        })
    else
        Wait(Config.Animations.PlaceClamp.Time)
        didComplete = true
    end
    StopAnimTask(PlayerPedId(), Config.Animations.PlaceClamp.Dict, Config.Animations.PlaceClamp.Name, Config.Animations.PlaceClamp.Blend)

    return didComplete -- Make sure the function returns true on success
end

-- The code in this function is executed when the player is removing a wheel clamp
Functions.WhileRemovingWheelClamp = function()
    local didComplete = false
    PlayAnim(Config.Animations.RemoveClamp.Dict, Config.Animations.RemoveClamp.Name, Config.Animations.RemoveClamp.Time, Config.Animations.RemoveClamp.Flag, Config.Animations.RemoveClamp.Blend)
    if (oxlib ~= nil) then
        didComplete = oxlib:progressCircle({
            duration = Config.Animations.RemoveClamp.Time,
            position = 'middle',
            label = Config.Locales['wheel_clamp_detaching'],
            canCancel = true,
            disable = { car = true, move = true, combat = true },
        })
    else
        Wait(Config.Animations.RemoveClamp.Time)
        didComplete = true
    end
    StopAnimTask(PlayerPedId(), Config.Animations.RemoveClamp.Dict, Config.Animations.RemoveClamp.Name, Config.Animations.RemoveClamp.Blend)

    return didComplete -- Make sure the function returns true on success
end

-- Any code you want to execute before someone starts lockpicking
Functions.PrepareLockpick = function()
    local didComplete = false
    PlayAnim(Config.Animations.PrepareLockpick.Dict, Config.Animations.PrepareLockpick.Name, Config.Animations.PrepareLockpick.Time, Config.Animations.PrepareLockpick.Flag, Config.Animations.PrepareLockpick.Blend)
    if (oxlib ~= nil) then
        didComplete = oxlib:progressCircle({
            duration = Config.Animations.PrepareLockpick.Time,
            position = 'middle',
            label = Config.Locales['lockpick_prepare'],
            canCancel = true,
            disable = { car = true, move = true, combat = true },
        })
    else
        Wait(Config.Animations.PrepareLockpick.Time)
        didComplete = true
    end

    if (not didComplete) then
        StopAnimTask(PlayerPedId(), Config.Animations.PrepareLockpick.Dict, Config.Animations.PrepareLockpick.Name, Config.Animations.PrepareLockpick.Blend)
    end

    return didComplete -- Make sure the function returns true on success
end

Functions.LockpickMinigame = function()
    PlayAnim(Config.Animations.Lockpicking.Dict, Config.Animations.Lockpicking.Name, Config.Animations.Lockpicking.Time, Config.Animations.Lockpicking.Flag, Config.Animations.Lockpicking.Blend)
    local lockpickSuccess = true
    if (oxlib ~= nil) then
        for i = 1, Config.Lockpick.AmountOfMinigames do
            local success = oxlib:skillCheck({ areaSize = Config.Lockpick.MinigameAreaSize, speedMultiplier = Config.Lockpick.MinigameSpeedMultiplier }, { 'E' })
            if not success then
                lockpickSuccess = false
                break
            end
            Wait(500)
        end
    else
        Wait(Config.Animations.Lockpicking.Time)
        lockpickSuccess = true
    end
    StopAnimTask(PlayerPedId(), Config.Animations.Lockpicking.Dict, Config.Animations.Lockpicking.Name, Config.Animations.Lockpicking.Blend)

    return lockpickSuccess
end

-- This function creates the target options for the vehicle
Functions.CreateGlobalVehicleTargets = function(onAddWheelClamp, canAddWheelClamp, onRemoveWheelClamp, canRemoveWheelClamp, onLockpickWheelClamp, canLockpickWheelClamp)
    local options = {}
    for iWheel, bone in ipairs(Config.Bones) do
        if GetResourceState('ox_target') == 'started' then
            table.insert(options, {
                label = Config.Locales['wheel_clamp'] .. ': ' .. Config.WheelLabels[iWheel],
                icon = 'fa-solid fa-crutch',
                items = Config.RequiredItem.Enabled and Config.RequiredItem.Item or nil,
                distance = Config.InteractionRange or 1.5,
                bones = bone,
                groups = Config.AllowedJobs or nil,
                onSelect = onAddWheelClamp,
                canInteract = canAddWheelClamp,
            })

            table.insert(options, {
                label = Config.Locales['wheel_clamp_remove'],
                icon = 'fa-solid fa-crutch',
                distance = Config.InteractionRange or 1.5,
                bones = bone,
                groups = Config.AllowedJobs or nil,
                onSelect = onRemoveWheelClamp,
                canInteract = canRemoveWheelClamp,
            })

            if (Config.Lockpick.Enabled) then
                table.insert(options, {
                    label = Config.Locales['wheel_clamp_lockpick'],
                    icon = 'fa-solid fa-unlock-keyhole',
                    distance = Config.InteractionRange or 1.5,
                    bones = bone,
                    items = Config.Lockpick.Item or nil,
                    onSelect = onLockpickWheelClamp,
                    canInteract = canLockpickWheelClamp
                })
            end
        elseif GetResourceState('qb-target') == 'started' then
            exports['qb-target']:AddTargetBone(bone, {
                options = {
                    {
                        label = Config.Locales['wheel_clamp'] .. ': ' .. Config.WheelLabels[iWheel],
                        icon = 'fa-solid fa-crutch',
                        item = Config.RequiredItem.Enabled and Config.RequiredItem.Item or nil,
                        job = Config.AllowedJobs or nil,
                        action = function(entity)
                            local data = {}
                            data.entity = entity
                            data.bones = bone
                            return onAddWheelClamp(data)
                        end,
                        canInteract = function(entity)
                            return canAddWheelClamp(entity, _, _, _, bone)
                        end
                    },
                    {
                        label = Config.Locales['wheel_clamp_remove'],
                        icon = 'fa-solid fa-crutch',
                        job = Config.AllowedJobs or nil,
                        action = function(entity)
                            local data = {}
                            data.entity = entity
                            data.bones = bone
                            return onRemoveWheelClamp(data)
                        end,
                        canInteract = function(entity)
                            return canRemoveWheelClamp(entity, _, _, _, bone)
                        end
                    },
                    {
                        label = Config.Locales['wheel_clamp_lockpick'],
                        icon = 'fa-solid fa-unlock-keyhole',
                        item = Config.Lockpick.Item or nil,
                        action = function(entity)
                            local data = {}
                            data.entity = entity
                            data.bones = bone
                            return onLockpickWheelClamp(data)
                        end,
                        canInteract = function(entity)
                            return canLockpickWheelClamp(entity, _, _, _, bone)
                        end
                    }
                },
                distance = Config.InteractionRange or 1.5,
            })
        end
    end

    if GetResourceState('ox_target') == 'started' then
        exports.ox_target:addGlobalVehicle(options)
    elseif GetResourceState('qb-target') == 'started' then
        -- We already added the qb-targets above, these should work out of the box
    else
        print("gs_wheelclamp: [ERROR] No target resource found, define method to initialize target options in cl_bridge.lua")
    end
end
