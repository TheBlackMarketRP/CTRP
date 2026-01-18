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
	return GetPlayer(source).PlayerData.job
end

GetPlayerFromIdentifier = function(cid)
	return QBCore.Functions.GetPlayerByCitizenId(cid)
end

AddItem = function(source, item, amount)
	local xPlayer = GetPlayer(source)
	xPlayer.Functions.AddItem(item, amount)
end

RemoveItem = function(source, item, amount)
	local xPlayer = GetPlayer(source)
	xPlayer.Functions.RemoveItem(item, amount)
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
	return xPlayer.PlayerData.citizenid
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
	elseif GetResourceState('ox_inventory') == 'started' then
		return exports['ox_inventory']:Items()
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

function GetSocietyMoney(job)
    if Config.SocietyInManagement then
        return exports['qb-management']:GetAccount(job)
    else
        return exports['qb-banking']:GetAccountBalance(job)
    end
end

function AddSocietyMoney(job, money)
    if Config.SocietyInManagement then
        exports['qb-management']:AddMoney(job, money)
    else
        exports['qb-banking']:AddMoney(job, money)
    end
end

function RemoveSocietyMoney(job, money)
    if Config.SocietyInManagement then
        exports['qb-management']:RemoveMoney(job, money)
    else
        exports['qb-banking']:RemoveMoney(job, money)
    end
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

IsVehicleOwner = function(source, plate)
	local identifier = GetIdentifier(source)
    local found = MySQL.Sync.fetchScalar('SELECT 1 FROM '..Config.OwnedVehiclesTable..' WHERE `citizenid` = ? AND `plate` = ?', {identifier, plate})
    return found and found > 0
end

UpdatePlate = function(source, oldPlate, newPlate)
	local identifier = GetIdentifier(source)
	local mods = MySQL.Sync.fetchScalar('SELECT mods FROM '..Config.OwnedVehiclesTable..' WHERE `citizenid` = ? AND `plate` = ?', {identifier, oldPlate})
	if mods and mods[1] then
		mods = json.decode(mods[1].mods)
		mods.plate = newPlate
	end
    MySQL.Async.execute('UPDATE '..Config.OwnedVehiclesTable..' SET plate = ?, mods = ? WHERE `citizenid` = ? AND `plate` = ?', {newPlate, json.encode(mods), identifier, oldPlate})
end

GiveVehicle = function( source, model, plate )
	local license = GetLicense(source)
	local identifier = GetIdentifier(source)

	local garage = GetResourceState('ak47_qb_garage') == 'started' and 'Garage - 14' or 'pillboxgarage'

    MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
        license,
        identifier,
        model,
        GetHashKey(model),
        json.encode({model = GetHashKey(model), plate = plate}),
        plate,
        garage,
        1
    })
end

GetPlate = function(vehicle)
    return (string.gsub(GetVehicleNumberPlateText(vehicle), '^%s*(.-)%s*$', '%1'))
end

Notify = function( source, msg, type )
	TriggerClientEvent('ak47_qb_referralsystem:notify', source, msg, type)
end

GetLicense = function( source )
	return GetPlayerIdentifierByType(source, 'license')
end

GeneratePlate = function()
    local plate = 'REF '..math.random(1000, 9999)
    local send = false
    local result = MySQL.scalar.await('SELECT plate FROM '..Config.OwnedVehiclesTable..' WHERE plate = ?', {plate})
    if result then
        return GeneratePlate()
    else
        return plate:upper()
    end
end