-- If you need support I now have a discord available, it helps me keep track of issues and give better support.

-- https://discord.gg/9pCDHmjYwd

Config = {
	Lan = "en",
	System = {
		Debug = false,				-- This enables debug zones and messages to help work out issues
		EventDebug = false,			-- This enables advanced debug messages to see what variables are being sent though events

		Menu = "qb",				-- "qb", "ox", "lation", "gta"
		Notify = "okok",				-- "qb", "ox", "esx", "lation", "okok", "gta"
		drawText = "gta",			-- "qb", "ox", "esx", "lation", "gta"
		ProgressBar = "gta",		-- "qb", "ox", "esx", "lation", "17mov", "gta"
		Billing = "okok",			-- "jim", "okok", "codem", "tgg"

		enableCam = true,			-- Enables customs cameras when crafting etc.
	},

	blipController = {
		-- Requires jim-blipcontroller
		enable = false,

		-- Enable only one
		discoverableBlips = false,	-- Makes it so users need to "find" the location to be able to see it on map
									-- Good for getting your players out and about

		onDutyBlips = true,			-- Creates "Duty Blips", if there is a player with the locations job  and is onDuty
									-- then mark the location as "Open" on the map
	},

	Crafting = {
		MultiCraft = true,			-- This enables mutlicraft, so users can craft multiples at once instead of one at a time
		showItemBox = true,			-- Some inventories need this, shows an item box when any item event happens

		SingleProgress = false,		-- Set to true so when crafting multiple items at once, only "place" items one, then one big progressbar to craft all items at once
	},

	General = {
		JimShops = false,			-- Enable this to use jim-shops for shop system (comes with being able to use society funds to purchase items)
		showClockInTill = true,		-- This enables "Toggle Duty" options when targetting payment tills
		showBossMenuTill = true,	-- This enables bossmenu options when targetting payment tills
	},

	Club = {
		--Stress
		TipCost = 100, -- How much a Stripper Tip costs
		TipStress = 5, -- How much stress relief per tip

		Strippers = true,
		JacuzzisStress = math.random(1, 3),

	},
	--Simple Toy Reward Support
	Rewards = {
		RewardItem = { "", "", },	--Set this to the name of an item eg "bento"
		RewardPool = { 				-- Set this to the list of items to be given out as random prizes when the item is used - can be more or less items in the list
			{ item = "", rarity = 90},
			{ item = "", rarity = 10},
		},
	},
}

-- Custom Emotes used for crafting
CraftingEmotes = {
	Shake = {
		animDict = "switch@franklin@lamar_tagging_wall", anim = "lamar_tagging_wall_loop_lamar",
		prop = { model = "prop_bar_cockshaker", bone = 57005, pos = vec3(0.03, -0.1, -0.07), rot = vec3(-80.0, 0.0, -30.0) },
	},
	Pour = {
		animDict = "mp_ped_interaction", anim = "handshake_guy_a",
	},
	Typing = {
		animDict = "anim@heists@prison_heiststation@cop_reactions",	anim = "cop_b_idle",
	},
	Grill = {
		animDict = "amb@prop_human_bbq@male@base", anim = "base",
		prop = { model = "bkr_prop_coke_spatula_04", bone = 57005, pos = vec3(0.15, 0.08, -0.03), rot = vec3(10.0, -40.0, 150.0) },
	},
	Oven = {
		animDict = "amb@prop_human_bbq@male@base", anim = "base",
		prop = { model = "v_ret_fh_fry02", bone = 57005, pos = vec3(0.21, 0.22, 0.0), rot = vec3(1.0, -19.0, -120.0) },
	},
	Buttons = {
		animDict = "anim@heists@keypad@", anim = "idle_a",
	},
}

-- Function for locales
-- Don't touch unless you know what you're doing
-- This needs to be here because it loads before everything else
function locale(section, string)
    if not Config.Lan or Config.Lan == "" then
        print("^1Error^7: ^3Config^7.^3Lan ^1not set^7, ^2falling back to Config.Lan = 'en'")
        Config = Config or {}
        Config.Lan = "en"
    end

    local localTable = Loc[Config.Lan]
    -- If Loc[..] doesn't exist, warn user
    if not localTable then
		print("Locale Table '"..Config.Lan.."' Not Found")
        return "Locale Table '"..Config.Lan.."' Not Found"
    end

    -- If Loc[..].section doesn't exist, warn user
    if not localTable[section] then
		print("^1Error^7: Locale Section: ['"..section.."'] Invalid")
        return "Locale Section: ['"..section.."'] Invalid"
    end

    -- If Loc[..].section.string doesn't exist, warn user
    if not localTable[section][string] then
		print("^1Error^7: Locale String: ['"..section.."']['"..string.."'] Invalid")
        return "Locale String: ['"..string.."'] Invalid"
    end

    -- If no issues, return the string
    return localTable[section][string]
end