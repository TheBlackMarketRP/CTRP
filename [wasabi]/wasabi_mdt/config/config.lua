-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

Config = {}
Config.Departments = {}
-- Department configurations are loaded from config/departments/*.lua

-- Data Sync Configuration
-- Control which data should be synced with external systems
Config.SyncData = {
    enabled = true,          -- Master switch for all sync features
    citizens = true,         -- Sync citizens with framework tables (users/players)
    vehicles = true,         -- Sync vehicles with framework tables (owned_vehicles/player_vehicles)
    -- Housing options to sync with ('RxHousing', etc.)
    -- Add any housing script within the editable tempalate from within
    -- 'wasabi_mdt/server/adapters/housing/template.lua'
    -- 'RxHousing'
    -- false    
    housing = false
}
-- Note: When sync is enabled, manual registration buttons will be hidden in the UI
-- ESX: uses 'users' and 'owned_vehicles' tables
-- QBCore/QBox: uses 'players' and 'player_vehicles' tables

-- Locale Options are
-- 'en' (English)
-- 'fr' (French)
-- 'cn' (Chinese Simplified)
-- 'tw' (Chinese Traditional)
-- 'de' (German)
-- 'it' (Italian)
-- 'jp' (Japanese)
-- 'ko' (Korean)
-- 'pl' (Polish)
-- 'pt' (Portuguese)
-- 'es' (Spanish)
-- 'hi' (Hindi)
-- 'nl' (Dutch)
-- 'da' (Danish)
-- 'cs' (Czech)
-- If you would like us to add a language, join our discord and create a ticket!
-- All locale strings can be found in /locales/
Config.Locale = 'en'
Config.ImgDirectory = 'ox_inventory/web/images/' -- The directory where the images are stored.
Config.MapType = 'satellite' -- Map tile type: 'atlas' or 'satellite'

Config.OpenMDT = {
    item = {
        enabled = true,
        name = 'mdt_tablet', -- Name of the item to use to open the panel
    },
    command = {
        enabled = true,  -- Enable/disable both command & keybind
        cmd = 'mdt',     -- /mdt | Open the MDT panel
        keybind = false, -- F4 | Open the MDT panel | Remove or set to false to disable
    },
}

Config.Announcements = {
    maxAnnouncements = 10, -- Maximum number of active announcements
    defaultExpireDays = 7, -- Default days until announcement expires
}

Config.DispatchKeybinds = {
    panicButton = {
        enabled = true,
        key = 'F9',
        device = 'keyboard', -- keyboard, mouse, pad
        description = 'Activate Panic Button'
    },
    toggleDispatchHud = {
        enabled = true,
        key = 'F11',
        device = 'keyboard',
        description = 'Toggle Dispatch HUD'
    },
    toggleDispatchFocus = {
        enabled = true,
        key = 'Z',
        device = 'keyboard',
        description = 'Toggle Dispatch HUD Focus'
    }
}


Config.Cameras = {
    spawnDistance = 40.0, -- Distance at which cameras spawn/despawn
    checkInterval = 1000, -- How often to check distance (ms)
    models = { -- Available camera models with labels and view offsets
        {
            model = 'prop_cctv_cam_01a',
            label = 'Standard CCTV Camera',
            viewOffset = { x = 0, y = 0, z = -0.1 },  -- Position offset for camera view
            rotationOffset = { x = -10.0, y = 0, z = 180.0 }  -- Rotation offset for camera view
        },
        {
            model = 'prop_cctv_cam_01b',
            label = 'Standard CCTV Camera B',
            viewOffset = { x = 0, y = 0, z = -0.1 },
            rotationOffset = { x = -10.0, y = 0, z = 180.0 }
        },
        {
            model = 'prop_cctv_cam_02a',
            label = 'Wall-mounted Camera',
            viewOffset = { x = 0, y = 0, z = -0.15 },  -- Different offset for wall-mounted
            rotationOffset = { x = -10.0, y = 0, z = 180.0 }
        },
        {
            model = 'prop_cctv_cam_03a',
            label = 'Dome Camera',
            viewOffset = { x = 0, y = 0, z = -0.2 },  -- Lower for dome cameras
            rotationOffset = { x = -15.0, y = 0, z = 180.0 }  -- More downward tilt
        },
        {
            model = 'prop_cctv_cam_04a',
            label = 'Modern Security Camera',
            viewOffset = { x = 0, y = 0, z = -0.1 },
            rotationOffset = { x = -10.0, y = 0, z = 180.0 }
        },
        {
            model = 'prop_cctv_cam_04b',
            label = 'Modern Security Camera B',
            viewOffset = { x = 0, y = 0, z = -0.1 },
            rotationOffset = { x = -10.0, y = 0, z = 180.0 }
        },
        {
            model = 'prop_cctv_cam_04c',
            label = 'Modern Security Camera C',
            viewOffset = { x = 0, y = 0, z = -0.1 },
            rotationOffset = { x = -10.0, y = 0, z = 180.0 }
        },
        {
            model = 'prop_cctv_cam_05a',
            label = 'PTZ Camera',
            viewOffset = { x = 0, y = 0, z = -0.1 },
            rotationOffset = { x = -10.0, y = 0, z = 180.0 }
        },
        {
            model = 'prop_cctv_cam_06a',
            label = 'Outdoor Camera',
            viewOffset = { x = 0, y = 0, z = -0.1 },
            rotationOffset = { x = -10.0, y = 0, z = 180.0 }
        },
        {
            model = 'prop_cctv_cam_07a',
            label = 'High Security Camera',
            viewOffset = { x = 0, y = 0, z = -0.1 },
            rotationOffset = { x = -10.0, y = 0, z = 180.0 }
        },
        {
            model = 'hei_prop_bank_cctv_01',
            label = 'Bank CCTV Camera',
            viewOffset = { x = 0, y = 0, z = -0.15 },
            rotationOffset = { x = -10.0, y = 0, z = 180.0 }
        },
        {
            model = 'hei_prop_bank_cctv_02',
            label = 'Bank Dome Camera',
            viewOffset = { x = 0, y = 0, z = -0.2 },
            rotationOffset = { x = -15.0, y = 0, z = 180.0 }
        }
    }
}

Config.IgnoredJobs = { -- Jobs that will not be shown in the MDT
    "taxi",
    "bloods",
    "ballas",
    "vagos",
}

Config.DispatchTypes = {
    -- Each dispatch type has a label, default priority, and icon
    -- See available icons at: https://primevue.org/icons
    ['traffic_stop'] = { label = 'Traffic Stop', icon = 'car' },
    ['disturbance'] = { label = 'Disturbance', icon = 'volume-up' },
    ['theft'] = { label = 'Theft', icon = 'shopping-bag' },
    ['assault'] = { label = 'Assault', icon = 'user-minus' },
    ['robbery'] = { label = 'Robbery', icon = 'dollar' },
    ['shooting'] = { label = 'Shots Fired', icon = 'exclamation-triangle' },
    ['officer_down'] = { label = 'Officer Down', icon = 'shield' },
    ['panic'] = { label = 'Panic Button', icon = 'exclamation-circle' }
}

Config.PremadeDispatches = {
    -- Premade dispatch templates that can be triggered via exports
    -- Each template can be customized by server owners
    ['store_robbery'] = {
        type = 'robbery',
        title = 'Store Robbery in Progress',
        description = 'Suspect(s) robbing convenience store, weapon may be involved',
        priority = 4,
        location = 'Store Location', -- Can be overridden when calling
    },
    ['bank_robbery'] = {
        type = 'robbery',
        title = 'Bank Robbery in Progress',
        description = 'Multiple suspects robbing bank, armed and dangerous',
        priority = 5,
        location = 'Bank Location',
    },
    ['vehicle_theft'] = {
        type = 'theft',
        title = 'Vehicle Theft in Progress',
        description = 'Suspect stealing vehicle',
        priority = 3,
        location = 'Vehicle Location',
    },
    ['house_alarm'] = {
        type = 'disturbance',
        title = 'House Alarm Triggered',
        description = 'Residential alarm activated, possible break-in',
        priority = 2,
        location = 'Residence',
    },
    ['shots_fired'] = {
        type = 'shooting',
        title = 'Shots Fired',
        description = 'Multiple gunshots reported in area',
        priority = 5,
        location = 'Unknown',
    },
    ['drug_deal'] = {
        type = 'disturbance',
        title = 'Suspicious Activity',
        description = 'Possible drug transaction in progress',
        priority = 4,
        location = 'Street Corner',
    },
    ['street_race'] = {
        type = 'traffic_stop',
        title = 'Illegal Street Racing',
        description = 'Multiple vehicles racing, reckless driving reported',
        priority = 3,
        location = 'Highway',
    },
    ['assault_report'] = {
        type = 'assault',
        title = 'Assault in Progress',
        description = 'Physical altercation between multiple individuals',
        priority = 3,
        location = 'Public Area',
    },
    ['vandalism'] = {
        type = 'disturbance',
        title = 'Vandalism in Progress',
        description = 'Property damage being reported',
        priority = 1,
        location = 'Business/Property',
    },
    ['hostage_situation'] = {
        type = 'officer_down',
        title = 'Hostage Situation',
        description = 'Armed suspect(s) with hostages, requesting immediate backup',
        priority = 5,
        location = 'Building',
    }
}

-- Settings for automatic gunshot detection and dispatch
Config.Alerts = {
    shots_fired = {
        -- Enable or disable automatic shots fired alerts
        -- Uses PremadeDispatches 'shots_fired' template
        -- Police jobs are ignored by default
        enabled = true,
        timeout = 15 * 60 * 1000
    }
}

Config.PropertyTypes = { -- icons from https://primevue.org/icons/#list
    { type = 'house',      label = 'House',      icon = 'home' },
    { type = 'apartment',  label = 'Apartment',  icon = 'building' },
    { type = 'business',   label = 'Business',   icon = 'briefcase' },
    { type = 'warehouse',  label = 'Warehouse',  icon = 'box' },
    { type = 'garage',     label = 'Garage',     icon = 'car' },
    { type = 'office',     label = 'Office',     icon = 'sitemap' },
    { type = 'store',      label = 'Store',      icon = 'shopping-cart' },
    { type = 'industrial', label = 'Industrial', icon = 'cog' },
    { type = 'land',       label = 'Land/Lot',   icon = 'map' },
    { type = 'other',      label = 'Other',      icon = 'question-circle' },
}

Config.EvidenceTypes = { -- icons from https://primevue.org/icons/#list
    { type = 'photo_video',   label = 'Photo/Video',   icon = 'camera' },
    { type = 'document',      label = 'Document',      icon = 'file' },
    { type = 'physical_item', label = 'Physical Item', icon = 'box' },
    { type = 'biological',    label = 'Biological',    icon = 'heart' },
    { type = 'digital',       label = 'Digital',       icon = 'desktop' },
    { type = 'weapon',        label = 'Weapon',        icon = 'shield' },
    { type = 'drugs',         label = 'Drugs',         icon = 'filter' },
    { type = 'other',         label = 'Other',         icon = 'question-circle' },
}

--[[
    YOU CAN USE ACE PERMISSIONS TO ALLOW CERTAIN PLAYERS/GROUPS TO ACCESS THE STAFF PANEL
    EXAMPLE:
        add_ace group.admin mdt.staff allow
        add_ace identifier.fivem:1432744 mdt.staff allow #Rejox

    OR YOU CAN USE THE STAFF GROUPS BELOW
--]]
Config.StaffGroups = {
    'superadmin',
    'admin',
    'god',
    'mod',
}

Config.UI = {
    color = {       -- Default colors, departments will override these
        primary = { -- The number are shades, 50 is the lightest and 950 is the darkest
            [50] = "#EBF5FF",
            [100] = "#D6EBFF",
            [200] = "#ADD6FF",
            [300] = "#85C1FF",
            [400] = "#5CACFF",
            [500] = "#3B82F6",
            [600] = "#2563EB",
            [700] = "#1D4ED8",
            [800] = "#1E40AF",
            [900] = "#1E3A8A",
            [950] = "#172554",
        },
    }
}

Config.Weapons = {
    { name = 'weapon_pistol',             label = 'Pistol' },
    { name = 'weapon_pistol_mk2',         label = 'Pistol Mk II' },
    { name = 'weapon_combatpistol',       label = 'Combat Pistol' },
    { name = 'weapon_appistol',           label = 'AP Pistol' },
    { name = 'weapon_pistol50',           label = 'Pistol .50' },
    { name = 'weapon_snspistol',          label = 'SNS Pistol' },
    { name = 'weapon_snspistol_mk2',      label = 'SNS Pistol Mk II' },
    { name = 'weapon_heavypistol',        label = 'Heavy Pistol' },
    { name = 'weapon_vintagepistol',      label = 'Vintage Pistol' },
    { name = 'weapon_marksmanpistol',     label = 'Marksman Pistol' },
    { name = 'weapon_revolver',           label = 'Heavy Revolver' },
    { name = 'weapon_revolver_mk2',       label = 'Heavy Revolver Mk II' },
    { name = 'weapon_doubleaction',       label = 'Double Action Revolver' },
    { name = 'weapon_ceramicpistol',      label = 'Ceramic Pistol' },
    { name = 'weapon_navyrevolver',       label = 'Navy Revolver' },
    { name = 'weapon_gadgetpistol',       label = 'Perico Pistol' },
    -- SMGs
    { name = 'weapon_microsmg',           label = 'Micro SMG' },
    { name = 'weapon_smg',                label = 'SMG' },
    { name = 'weapon_smg_mk2',            label = 'SMG Mk II' },
    { name = 'weapon_assaultsmg',         label = 'Assault SMG' },
    { name = 'weapon_combatpdw',          label = 'Combat PDW' },
    { name = 'weapon_machinepistol',      label = 'Machine Pistol' },
    { name = 'weapon_minismg',            label = 'Mini SMG' },
    -- Shotguns
    { name = 'weapon_pumpshotgun',        label = 'Pump Shotgun' },
    { name = 'weapon_pumpshotgun_mk2',    label = 'Pump Shotgun Mk II' },
    { name = 'weapon_sawnoffshotgun',     label = 'Sawed-Off Shotgun' },
    { name = 'weapon_assaultshotgun',     label = 'Assault Shotgun' },
    { name = 'weapon_bullpupshotgun',     label = 'Bullpup Shotgun' },
    { name = 'weapon_musket',             label = 'Musket' },
    { name = 'weapon_heavyshotgun',       label = 'Heavy Shotgun' },
    { name = 'weapon_dbshotgun',          label = 'Double Barrel Shotgun' },
    { name = 'weapon_autoshotgun',        label = 'Sweeper Shotgun' },
    { name = 'weapon_combatshotgun',      label = 'Combat Shotgun' },
    -- Assault Rifles
    { name = 'weapon_assaultrifle',       label = 'Assault Rifle' },
    { name = 'weapon_assaultrifle_mk2',   label = 'Assault Rifle Mk II' },
    { name = 'weapon_carbinerifle',       label = 'Carbine Rifle' },
    { name = 'weapon_carbinerifle_mk2',   label = 'Carbine Rifle Mk II' },
    { name = 'weapon_advancedrifle',      label = 'Advanced Rifle' },
    { name = 'weapon_specialcarbine',     label = 'Special Carbine' },
    { name = 'weapon_specialcarbine_mk2', label = 'Special Carbine Mk II' },
    { name = 'weapon_bullpuprifle',       label = 'Bullpup Rifle' },
    { name = 'weapon_bullpuprifle_mk2',   label = 'Bullpup Rifle Mk II' },
    { name = 'weapon_compactrifle',       label = 'Compact Rifle' },
    { name = 'weapon_militaryrifle',      label = 'Military Rifle' },
    { name = 'weapon_heavyrifle',         label = 'Heavy Rifle' },
    -- Snipers
    { name = 'weapon_sniperrifle',        label = 'Sniper Rifle' },
    { name = 'weapon_heavysniper',        label = 'Heavy Sniper' },
    { name = 'weapon_heavysniper_mk2',    label = 'Heavy Sniper Mk II' },
    { name = 'weapon_marksmanrifle',      label = 'Marksman Rifle' },
    { name = 'weapon_marksmanrifle_mk2',  label = 'Marksman Rifle Mk II' },
    -- Melee
    { name = 'weapon_knife',              label = 'Knife' },
    { name = 'weapon_nightstick',         label = 'Nightstick' },
    { name = 'weapon_hammer',             label = 'Hammer' },
    { name = 'weapon_bat',                label = 'Baseball Bat' },
    { name = 'weapon_crowbar',            label = 'Crowbar' },
    { name = 'weapon_golfclub',           label = 'Golf Club' },
    { name = 'weapon_bottle',             label = 'Bottle' },
    { name = 'weapon_dagger',             label = 'Dagger' },
    { name = 'weapon_hatchet',            label = 'Hatchet' },
    { name = 'weapon_knuckle',            label = 'Knuckle Dusters' },
    { name = 'weapon_machete',            label = 'Machete' },
    { name = 'weapon_flashlight',         label = 'Flashlight' },
    { name = 'weapon_switchblade',        label = 'Switchblade' },
    { name = 'weapon_poolcue',            label = 'Pool Cue' },
    { name = 'weapon_wrench',             label = 'Wrench' },
    { name = 'weapon_battleaxe',          label = 'Battle Axe' },
    { name = 'WEAPON_BARP',          label = 'Bandana AR-15' },
    { name = 'WEAPON_1VARP',          label = 'Bullet ARP' },
    { name = 'WEAPON_MERCYAR',          label = 'BMC Gang Gunv1' },
    { name = 'WEAPON_HK416C',          label = 'Bootleg HK' },
    { name = 'WEAPON_AUTOSMG',          label = 'Auto SMG' },
    { name = 'WEAPON_R90',          label = 'R90' },
    { name = 'WEAPON_TACTICALDRACO',          label = 'Draco' },
    { name = 'WEAPON_GLOCK26V2',          label = 'G26' },
    { name = 'WEAPON_DARP',          label = 'D-ARP' },
    { name = 'WEAPON_DICEDDRACO',          label = 'D-ICEDRACO' },
    { name = 'WEAPON_DAK47U',          label = 'D-AK47U' },
    { name = 'WEAPON_DBLK',          label = 'D-300' },
    { name = 'WEAPON_DDRACO',          label = 'D-DRACO' },
    { name = 'WEAPON_DDM4V7',          label = 'DDM4V7' },
    { name = 'WEAPON_G2C',          label = 'G2C' },
    { name = 'WEAPON_PMR',          label = 'PMR' },
    { name = 'WEAPON_GS',          label = 'GS' },
    { name = 'WEAPON_SP320',          label = 'SP320' },
    { name = 'WEAPON_BP',          label = 'BERETTA PICO' },
    { name = 'WEAPON_TGLOCK',          label = 'TAN GLOCK' },
    { name = 'WEAPON_G19X',          label = 'GLOCK 19X' },
    { name = 'WEAPON_AWP',          label = 'AWP' },
    { name = 'WEAPON_TUZI',          label = 'TACTICAL UZI' },
    { name = 'WEAPON_BROOM',          label = 'BROOM' },
    { name = 'WEAPON_TOMAHAWK',          label = 'TOMAHAWK' },
    { name = 'WEAPON_TRIDAGGER',          label = 'TRIDAGGER' },
    { name = 'WEAPON_SHAMMER',          label = 'SLEDGE HAMMER' },
    { name = 'WEAPON_DILDO',          label = 'DILDO' },
    { name = 'WEAPON_UK',          label = 'UTILITY KNIFE' },
    { name = 'WEAPON_SD',          label = 'SCREW DRIVER' },
    { name = 'WEAPON_M200',          label = 'CheyTac M200' },
    { name = 'WEAPON_SCAR',          label = 'SCAR' },
    { name = 'WEAPON_552',          label = 'SG-552' },
    { name = 'WEAPON_L1A1',          label = 'FN L1A1' },
    { name = 'WEAPON_FAL',          label = 'FN FAL' },
    { name = 'WEAPON_MCX',          label = 'SIG MCX' },
    { name = 'WEAPON_P2011',          label = 'P2011' },
    { name = 'WEAPON_P416',          label = 'P416' },
    { name = 'WEAPON_HIPOINT',          label = 'HIPOINT' },
    { name = 'WEAPON_DE',          label = 'DESERT EAGLE' },
    { name = 'WEAPON_AUGA1',          label = 'AUG A1' },
    { name = 'WEAPON_P90',          label = 'P90' },
    { name = 'WEAPON_VESPER',          label = 'VESPER' },
    { name = 'WEAPON_H12',          label = 'HAYMAKER 12' },
    { name = 'WEAPON_G26',          label = 'GLOCK 26' },
    { name = 'WEAPON_IA2',          label = 'IA2' },
    { name = 'WEAPON_AS50',          label = 'AS50' },
    { name = 'WEAPON_BAR15',          label = 'BAR15' },
    { name = 'WEAPON_AXE',          label = 'AXE' },
    { name = 'WEAPON_BLACKARP',          label = 'BLACKARP' },
    { name = 'WEAPON_BLACKSTORM',          label = 'BLACKSTORM' },
    { name = 'WEAPON_BLACKTOMMY',          label = 'BLACKTOMMY' },
    { name = 'WEAPON_BLUETITANS',          label = 'BLUETITANS' },
    { name = 'WEAPON_CHAIR',          label = 'CHAIR' },
    { name = 'WEAPON_DMK18',          label = 'DMK18' },
    { name = 'WEAPON_FALCON57',          label = 'FALCON57' },
    { name = 'WEAPON_TITAN21',          label = 'TITAN21' },
    { name = 'WEAPON_TITAN41',          label = 'TITAN41' },
    { name = 'WEAPON_TITANBEAMS',          label = 'TITANBEAMS' },
    { name = 'WEAPON_HUNTERB80L',          label = 'HUNTERB80L' },
    { name = 'WEAPON_ILLTITAN17',          label = 'ILLTITAN17' },
    { name = 'WEAPON_VIPERVECTOR',          label = 'VIPERVECTOR' },
    { name = 'WEAPON_LBTARP',          label = 'LBTARP' },
    { name = 'WEAPON_MGTITAN',          label = 'MGTITAN' },
    { name = 'WEAPON_MIDASTITAN',          label = 'MIDASTITAN' },
    { name = 'WEAPON_MAVERICK500',          label = 'MAVERICK500' },
    { name = 'WEAPON_PHOENIX210',          label = 'PHOENIX210' },
    { name = 'WEAPON_RAV7',          label = 'RAV7' },
    { name = 'WEAPON_REDARP',          label = 'REDARP' },
    { name = 'WEAPON_REDM4A1',          label = 'REDM4A1' },
    { name = 'WEAPON_WINRANGE590',          label = 'WINRANGE590' },
    { name = 'WEAPON_RANGERP40',          label = 'RANGERP40' },
    { name = 'WEAPON_TPATRIOT1911',          label = 'TPATRIOT1911' },
    { name = 'WEAPON_TARP',          label = 'TARP' },
    { name = 'WEAPON_TT19',          label = 'TT19' },
    { name = 'WEAPON_TAC9S',          label = 'TAC9S' },
    { name = 'WEAPON_WOARP',          label = 'WOARP' },
    { name = 'WEAPON_MAC10',          label = 'MAC10' },
    { name = 'WEAPON_MBFMP7',          label = 'MBFMP7' },
    { name = 'WEAPON_ALEX_MP5',          label = 'ALEX MP5' },
    { name = 'WEAPON_BIGMONEY_AR13',          label = 'BIGMONEY AR13' },
    { name = 'WEAPON_CHROMEHEART_SNIPER',          label = 'CHROMEHEART SNIPER' },
    { name = 'WEAPON_CRASHOUT_G19',          label = 'CRASHOUT G19' },
    { name = 'WEAPON_DEMON_AXE',          label = 'DEMON AXE' },
    { name = 'WEAPON_GODS_WRATH',          label = 'GODS WRATH' },
    { name = 'WEAPON_LUCKY_G19X',          label = 'LUCKY G19X' },
    { name = 'WEAPON_MADDOX_G19X',          label = 'MADDOX G19X' },
    { name = 'WEAPON_NA_MG',          label = 'NA MG' },
    { name = 'WEAPON_OPPSTOPPER_AR13',          label = 'OPPSTOPPER AR13' },
    { name = 'WEAPON_REAPER_AR13',          label = 'REAPER AR13' },
    { name = 'WEAPON_RICO_50',          label = 'RICO 50' },
    { name = 'WEAPON_RUBBER_CHICKEN',          label = 'RUBBER CHICKEN' },
    { name = 'WEAPON_CH_G20',          label = 'CH G20' },
    { name = 'WEAPON_ONEHAND_GRAU',          label = 'ONEHAND GRAU' },
    { name = 'WEAPON_ARP1',          label = 'ARP1' },
    { name = 'WEAPON_PINK_GLOCKARONI',          label = 'PINK GLOCKARONI' },
    { name = 'WEAPON_PURPLE_GLOCKARONI',          label = 'PURPLE GLOCKARONI' },
    { name = 'WEAPON_G20-PW-BEAM',          label = 'G20 PW BEAM' },
    { name = 'WEAPON_PINK_ARP',          label = 'PINK ARP' },
    { name = 'WEAPON_PURPLE_ARP',          label = 'PURPLE ARP' },
    { name = 'WEAPON_XMAS1_ARP',          label = 'XMAS1 ARP' },
    { name = 'WEAPON_XMAS2_ARP',          label = 'XMAS2 ARP' },
    { name = 'WEAPON_XMAS3_ARP',          label = 'XMAS3 ARP' },
    { name = 'WEAPON_XMAS4_ARP',          label = 'XMAS4 ARP' },
    { name = 'WEAPON_XMAS5_ARP',          label = 'XMAS5 ARP' },
    { name = 'WEAPON_COOKIE_KNIFE',          label = 'COOKIE KNIFE' },
    { name = 'WEAPON_XMAS_GLACIER',          label = 'XMAS GLACIER' },
}

Config.VehicleTypes = {
    { type = "car", label = "Car", icon = "car" },
    { type = "motorcycle", label = "Motorcycle", icon = "car" },
    { type = "truck", label = "Truck", icon = "truck" },
    { type = "suv", label = "SUV", icon = "truck" },
    { type = "van", label = "Van", icon = "truck" },
    { type = "emergency", label = "Emergency", icon = "truck" },
    { type = "helicopter", label = "Helicopter", icon = "car" },
    { type = "plane", label = "Plane", icon = "car" },
    { type = "boat", label = "Boat", icon = "car" },
    { type = "bicycle", label = "Bicycle", icon = "car" },
    { type = "off_road", label = "Off-Road", icon = "truck" },
    { type = "sports", label = "Sports", icon = "car" },
    { type = "super", label = "Super", icon = "car" },
    { type = "sedan", label = "Sedan", icon = "car" },
    { type = "coupe", label = "Coupe", icon = "car" },
    { type = "muscle", label = "Muscle", icon = "car" },
    { type = "sports_classic", label = "Sports Classic", icon = "car" },
    { type = "compact", label = "Compact", icon = "car" },
    { type = "utility", label = "Utility", icon = "truck" },
    { type = "industrial", label = "Industrial", icon = "truck" },
    { type = "service", label = "Service", icon = "truck" },
    { type = "military", label = "Military", icon = "truck" },
    { type = "commercial", label = "Commercial", icon = "truck" },
}

--[[
    ONLY CHANGE THIS PART IF YOU HAVE RENAMED SCRIPTS SUCH AS FRAMEWORK, TARGET, INVENTORY ETC
    RENAME THE SCRIPT NAME TO THE NEW NAME
--]]
---@type table Only change these if you have changed the name of a resource
Resources = {
    SCREENBASIC = { name = 'screenshot-basic', export = 'all' },
    OBJECTGIZMO = { name = 'object_gizmo', export = 'all' },
}
IgnoreScriptFoundLogs = false
ShowDebugPrints = true
