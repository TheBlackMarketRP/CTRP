Citizen.CreateThread(function()
    while GetConvar('onesync', 'off') ~= 'on' do
        print('^1Enable OneSync Infinity from your txAdmin setting!^0')
        Wait(1000)
    end
end)

QBCore = exports['qb-core']:GetCoreObject()

function GetItemLabel(item)
    if QBCore.Shared and QBCore.Shared.Items and QBCore.Shared.Items[item] then
	   return QBCore.Shared.Items[item].label
    else
        print('^1Item: ^3['..item..']^1 missing in qb-core/shared/items.lua^0')
        return item
    end
end