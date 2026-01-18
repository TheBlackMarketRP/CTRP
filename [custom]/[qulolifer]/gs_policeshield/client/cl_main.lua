local shieldEntity = 0
local activeShieldType = nil
local curAnim = nil

if Config.enableCommand then
    RegisterCommand(Config.commandName, function(source, args, raw)
        local shieldType = args[1] or 'ballistic'
        ToggleShield(shieldType)
    end, false)
end

RegisterNetEvent('gs_policeshield:ToggleShield', function(shieldType)
    ToggleShield(shieldType)
end)

RegisterNetEvent('gs_policeshield:ActivateShield', function(shieldType)
    ActivateShield(shieldType)
end)

function ToggleShield(shieldType)
    if not Config.shields[shieldType] then
        return Functions.Notify(Config.Locales['invalid_shield'])
    end

    if activeShieldType and (activeShieldType ~= shieldType) then
        return Functions.Notify(Config.Locales['unequip_shield'])
    end

    if (shieldEntity ~= 0) then
        UnequipShield(shieldType)
        return
    end

    if not Functions.CanUseShield(shieldType) then
        return Functions.Notify(Config.Locales['cant_use_shield'])
    end

    if Config.enableItems then
        local hasShieldItem = lib.callback.await('gs_policeshield:HasShieldItem', false, shieldType)
        if not hasShieldItem then
            return Functions.Notify(Config.Locales['no_shield_item'])
        end
    end

    local canUse = lib.callback.await('gs_policeshield:CanUseShield', false, shieldType)
    if not canUse then
        return Functions.Notify(Config.Locales['not_allowed'])
    end

    if HasDisallowedWeapon(shieldType) then
        return Functions.Notify(Config.Locales['disallowed_weapon'])
    end

    EquipShield(shieldType)
end

function EquipShield(shieldType)
    TriggerServerEvent('gs_policeshield:OnShieldEquip', shieldType)
    ActivateShield(shieldType)
end

function UnequipShield(shieldType)
    TriggerServerEvent('gs_policeshield:OnShieldUnequip', shieldType)
    StopShield()
end

function ActivateShield(shieldType)
    local shield = Config.shields[shieldType]
    if not shield then return end

    activeShieldType = shieldType

    local modelHash = shield.modelHash

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    curAnim = Animation(shield.attach.anim.dict, shield.attach.anim.name, 50).play().forceAnim()

    lib.requestModel(modelHash)
    shieldEntity = CreateObject(modelHash, playerCoords.x, playerCoords.y, playerCoords.z, true, false, true)

    -- Attach the shield to the player
    local boneId = shield.attach.boneId
    local boneIndex = GetPedBoneIndex(playerPed, boneId)

    local offX, offY, offZ = table.unpack(shield.attach.pos)
    local rotX, rotY, rotZ = table.unpack(shield.attach.rot)

    AttachEntityToEntity(
        shieldEntity,
        playerPed,
        boneIndex,
        offX, offY, offZ,
        rotX, rotY, rotZ,
        false,
        true,
        false,
        true,
        1,
        true
    )

    SetWeaponAnimationOverride(playerPed, `Gang1H`)

    if Config.disableLadderClimb then
        SetPedConfigFlag(playerPed, 146, true) -- Disable ladder climbing
    end

    Functions.CreateTextUI()

    LocalPlayer.state:set('hasShield', true, true)
end

function StopShield()
    if (shieldEntity ~= 0) then
        DeleteEntity(shieldEntity)
        shieldEntity = 0
    end

    TriggerServerEvent('gs_policeshield:ShieldRemove', activeShieldType)

    activeShieldType = nil

    if curAnim then
        curAnim.stop()
        curAnim = nil
    end

    local ped = PlayerPedId()
    SetWeaponAnimationOverride(ped, `Default`)

    if Config.disableLadderClimb then
        SetPedConfigFlag(ped, 146, false) -- Re-enable ladder climbing
    end

    Functions.HideTextUI()

    LocalPlayer.state:set('hasShield', false, true)
end

function DropShield()
    -- Get some variables before we delete the shield
    local shieldType = activeShieldType
    local shieldCoords = GetEntityCoords(shieldEntity)
    local shieldHeading = GetEntityHeading(shieldEntity)

    StopShield()

    -- Create new shield prop and don't attach it to the player
    local modelHash = Config.shields[shieldType].modelHash
    lib.requestModel(modelHash)
    local droppedShieldEntity = CreateObjectNoOffset(modelHash, shieldCoords.x, shieldCoords.y, shieldCoords.z, true, false, true)
    SetEntityHeading(droppedShieldEntity, shieldHeading)
    ActivatePhysics(droppedShieldEntity)

    repeat Wait(50) until NetworkGetEntityIsNetworked(droppedShieldEntity)
    local netId = NetworkGetNetworkIdFromEntity(droppedShieldEntity)
    Wait(50)
    TriggerServerEvent('gs_policeshield:ShieldDropped', netId, shieldType)
