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
	if account == Config.MarkedbillItem.item then
		if Config.MarkedbillItem.usemetavalue then
			for i, v in pairs(xPlayer.PlayerData.items) do
	            if v.name == Config.MarkedbillItem.item then
	                xPlayer.Functions.RemoveItem(Config.MarkedbillItem.item, 1)
	                if v.info and v.info.worth then
	                    amount = amount + v.info.worth
	                elseif v.metadata and v.metadata.worth then
	                    amount = amount + v.metadata.worth
	                end
	                break
	            end
	        end
	        xPlayer.Functions.AddItem(Config.MarkedbillItem.item, 1, nil, {worth = amount})
	    else
	    	xPlayer.Functions.AddItem(Config.MarkedbillItem.item, amount)
	    end
	else
		xPlayer.Functions.AddMoney(account, amount)
	end
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

CanCarryItem = function(source, item, amount)
	return true
end

IsAdmin = function(source)
	local xPlayer = GetPlayer(source)
	if (Config.AdminWithAce and IsPlayerAceAllowed(source, 'command')) then
		print("^3["..source.."] ^2Permission Granted With Ace^0")
		return true
	elseif  Config.AdminWithLicense[GetIdentifierByType(source, 'license')] then
		print("^3["..source.."] ^2Permission Granted With License^0")
		return true
	elseif Config.AdminWithIdentifier[GetIdentifier(source)] then 
		print("^3["..source.."] ^2Permission Granted With Identifier^0")
		return true
	end
	return false
end

IsVehicleOwner = function(source, plate)
	local identifier = GetIdentifier(source)
    local found = MySQL.Sync.fetchScalar('SELECT 1 FROM '..Config.OwnedVehiclesTable..' WHERE `citizenid` = ? AND `plate` = ?', {identifier, plate})
    return found and found > 0
end

GetCoin = function(identifier)
	local result = MySQL.Sync.fetchAll('SELECT * FROM '..Config.SpecialCoin.tablename..' WHERE `'..Config.SpecialCoin.identifiercolumname..'` = ?', {identifier})
	return result and result[1][Config.SpecialCoin.coincolumname] or 0
end

AddCoin = function(identifier, amount)
	MySQL.Async.execute('UPDATE '..Config.SpecialCoin.tablename..' SET '..Config.SpecialCoin.coincolumname..' = '..Config.SpecialCoin.coincolumname..' + ? WHERE `'..Config.SpecialCoin.identifiercolumname..'` = ?', {amount, identifier})
end

RemoveCoin = function(identifier, amount)
	MySQL.Async.execute('UPDATE '..Config.SpecialCoin.tablename..' SET '..Config.SpecialCoin.coincolumname..' = '..Config.SpecialCoin.coincolumname..' - ? WHERE `'..Config.SpecialCoin.identifiercolumname..'` = ?', {amount, identifier})
end

CreateUseableItem = QBCore.Functions.CreateUseableItem

RegisterUsable = function(item)
	CreateUseableItem(item, function(source)
		if Usables[item].required and next(Usables[item].required) then
			for i, v in pairs(Usables[item].required) do
				if not HasEnoughItem(source, v.name, v.amount) then
					Notify(source, _U('youneed', v.amount, v.label), 'error')
					return false
				end
			end
			for i, v in pairs(Usables[item].required) do
				if v.removechance == 100 or (v.removechance > 0 and math.random(1, 99) <= v.removechance) then
					RemoveItem(source, v.name, v.amount)
				end
			end
		end
		TriggerClientEvent('ak47_qb_drugmanagerv2:onuse', source, item)
	end)
end

RegisterCraftUsable = function(item)
	CreateUseableItem(item, function(source)
		if HandCraft[item].required and next(HandCraft[item].required) then
			for i, v in pairs(HandCraft[item].required) do
				if not HasEnoughItem(source, v.name, v.amount) then
					Notify(source, _U('youneed', v.amount, v.label), 'error')
					return false
				end
			end
		end
		TriggerClientEvent('ak47_qb_drugmanagerv2:handcraft', source, item)
	end)
end

Notify = function(source, msg, type)
	TriggerClientEvent('ak47_qb_drugmanagerv2:notify', source, msg, type)
end

GetActiveCops = function()
	local xPlayers = GetPlayers()
	local count = 0
	for i, v in pairs(xPlayers) do
		local job = GetJob(v)
		if job and Config.Cops[job.name] and job.onduty then
			count += 1
		end
	end
	return count
end

for i, v in pairs(Config.AntiAddiction) do
	CreateUseableItem(i, function(source)
	    RemoveItem(source, i, 1)
	    TriggerClientEvent('ak47_qb_drugmanagerv2:onmed', source, v) -- will reduce addiction 10 from each drug
		Notify(source, _U('used_recovery', GetItemLabel(i)), 'success')
	end)
end

CreateUseableItem('antidote', function(source)
	local source = source
	if HasEnoughItem(source, 'syriange', 1) then
	    RemoveItem(source, 'antidote', 1)
	    RemoveItem(source, 'syriange', 1)
	    TriggerClientEvent('ak47_qb_drugmanagerv2:antidote', source)
		Notify(source, _U('used_antidote'), 'success')
	else
		Notify(source, _U('notenough', GetItemLabel('syriange')), 'error')
	end
end)

CreateUseableItem(Config.TestKit, function(source)
	local source = source
	TriggerClientEvent('ak47_qb_drugmanagerv2:drugtestkit', source)
end)

lib.callback.register('ak47_qb_drugmanagerv2:getakganglist', function()
	local tablename = GetResourceState('ak47_qb_gangs') == 'started' and 'ak47_qb_gangs' or 'ak47_qb_territory_gangs'
	return MySQL.Sync.fetchAll("SELECT tag, label, ranks FROM "..tablename)
end)