ESX = nil
QBCore = nil

if (GetResourceState('es_extended') == 'started') then
    ESX = exports['es_extended']:getSharedObject()
elseif (GetResourceState('qb-core') == 'started') then
    QBCore = exports['qb-core']:GetCoreObject()
end

Functions = {}

Functions.Notify = function(message)
    if ESX then
        ESX.ShowNotification(message, 'info', 5000)
    elseif QBCore then
        QBCore.Functions.Notify(message, 'primary', 5000)
    else
        SetNotificationTextEntry('STRING')
        AddTextComponentString(message)
        DrawNotification(false, false)
    end
end

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

Functions.CanUseShield = function(shieldType)
    local playerPed = PlayerPedId()

    if IsPedDeadOrDying(playerPed, true) then
        return false
    end

    if IsPedInAnyVehicle(playerPed, false) then
        return false
    end

    return true
end

Functions.CreateShieldTarget = function(shield, canInteract, onSelect)
    if (GetResourceState('ox_target') == 'started') then
        exports.ox_target:addModel(shield.modelHash, {
            icon = 'fa-solid fa-shield',
            label = Config.Locales['pickup_shield'],
            canInteract = canInteract,
            onSelect = onSelect,
            groups = shield.jobs,
            distance = 2.0,
        })
        return
    end

    if (GetResourceState('qb-target') == 'started') then
        exports['qb-target']:AddTargetModel(shield.modelHash, {
            distance = 2.0,
            options = {
                {
                    icon = 'fa-solid fa-shield',
                    label = Config.Locales['pickup_shield'],
                    action = function(entity)
                        return onSelect({ entity = entity })
                    end,
                    canInteract = function(entity)
                        return canInteract(entity)
                    end,
                },
            },
        })
        return
    end
end

Functions.CreateTextUI = function()
    local textParts = {}

    if Config.removeShield.enable then
        table.insert(textParts, Config.removeShield.label)
    end

    if Config.dropShield.enable then
        table.insert(textParts, Config.dropShield.label)
    end

    if Config.placeShield.enable then
        table.insert(textParts, Config.placeShield.label)
    end

    if #textParts > 0 then
        lib.showTextUI(table.concat(textParts, ' - '), { position = 'bottom-center' })
    end
end

Functions.HideTextUI = function()
    lib.hideTextUI()
end
