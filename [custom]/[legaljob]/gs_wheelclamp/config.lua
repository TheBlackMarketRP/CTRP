Config = {}

-- The hash of the wheel clamp prop
Config.PropHash = `clamp`

-- The range at which you can interact
Config.InteractionRange = 1.25

-- Vehicle classes which cannot be clamped
Config.BlacklistClasses = { 13, 14, 15, 16, 21 }

-- The required item, set to false to disable
Config.RequiredItem = {
	Enabled = true,
	Item = 'wheel_clamp'
}

-- The allowed jobs to place/remove a wheel clamp, set Config.AllowedJobs = nil allows everyone to use it
Config.AllowedJobs = { police = 0, mechanic = 0, kush = 0 } -- Example to add jobs: Config.AllowedJobs = { police = 0, mechanic = 0 }

Config.Lockpick = {
	Enabled = true,            -- If set to false, the wheel clamp cannot be lockpicked
	Item = nil,                -- The item name required to lockpick the wheel clamp, set to nil to disable item requirement
	AmountOfMinigames = 3,     -- The amount of successful minigames required to lockpick the wheel clamp (only for servers with ox_lib installed)
	MinigameAreaSize = 35,     -- The area size of the lockpick minigame, smaller value is more difficult (only for servers with ox_lib installed)
	MinigameSpeedMultiplier = 1.3 -- The speed multiplier for the lockpick minigame, larger value is more difficult (only for servers with ox_lib installed)
}

-- If set to true, the W and S keys will be disabled when any wheel is clamped.
Config.DisableVehicleMovement = true

Config.WheelBreakoff = {
	Enabled = true,      -- If set to false, the wheel breakoff feature will be disabled
	MinimumSpeed = 30,   -- km/h. The minimum speed of a vehicle, after which a clamped wheel can break off. Driving at a speed below Config.BreakOffWheelMinimumSpeed will ensure the clamped wheel never breaks off. When going faster then Config.BreakOffWheelMinimumSpeed, the faster you go the higher the chance of a breakoff
	IntervalTime = 6000, -- ms. Every 6 seconds (by default), the wheel can randomly break off based on chance.
	ChanceMultiplier = 1.0, -- If you want to further increase the chance of a wheel breaking off, increase this value.
}

-- If set to true, the player will not be able to steer the vehicle when a FRONT-wheel is clamped.
Config.DisableSteering = true

-- The animations to play on interactions
Config.Animations = {
	['PlaceClamp'] = {
		Dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
		Name = 'machinic_loop_mechandplayer',
		Time = 2000,
		Blend = 8.0,
		Flag = 1,
	},
	['RemoveClamp'] = {
		Dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
		Name = 'machinic_loop_mechandplayer',
		Time = 2000,
		Blend = 8.0,
		Flag = 1,
	},
	['PrepareLockpick'] = {
		Dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
		Name = 'machinic_loop_mechandplayer',
		Time = 5000,
		Blend = 8.0,
		Flag = 1,
	},
	['Lockpicking'] = {
		Dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
		Name = 'machinic_loop_mechandplayer',
		Time = 5000,
		Blend = 8.0,
		Flag = 1,
	},
}

-- You can change any labels below
Config.Locales = {
	['wheel_clamp'] = 'Wheel clamp',
	['wheel_clamp_remove'] = 'Remove wheel clamp',
	['wheel_clamp_lockpick'] = 'Lockpick wheel clamp',
	['wheel_clamp_attaching'] = 'Attaching wheel clamp',
	['wheel_clamp_detaching'] = 'Detaching wheel clamp',
	['lockpick_prepare'] = 'Preparing lockpick',
}

-- WHEEL INDICES: LF = 0, RF = 1, LR = 2, RR = 3; LM1 = 4, RM1 = 5 etc. So bone names below fixed on these indices
Config.Bones = { 'wheel_lf', 'wheel_rf', 'wheel_lr', 'wheel_rr', 'wheel_lm1', 'wheel_rm1', 'wheel_lm2', 'wheel_rm2', 'wheel_lm3', 'wheel_rm3' } -- Do not change unless you know what you are doing
Config.WheelLabels = {
	-- You can change these labels if you wish, but make sure the order stays the same (corresponds to the Config.Bones array)
	'Left-front',
	'Right-front',
	'Left-back',
	'Right-back',
	'Left-center 1',
	'Right-center 1',
	'Left-center 2',
	'Right-center 2',
	'Left-center 3',
	'Right-center 3',
}

-- An array to overwrite the indices in the Config.Bones array, in case of a two wheeled bike.
Config.TwoWheelBikeIndices = { 1, 1, 0, 0, 2, 2 }   -- Do not change unless you know what you are doing
-- An array to overwrite the indices in the Config.Bones array, in case of a three wheeled bike.
Config.ThreeWheelBikeIndices = { 0, 0, 1, 2, 3, 3 } -- Do not change unless you know what you are doing
