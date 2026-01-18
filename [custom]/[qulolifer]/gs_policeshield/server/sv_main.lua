local pickupTime = {}
local os_time = os.time

lib.callback.register('gs_policeshield:CanUseShield', function(source, shieldType)
    return Functions.CanUseShield(source, shieldType)
end)

lib.callback.register('gs_policeshield:HasShieldItem', function(source, shieldType)
    local itemName = Config.shields[shieldType].itemName
    return Functions.HasItem(source, itemName)
end)

RegisterNetEvent('gs_policeshield:ShieldDropped', function(netId, shieldType)
    local entity = NetworkGetEntityFromNetworkId(netId)
    if not DoesEntityExist(entity) then return end

    if not IsEntityAShieldModel(entity) then return end

    Entity(entity).state.policeShield = shieldType
end)

RegisterNetEvent('gs_policeshield:PickupShield', function(netId, shieldType)
    local src = source

    local entity = NetworkGetEntityFromNetworkId(netId)
    if not DoesEntityExist(entity) then return end

    local playerPed = GetPlayerPed(src)
    local playerCoords = GetEntityCoords(playerPed)

    local entityCoords = GetEntityCoords(entity)
    local distance = #(playerCoords - entityCoords)
    if distance > 5 then return end

    if not IsEntityAShieldModel(entity) then return end

    local osTime = os_time()

    -- Check if the shield was just picked up (anti-cheat measure)
    if pickupTime[netId] and ((osTime - pickupTime[netId]) < 10) then
        return
    end

    pickupTime[netId] = osTime
    DeleteEntity(entity)

    TriggerClientEvent('gs_policeshield:ActivateShield', src, shieldType)
end)

RegisterNetEvent('gs_policeshield:OnShieldEquip', function(shieldType)
    local src = source

    if not Functions.CanUseShield(src, shieldType) then return end

    Functions.OnShieldUse(src, shieldType)
end)

RegisterNetEvent('gs_policeshield:OnShieldUnequip', function(shieldType)
    local src = source

    if not Functions.CanUseShield(src, shieldType) then return end

    Functions.OnShieldRemove(src, shieldType)
end)

function IsEntityAShieldModel(entity)
    local entityModel = GetEntityModel(entity)

    for _, shield in pairs(Config.shields) do
        if shield.modelHash == entityModel then
            return true
        end
    end

    return false
end

if Config.enableItems then
    CreateThread(function()
        for shieldType, shield in pairs(Config.shields) do
            Functions.RegisterItem(shield.itemName, function(playerId)
                TriggerClientEvent('gs_policeshield:ToggleShield', playerId, shieldType)
            end)
        end
    end)
end
