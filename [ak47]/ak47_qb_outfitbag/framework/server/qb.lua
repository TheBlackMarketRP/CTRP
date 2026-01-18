QBCore = exports['qb-core']:GetCoreObject()

GetPlayer = function(source)
	return QBCore.Functions.GetPlayer(source)
end

GetIdentifier = function(source)
	local xPlayer = GetPlayer(source)
	return xPlayer.PlayerData.citizenid
end

CreateUsable = QBCore.Functions.CreateUseableItem