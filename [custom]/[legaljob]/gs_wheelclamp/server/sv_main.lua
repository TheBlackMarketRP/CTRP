AddEventHandler('entityRemoved', function(entity)
	-- Check if entity is a vehicle
	if GetEntityType(entity) ~= 2 then return end

	local clampNetId = Entity(entity).state.wheelClampNetId
	if clampNetId == nil then return end

	local clampObject = NetworkGetEntityFromNetworkId(clampNetId)
	if not DoesEntityExist(clampObject) then return end

	DeleteEntity(clampObject)
end)

RegisterNetEvent('gs_wheelclamp:createClampObject', function(vehicleNetId, boneName, wheelIndex)
	local src = source
	local vehicle = NetworkGetEntityFromNetworkId(vehicleNetId)
	if not DoesEntityExist(vehicle) then return end

	-- If for some reason a clamp is already active, we stop
	local currentWheelClampNetId = Entity(vehicle).state.wheelClampNetId
	if (currentWheelClampNetId ~= nil) then
		return
	end

	local itemRemoved = Functions.RemoveItem(src, Config.RequiredItem.Item)
	if not (itemRemoved) then
		return
	end

	local vehicleCoords = GetEntityCoords(vehicle)
	local object = CreateObject(Config.PropHash, vehicleCoords.x ,vehicleCoords.y, vehicleCoords.z - 5.0, true, true, true)
	while not DoesEntityExist(object) do
		Wait(0)
	end

	local objectNetId = NetworkGetNetworkIdFromEntity(object)
	Entity(vehicle).state.wheelClampNetId = objectNetId
	Entity(vehicle).state.wheelClampIndex = wheelIndex
	TriggerClientEvent('gs_wheelclamp:attachClamp', NetworkGetEntityOwner(vehicle), vehicleNetId, objectNetId, boneName, wheelIndex)
end)

RegisterNetEvent('gs_wheelclamp:removeClamp', function(vehicleNetId, giveBackItem)
	local src = source
	local vehicle = NetworkGetEntityFromNetworkId(vehicleNetId)
	if not DoesEntityExist(vehicle) then return end

	local objectNetId = Entity(vehicle).state.wheelClampNetId
	if (objectNetId == nil) then return end
	local object = NetworkGetEntityFromNetworkId(objectNetId)
	if DoesEntityExist(object) then DeleteEntity(object) end

	Entity(vehicle).state.wheelClampNetId = nil
	Entity(vehicle).state.wheelClampIndex = nil

	-- Give back wheelclamp item if player has correct job
	if Functions.CanUseClamp(src) and giveBackItem then
		Functions.AddItem(src, Config.RequiredItem.Item)
	end
end)

RegisterNetEvent('gs_wheelclamp:removeItem', function(item)
	local src = source
	Functions.RemoveItem(src, item)
end)
