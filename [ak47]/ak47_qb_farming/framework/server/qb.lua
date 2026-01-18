QBCore = exports['qb-core']:GetCoreObject()

GetSource = function(xPlayer)
	return xPlayer.PlayerData.source
end

GetPlayer = function(source)
	return QBCore.Functions.GetPlayer(source)
end

GetSourceFromIdentifier = function(identifier)
	return GetPlayerFromIdentifier(identifier).PlayerData.source
end

GetPlayers = function()
	return QBCore.Functions.GetPlayers()
end

GetJob = function(source)
	local Player = GetPlayer(source)
	return Player and Player.PlayerData.job
end

GetPlayerFromIdentifier = function(cid)
	return QBCore.Functions.GetPlayerByCitizenId(cid)
end

AddItem = function(source, item, amount, meta)
	local xPlayer = GetPlayer(source)
	return xPlayer.Functions.AddItem(item, amount, meta)
end

RemoveItem = function(source, item, amount)
	local xPlayer = GetPlayer(source)
	return xPlayer.Functions.RemoveItem(item, amount)
end

GetMoney = function(source, account)
	local xPlayer = GetPlayer(source)
	return xPlayer.PlayerData.money[account]
end

AddMoney = function(source, account, amount)
	local xPlayer = GetPlayer(source)
	xPlayer.Functions.AddMoney(account, amount)
end

RemoveMoney = function(source, account, amount)
	local xPlayer = GetPlayer(source)
	xPlayer.Functions.RemoveMoney(account, amount)
end

GetIdentifier = function(source)
	local xPlayer = GetPlayer(source)
	return xPlayer and xPlayer.PlayerData.citizenid
end

GetInventory = function(source)
	local xPlayer = GetPlayer(source)
	return xPlayer.PlayerData.items
end

GetInventoryItem = function(source, item)
	local xPlayer = GetPlayer(source)
	local inv = xPlayer.Functions.GetItemByName(item)
	return inv and (inv.amount or inv.count) or 0
end

HasEnoughItem = function(source, item, amount)
	local xPlayer = GetPlayer(source)
	local inv = xPlayer.Functions.GetItemByName(item)
	return inv and ((inv.amount and inv.amount >= amount) or (inv.count and inv.count >= amount)) or false
end

GetItemAmount = function(source, item)
	local xPlayer = GetPlayer(source)
	local inv = xPlayer.Functions.GetItemByName(item)
	return inv and (inv.amount or inv.count) or 0
end

GetItems = function()
	if GetResourceState('qs-inventory') == 'started' then
		return exports['qs-inventory']:GetItemList()
	else
		return QBCore.Shared.Items
	end
end

GetItemLabel = function(item)
    if QBCore.Shared and QBCore.Shared.Items and QBCore.Shared.Items[item] then
	   return QBCore.Shared.Items[item].label
    else
        print('^1Item: ^3['..item..']^1 missing in qb-core/shared/items.lua^0')
        return item
    end
end

AddSocietyMoney = function(job, money)
	Citizen.CreateThread(function()
		exports['qb-banking']:AddMoney(job, money)
	end)
end

GetIdentifierByType = function(playerId, idtype)
    local src = source
    for _, identifier in pairs(GetPlayerIdentifiers(playerId)) do
        if string.find(identifier, idtype) then
            return identifier
        end
    end
    return nil
end

GetName = function(source)
	local xPlayer = GetPlayer(source)
    return xPlayer.PlayerData.charinfo.firstname..' '..xPlayer.PlayerData.charinfo.lastname
end

GetPhoneNumber = function(source)
	local xPlayer = GetPlayer(source)
    return xPlayer.PlayerData.charinfo.phone
end

CanCarryItem = function(source, item, amount)
	return true
end

IsAdmin = function(source)
	local xPlayer = GetPlayer(source)
	if (Config.AdminWithAce and IsPlayerAceAllowed(source, 'command')) then
		return true
	elseif  Config.AdminWithLicense[GetIdentifierByType(source, 'license')] then
		return true
	elseif Config.AdminWithIdentifier[GetIdentifier(source)] then
		return true
	end
	return false
end

Notify = function(source, msg, type)
	TriggerClientEvent('ak47_qb_farming:notify', source, msg, type)
end

for i, v in pairs(Config.FarmingZones) do
	QBCore.Functions.CreateUseableItem(i, function(source)
		TriggerClientEvent('ak47_qb_farming:onusefarmingitem', source, i)
	end)
end