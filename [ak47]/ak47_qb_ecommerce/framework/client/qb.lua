QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('ak47_qb_ecommerce:notify', function(msg, type)
    Notify(msg, type)
end)

IsDead = function()
    return QBCore.Functions.GetPlayerData().metadata['isdead']
end