end

function PlaceShield()
    if curAnim then
        curAnim.stop()
        curAnim = nil
    end

    -- Play emote to place on ground
    curAnim = Animation(Config.placeAnim.dict, Config.placeAnim.name, Config.placeAnim.flags).play()
    Wait(Config.placeAnim.duration)
    curAnim.stop()
    curAnim = nil

    local shieldType = activeShieldType

    StopShield()

    -- Create new shield prop and don't attach it to the player
    local modelHash = Config.shields[shieldType].modelHash
    lib.requestModel(modelHash)

    local ped = PlayerPedId()
    local pedHeading = GetEntityHeading(ped)
    local placeCoords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.5, 0.0)
    local placeShieldEntity = CreateObject(modelHash, placeCoords.x, placeCoords.y, placeCoords.z, true, false, true)
    SetEntityHeading(placeShieldEntity, pedHeading + 180.0)
    PlaceObjectOnGroundProperly(placeShieldEntity)
    FreezeEntityPosition(placeShieldEntity, true)

    repeat Wait(50) until NetworkGetEntityIsNetworked(placeShieldEntity)
    local netId = NetworkGetNetworkIdFromEntity(placeShieldEntity)
    Wait(50)
    TriggerServerEvent('gs_policeshield:ShieldDropped', netId, shieldType)
end

function PickupShield(entity)
    local state = Entity(entity).state
    local shieldType = state.policeShield
    if not shieldType then return end

    local netId = NetworkGetNetworkIdFromEntity(entity)
    TriggerServerEvent('gs_policeshield:PickupShield', netId, shieldType)
end

CreateThread(function()
    while true do
        Wait(500)

        -- If player is carrying a shield, stop the shield
        if shieldEntity ~= 0 then
            local ped = PlayerPedId()

            if GetWeaponAnimationOverride(ped) ~= `Gang1H` then
                SetWeaponAnimationOverride(ped, `Gang1H`)
            end

            if HasDisallowedWeapon(activeShieldType) or IsPedDeadOrDying(ped, true) or not Functions.CanUseShield(activeShieldType) then
                UnequipShield(activeShieldType)
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1000)

        local localPlayerId = PlayerId()
        local players = GetActivePlayers()
        for i = 1, #players do
            local playerId = players[i]

            if (playerId ~= localPlayerId) then
                local serverId = GetPlayerServerId(playerId)

                local ped = GetPlayerPed(playerId)
                local state = Player(serverId).state

                local animOverride = GetWeaponAnimationOverride(ped)
                if (animOverride ~= `Gang1H`) and state.hasShield then
                    SetWeaponAnimationOverride(ped, `Gang1H`)
                elseif (animOverride == `Gang1H`) and not state.hasShield then
                    SetWeaponAnimationOverride(ped, `Default`)
                end
            end
        end
    end
end)

CreateThread(function()
    while true do
        local ms = 500

        if (shieldEntity ~= 0) then
            ms = 0

            for i = 1, #Config.disabledControls do
                DisableControlAction(0, Config.disabledControls[i], true)
            end

            if Config.removeShield.enable then
                if IsControlJustPressed(0, Config.removeShield.key) then
                    UnequipShield(activeShieldType)
                end
            end

            if Config.dropShield.enable then
                if IsControlJustPressed(0, Config.dropShield.key) then
                    DropShield()
                end
            end

            if Config.placeShield.enable then
                if IsControlJustPressed(0, Config.placeShield.key) then
                    PlaceShield()
                end
            end
        end

        Wait(ms)
    end
end)

CreateThread(function()
    for shieldType, shield in pairs(Config.shields) do
        function canInteract(entity, distance, coords, name)
            if shieldEntity ~= 0 then
                return false
            end

            local state = Entity(entity).state
            if not state.policeShield or (state.policeShield ~= shieldType) then
                return false
            end

            return Functions.CanInteract()
        end

        function onSelect(data)
            PickupShield(data.entity)
        end

        Functions.CreateShieldTarget(shield, canInteract, onSelect)
    end
end)

-- On resource stop
AddEventHandler('onResourceStop', function(resource)
    if (resource ~= GetCurrentResourceName()) then
        return
    end

    if (shieldEntity ~= 0) then
        StopShield()

        local ped = PlayerPedId()
        ClearPedTasks(ped)
    end
end)

-- Exports
exports('ActivateShield', ActivateShield)
exports('StopShield', StopShield)
exports('DropShield', DropShield)
exports('PlaceShield', PlaceShield)
exports('PickupShield', PickupShield)
