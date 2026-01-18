local isSpeedSet = false
local maxSpeedReached = false  -- Variable to track if the max speed was reached

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		
		while not IsPedInAnyVehicle(PlayerPedId(), false) do
			Citizen.Wait(2500)
		end

		local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local currentSpeed = GetEntitySpeed(vehicle)

		if (currentSpeed == 0) then
			Citizen.Wait(2000)
		end

		if vehicle ~= nil then
			isSpeedSet = false
			setSpeed(vehicle)
		end
		
		while isSpeedSet and IsPedInAnyVehicle(PlayerPedId(), false) do
			local currentVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			if currentVeh ~= vehicle then
				setSpeed(currentVeh)
			end

			currentSpeed = GetEntitySpeed(currentVeh)
			local speedLimit = GetVehicleMaxSpeed(currentVeh)

			-- Check if the current speed is near the maximum speed
			if currentSpeed >= (speedLimit - 1.0) and not maxSpeedReached then
				notifyMaxSpeed()
				maxSpeedReached = true
			elseif currentSpeed < (speedLimit - 1.0) then
				maxSpeedReached = false
			end

			Citizen.Wait(2500)
		end
	end
end)

function setSpeed(vehicle)
	local vehicleClass = GetVehicleClass(vehicle)

	if (vehicleClass ~= 16) and (vehicleClass ~= 15) then
		local speed = Config.maxSpeed
		if Config.useCategories then
			for _, category in ipairs(Config.Categories) do
				if category.category == vehicleClass then
					speed = category.maxSpeed
					break
				end
			end
		end
		if Config.kmh then
			speed = speed / Config.kmhValue
		else
			speed = speed / Config.mphValue
		end

		SetVehicleMaxSpeed(vehicle, speed)
		isSpeedSet = true
	end
end

function notifyMaxSpeed()
	-- This function sends a notification to the player based on the framework
	if Config.framework == "esx" then
		exports['ds-speedlimiter']:sendnotify('You have reached the maximum speed! Slow Down.', 2, 5000)
	elseif Config.framework == "qbcore" then
		exports['ds-speedlimiter']:sendnotify('You have reached the maximum speed! Slow Down.', 2, 5000)
	else
		-- Default notification if framework is not specified or not recognized
		SetNotificationTextEntry("STRING")
		AddTextComponentString("You have reached the maximum speed!")
		DrawNotification(false, true)
	end
end
