-- ## GABZ - BOLINGBROKE PENITENTIARY
-- ## COORDINATES: 1855.556 2586.384 45.673


-- ## RECEPTION - COORDINATES: 1855.556 2586.384 45.673
-- entrance (big gates)
table.insert(Config.DoorList, {
	objHash = 741314661, -- prop_gate_prison_01
	objCoords = vector3(1844.9, 2604.8, 44.6),
	textCoords = vector3(1845.28, 2608.5, 48.0),
	authorizedJobs = { ['police'] = 0 },
	locked = true,
	maxDistance = 12,
	fixText = true,
	size = 2,
	slides = true,
	lockpick = true,
})

table.insert(Config.DoorList, {
	objHash = 741314661, -- prop_gate_prison_01
	objCoords = vector3(1818.5, 2604.8, 44.6),
	textCoords = vector3(1818.5, 2608.4, 48.0),
	authorizedJobs = { ['police'] = 0 },
	locked = true,
	maxDistance = 12,
	fixText = true,
	size = 2,
	slides = true,
	lockpick = true,
})



-- reception staff entry
table.insert(Config.DoorList, {
	objHash = 2024969025, -- sanhje_prison_recep_door01 
	slides = false,
	maxDistance = 2.0,
	objHeading = 0.0,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	fixText = false,
	locked = true,
	audioRemote = false,
	objCoords = vector3(1844.404, 2576.997, 46.0356),
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- cloakroom reception
table.insert(Config.DoorList, {
	objHash = 2024969025, -- sanhje_prison_recep_door01
	slides = false,
	maxDistance = 2.0,
	objHeading = 0.0,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	fixText = false,
	locked = true,
	audioRemote = false,
	objCoords = vector3(1837.634, 2576.992, 46.0386),
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})




-- prison access reception
table.insert(Config.DoorList, {
	objHash = -684929024, -- sanhje_prison_recep_door02
	slides = false,
	maxDistance = 2.0,
	objHeading = 0.0,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	fixText = false,
	locked = true,
	audioRemote = false,
	objCoords = vector3(1837.742, 2592.162, 46.03957),
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- prison access 2 reception
table.insert(Config.DoorList, {
	objHash = -684929024, -- sanhje_prison_recep_door02
	slides = false,
	maxDistance = 2.0,
	objHeading = 89.999961853027,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	fixText = false,
	locked = true,
	audioRemote = false,
	objCoords = vector3(1831.34, 2594.992, 46.03791),
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})













-- security left
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 241550507, -- sanhje_prison_block_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1772.939, 2495.313, 49.84006),
	objHeading = 29.999996185303,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- security right
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 241550507, -- sanhje_prison_block_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1775.414, 2491.025, 49.84006),
	objHeading = 29.999996185303,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})




-- laboratory
table.insert(Config.DoorList, {
	objCoords = vector3(1767.323, 2580.832, 45.74783),
	garage = false,
	maxDistance = 2.0,
	lockpick = false,
	objHash = -1392981450, -- sanhje_prison_infirmary_door2
	fixText = false,
	objHeading = 90.000007629395,
	audioRemote = false,
	slides = false,
	authorizedJobs = { ['police']=0 },
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- surgery
table.insert(Config.DoorList, {
	lockpick = false,
	doors = {
		{objHash = -1624297821, objHeading = 270.0, objCoords = vector3(1767.321, 2582.308, 45.75345)}, -- sanhje_prison_infirmary_door1
		{objHash = -1624297821, objHeading = 90.000007629395, objCoords = vector3(1767.321, 2584.607, 45.75345)} -- sanhje_prison_infirmary_door1
 },
	slides = false,
	audioRemote = false,
	maxDistance = 2.5,
	authorizedJobs = { ['police']=0 },
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- intensive care
table.insert(Config.DoorList, {
	lockpick = false,
	doors = {
		{objHash = -1624297821, objHeading = 3.8476657209685e-05, objCoords = vector3(1766.325, 2589.564, 45.75309)}, -- sanhje_prison_infirmary_door1
		{objHash = -1624297821, objHeading = 180.00006103516, objCoords = vector3(1764.026, 2589.564, 45.75309)} -- sanhje_prison_infirmary_door1
 },
	slides = false,
	audioRemote = false,
	maxDistance = 2.5,
	authorizedJobs = { ['police']=0 },
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})


