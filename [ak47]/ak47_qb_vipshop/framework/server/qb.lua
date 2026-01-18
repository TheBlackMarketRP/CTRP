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

AddItem = function(source, item, amount, meta)
	local xPlayer = GetPlayer(source)
	if not meta then
		return xPlayer.Functions.AddItem(item, amount, meta)
	else
		if GetResourceState('ak47_qb_inventory') == 'started' then
			return exports['ak47_qb_inventory']:AddItem(source, item, amount, nil, meta)
		elseif GetResourceState('ox_inventory') == 'started' then
			return exports['ox_inventory']:AddItem(source, item, amount, meta)
		elseif GetResourceState('qs-inventory') == 'started' then
			return exports['qs-inventory']:AddItem(source, item, amount, nil, meta)
		elseif GetResourceState('ps-inventory') == 'started' then
			return exports['ps-inventory']:AddItem(source, item, amount, nil, meta)
		elseif GetResourceState('lj-inventory') == 'started' then
			return exports['lj-inventory']:AddItem(source, item, amount, nil, meta)
		elseif GetResourceState('qb-inventory') == 'started' then
			return exports['qb-inventory']:AddItem(source, item, amount, nil, meta)
		elseif GetResourceState('codem-inventory') == 'started' then
			return exports['codem-inventory']:AddItem(source, item, amount, nil, meta)
		elseif GetResourceState('tgiann-inventory') == 'started' then
			return exports['tgiann-inventory']:AddItem(source, item, amount, nil, meta)
		elseif GetResourceState('origen_inventory') == 'started' then
			return exports['origen_inventory']:AddItem(source, item, amount, nil, meta)
		else
			return xPlayer.Functions.AddItem(item, amount, meta)
		end
	end
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

-- GetCoin = function(identifier)
-- 	local result = MySQL.Sync.fetchAll('SELECT * FROM '..Config.SpecialCoin.tablename..' WHERE `'..Config.SpecialCoin.identifiercolumname..'` = ?', {identifier})
-- 	return result and result[1] and result[1][Config.SpecialCoin.coincolumname] or 0
-- end

-- AddCoin = function(identifier, amount)
-- 	MySQL.Sync.execute('UPDATE '..Config.SpecialCoin.tablename..' SET '..Config.SpecialCoin.coincolumname..' = '..Config.SpecialCoin.coincolumname..' + ? WHERE `'..Config.SpecialCoin.identifiercolumname..'` = ?', {amount, identifier})
-- 	TriggerClientEvent('ak47_qb_vipshop:client:setcoin', GetSource(GetPlayerFromIdentifier(identifier)), GetCoin(identifier))
-- end

-- RemoveCoin = function(identifier, amount)
-- 	MySQL.Sync.execute('UPDATE '..Config.SpecialCoin.tablename..' SET '..Config.SpecialCoin.coincolumname..' = '..Config.SpecialCoin.coincolumname..' - ? WHERE `'..Config.SpecialCoin.identifiercolumname..'` = ?', {amount, identifier})
-- 	TriggerClientEvent('ak47_qb_vipshop:client:setcoin', GetSource(GetPlayerFromIdentifier(identifier)), GetCoin(identifier))
-- end

GetCoin = function(identifier)
	local result = MySQL.Sync.fetchAll('SELECT * FROM '..Config.SpecialCoin.tablename..' WHERE `'..Config.SpecialCoin.identifiercolumname..'` = ?', {identifier})
	return result and result[1] and result[1][Config.SpecialCoin.coincolumname] or 0
end

QBCore.Functions.CreateCallback("kael-vcoin:server:getcoin", function(source, cb)
	local Player = QBCore.Functions.GetPlayer(source)
	local License = Player.PlayerData.citizenid
	cb(GetCoin(License))
end)

AddCoin = function(identifier, amount)
	MySQL.Sync.execute('UPDATE '..Config.SpecialCoin.tablename..' SET '..Config.SpecialCoin.coincolumname..' = '..Config.SpecialCoin.coincolumname..' + ? WHERE `'..Config.SpecialCoin.identifiercolumname..'` = ?', {amount, identifier})
	TriggerClientEvent('ak47_qb_vipshop:client:setcoin', GetSource(GetPlayerFromIdentifier(identifier)), GetCoin(identifier))
	TriggerClientEvent("kael-vcoin:client:vcoinchanges", GetSource(GetPlayerFromIdentifier(identifier)))
end

addPlayerCoin = function(src, amount)
	local Player = QBCore.Functions.GetPlayer(src)
	local License = Player.PlayerData.citizenid
	AddCoin(License, amount)
end
exports("addPlayerCoin", addPlayerCoin)

RemoveCoin = function(identifier, amount)
	MySQL.Sync.execute('UPDATE '..Config.SpecialCoin.tablename..' SET '..Config.SpecialCoin.coincolumname..' = '..Config.SpecialCoin.coincolumname..' - ? WHERE `'..Config.SpecialCoin.identifiercolumname..'` = ?', {amount, identifier})
	TriggerClientEvent('ak47_qb_vipshop:client:setcoin', GetSource(GetPlayerFromIdentifier(identifier)), GetCoin(identifier))
	TriggerClientEvent("kael-vcoin:client:vcoinchanges", GetSource(GetPlayerFromIdentifier(identifier)))
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

GetPlate = function(vehicle)
    return (string.gsub(GetVehicleNumberPlateText(vehicle), '^%s*(.-)%s*$', '%1'))
end

Notify = function( source, msg, type )
	TriggerClientEvent('ak47_qb_vipshop:client:notify', source, msg, type)
end

GetLicense = function( source )
	return GetPlayerIdentifierByType(source, 'license')
end

GiveVehicle = function( source, model )
	local license = GetLicense(source)
	local identifier = GetIdentifier(source)
	local plate = GeneratePlate()

	local garage = GetResourceState('ak47_qb_garage') == 'started' and 'Garage - 14' or 'pillboxgarage'

    MySQL.insert('INSERT INTO '..Config.OwnedVehiclesTable..' (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
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

GeneratePlate = function()
    local plate = 'VIP '..math.random(1000, 9999)
    local send = false
    local result = MySQL.scalar.await('SELECT plate FROM '..Config.OwnedVehiclesTable..' WHERE plate = ?', { plate })
    if result then
        return GeneratePlate()
    else
        return plate:upper()
    end
end

local Vehicles = {}
CreateThread(function()
	local vehicles = QBCore.Shared.Vehicles
    for i, v in pairs(vehicles) do
        v.model = i
        v.value = i
        v.label = v.name
        table.insert(Vehicles, v)
    end
end)

GetVehicles = function()
	return Vehicles
end