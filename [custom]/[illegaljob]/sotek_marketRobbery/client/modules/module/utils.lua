Modules.Utils = {}
Modules.Utils.cachedData = {}
Modules.Utils.TimeFrame = 0

function Modules.Utils.Teleport(entity, coords)
	if DoesEntityExist(entity) then
		RequestCollisionAtCoord(coords.x, coords.y, coords.z)
		local timeout = 0

		-- we can get stuck here if any of the axies are "invalid"
		while not HasCollisionLoadedAroundEntity(entity) and timeout < 2000 do
			print("Collision not loaded yet, waiting...", timeout)
			timeout = timeout + 1
			Wait(0)
		end

		SetEntityCoords(entity, coords.x, coords.y, coords.z, false, false, false, false)

		if type(coords) == 'table' and coords.heading then
			SetEntityHeading(entity, coords.heading)
		end
	end
end

function Modules.Utils.ShowNotification(message)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(message)
	DrawNotification(0, 1)
end

function Modules.Utils.ShowAdvancedNotification(title, subtitle, msg, img1, img2)
	AddTextEntry('module:AdvancedNotif', msg)
	BeginTextCommandThefeedPost('module:AdvancedNotif')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandThefeedPostMessagetext(img1, img2, 1, 0, title, subtitle)
	EndTextCommandThefeedPostTicker(false, true)
end

function Modules.Utils.InputString(text, number, windows)
	AddTextEntry("FMMC_MPM_NA", text)
	DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", windows or "", "", "", "", number or 30)
	while UpdateOnscreenKeyboard() == 0 do
		DisableAllControlActions(0)
		Wait(0)
	end

	if (GetOnscreenKeyboardResult()) then
		local result = GetOnscreenKeyboardResult()
		return result
	end
end

function Modules.Utils.ShowHelpNotification(msg, beep)
	local beep = beep
	if beep == nil then
		beep = false
	end
	AddTextEntry('core:HelpNotif', msg)
	BeginTextCommandDisplayHelp('core:HelpNotif')
	EndTextCommandDisplayHelp(0, false, false, 1)
end

local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end
		enum.destructor = nil
		enum.handle = nil
	end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = { handle = iter, destructor = disposeFunc }
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
			coroutine.yield(id)
			next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function Modules.Utils.EnumerateObjects()
	return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function Modules.Utils.EnumeratePeds()
	return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function Modules.Utils.EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function Modules.Utils.EnumeratePickups()
	return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

function Modules.Utils.LoadAnimDict(animDict)
	RequestAnimDict(animDict)
	if DoesAnimDictExist(animDict) then
		while not HasAnimDictLoaded(animDict) do
			Wait(1)
		end
		-- Citizen.CreateThread(function() -- For now we let the dict loaded
		--     Wait(1000)
		--     RemoveAnimDict(animDict)
		-- end)
	else
		print("^1Trying to load anim dict that do not exist ", animDict)
	end
end

function Modules.Utils.StartMusicEvent(event)
	PrepareMusicEvent(event)
	return TriggerMusicEvent(event) == 1
end

function Modules.Utils.LoadIsland(isIsland)
	SetZoneEnabled(GetZoneFromNameId("PrLog"), not isIsland) --removes perico snow
	Citizen.InvokeNative(0x9A9D1BA639675CF1, 'HeistIsland', isIsland) -- or use false to disable it
	-- instead of using island hopper you can *also* just load the IPLs mentioned in islandhopper.meta yourself somewhat

	-- switch radar interior
	Citizen.InvokeNative(0x5E1460624D194A38, isIsland)

	-- misc natives
	Citizen.InvokeNative(0xF74B1FFA4A15FBEA, isIsland)
	Citizen.InvokeNative(0x53797676AD34A9AA, false)
	SetScenarioGroupEnabled('Heist_Island_Peds', isIsland)

	-- audio stuff
	SetAudioFlag('PlayerOnDLCHeist4Island', isIsland)
	SetAmbientZoneListStatePersistent('AZL_DLC_Hei4_Island_Zones', isIsland, isIsland)
	SetAmbientZoneListStatePersistent('AZL_DLC_Hei4_Island_Disabled_Zones', isIsland, isIsland)
end

function Modules.Utils.RealWait(ms, cb)
	local timer = GetGameTimer() + ms
	while GetGameTimer() < timer do
		if cb ~= nil then
			cb(function(stop)
				if stop then
					timer = 0
					return
				end
			end)
		end
		Wait(0)
	end
end

function Modules.Utils.GetRankIcon(level)
	local level = (level)
	if level < 10 then
		level = "00" .. tostring(level)
	elseif level < 100 then
		level = "0" .. tostring(level)
	end

	return "Rank" .. level
end

function Modules.Utils.GetVehicles(level)
	local vehicles = {}

	for vehicle in Modules.Utils.EnumerateVehicles() do
		table.insert(vehicles, vehicle)
	end

	return vehicles
end

function Modules.Utils.GetObject()
	local vehicles = {}

	for vehicle in Modules.Utils.EnumerateObjects() do
		table.insert(vehicles, vehicle)
	end

	return vehicles
end


function Modules.Utils.Round(value, numDecimalPlaces)
	if numDecimalPlaces then
		local power = 10 ^ numDecimalPlaces
		return math.floor((value * power) + 0.5) / (power)
	else
		return math.floor(value + 0.5)
	end
end




