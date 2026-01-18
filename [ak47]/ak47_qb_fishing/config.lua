Config = {}
Config.Locale = 'en'

Config.AnchorCommand = 'anchor'
Config.ZoneAlert = true
Config.DebugPoly = false

Config.InvImgLink = "nui://ox_inventory/web/images/" -- ak47_qb_inventory
--[[
Config.InvImgLink = "nui://qb-inventory/html/images/"           -- qb-inventory
Config.InvImgLink = "nui://ps-inventory/html/images/"           -- ps-inventory
Config.InvImgLink = "nui://lj-inventory/html/images/"           -- lj-inventory
Config.InvImgLink = "nui://qs-inventory/html/images/"           -- qs-inventory
Config.InvImgLink = "nui://ox_inventory/web/images/"            -- ox_inventory
Config.InvImgLink = "nui://ak47_qb_inventory/web/build/images/" -- ak47_qb_inventory
]]

-- Experience points required for each level
Config.Levels = {
    [1] = 100,
    [2] = 500,
    [3] = 1200,
    [4] = 1500,
    [5] = 1800,
    [6] = 2000,
    [7] = 2200,
    [8] = 2400,
    [9] = 2600,
    [10] = 2800,
    [11] = 3000,
    [12] = 3200,
}

-- Location of the fishing shop ped
Config.ShopLocations = {
    {
        model = 'u_m_o_taphillbilly',
        coords = vector4(1680.3, 3664.39, 34.94, 27.45),
        blip = {enable = true, sprite = 59, size = 0.6, color = 2},
        label = 'Bait and Tackle',
    },
}

-- Items available for purchase in the UI
Config.ShopItems = {
    rods = {
        { name = 'fishingrod', label = 'Fishing Rod', price = 5000, description = 'A sturdy rod for all uses.' },
        { name = 'reinforcedrod', label = 'Reinforced Rod', price = 25000, description = 'Less chance of breaking.' },
    },
    baits = {
        { name = 'fishingbait', label = 'Basic Bait', price = 100, description = 'Attracts common fish.' },
        { name = 'magicbait', label = 'Magic Bait', price = 200, description = 'Attracts rarer fish.' },
        { name = 'glowworms', label = 'Glow Worms', price = 300, description = 'Great for night fishing.' },
    }
}

-- All fish that can be caught and sold (adjusted to match items.lua)
Config.Fishes = {
    ['goldfish'] =       { label = 'Goldfish',         sellprice = 1000,  required_level = 0,  xp_reward = 5 },
    ['catfish'] =        { label = 'Catfish',          sellprice = 2000,  required_level = 1,  xp_reward = 12 },
    ['largemouthbass'] = { label = 'Largemouth Bass',  sellprice = 3000,  required_level = 2,  xp_reward = 25 },
    ['stripedbass'] =    { label = 'Striped Bass',     sellprice = 4000,  required_level = 3,  xp_reward = 30 },
    ['salmon'] =         { label = 'Salmon',           sellprice = 5000,  required_level = 4,  xp_reward = 40 },
    ['redfish'] =        { label = 'Redfish',          sellprice = 6000,  required_level = 5,  xp_reward = 50 },
    ['stingray'] =       { label = 'Stingray',         sellprice = 7000,  required_level = 6,  xp_reward = 80 },
    ['marlin'] =         { label = 'Marlin',           sellprice = 8000,  required_level = 7,  xp_reward = 100 },
    ['anglerfish'] =     { label = 'Anglerfish',       sellprice = 9000,  required_level = 8,  xp_reward = 120 },
    ['octopus'] =        { label = 'Octopus',          sellprice = 10000, required_level = 9,  xp_reward = 140 },
    ['greatwhiteshark'] ={ label = 'Great White Shark',sellprice = 12000, required_level = 10, xp_reward = 160 },
    ['coelacanth'] =     { label = 'Coelacanth',       sellprice = 15000, required_level = 12, xp_reward = 200 },
}

-- Define which baits affect which fish
Config.BaitTypes = {
    ['fishingbait'] = { chance_modifier = 1.0, fish_types = {'goldfish', 'catfish', 'largemouthbass', 'stripedbass'} },
    ['magicbait'] =   { chance_modifier = 1.5, fish_types = {'salmon', 'redfish', 'stingray', 'marlin'} },
    ['glowworms'] =   { chance_modifier = 1.2, fish_types = {'anglerfish', 'octopus', 'greatwhiteshark', 'coelacanth'} }
}

-- Define which rod can catch which fish
Config.RodTypes = {
    ['fishingrod'] = { 'goldfish', 'catfish', 'largemouthbass', 'stripedbass', 'salmon', 'redfish', 'stingray', 'marlin', 'anglerfish', 'octopus' },
    ['reinforcedrod'] = { 'goldfish', 'catfish', 'largemouthbass', 'stripedbass', 'salmon', 'redfish', 'stingray', 'marlin', 'anglerfish', 'octopus', 'greatwhiteshark', 'coelacanth' },
}

Config.PropByRodTypes = {
    ['fishingrod'] = `prop_fishing_rod_01`,
    ['reinforcedrod'] = `prop_fishing_rod_02`,
}

Config.FishingZones = {
    [1] = {
        coords = vector3(713.0, 4093.12, 34.73),
        radius = 50.0,
        name = 'Fishing Zone',
        blip = {enable = true, sprite = 638, size = 0.6, color = 2},
        CastTime = {minimum = 10, maximum = 20},
        MiniGame = 'minigamelv2',
        Stress   = {
            AddOnFail = 3, 
            RemoveOnSuccess = 2
        },
        RodHealth = { -- only works with ak47_qb_inventory
            onSuccess = {
                fishingrod = 5,
                reinforcedrod = 2,
            }, 
            onFail = {
                fishingrod = 10,
                reinforcedrod = 4,
            }
        },
        Items = { 'goldfish', 'catfish', 'largemouthbass', 'stripedbass', 'salmon' }
    },
    [2] = {
        coords = vector3(3542.36, 5310.26, 0.96),
        radius = 120.0,
        name = 'Deep Sea Fishing',
        blip = {enable = true, sprite = 638, size = 0.6, color = 2},
        CastTime = {minimum = 15, maximum = 25},
        MiniGame = 'minigamelv3',
        Stress   = {
            AddOnFail = 3, 
            RemoveOnSuccess = 2
        },
        RodHealth = { -- only works with ak47_qb_inventory
            onSuccess = {
                fishingrod = 5,
                reinforcedrod = 2,
            }, 
            onFail = {
                fishingrod = 10,
                reinforcedrod = 4,
            }
        },
        Items = { 'redfish', 'stingray', 'marlin', 'anglerfish', 'octopus', 'greatwhiteshark', 'coelacanth' }
    },
}

Config.MiniGames = {
    minigamelv1 = function()
        return lib.skillCheck({ 'easy', 'easy' }, { 'e', 'e' })
    end,
    minigamelv2 = function()
        return lib.skillCheck({ 'easy', 'easy', 'easy' }, { 'e', 'e', 'e' })
    end,
    minigamelv3 = function()
        return lib.skillCheck({ 'easy', 'easy', 'medium' }, { 'e', 'e', 'e' })
    end,
    minigamelv4 = function()
        return lib.skillCheck({ 'easy', 'easy', 'easy', 'medium' }, { 'e', 'e', 'e', 'e' })
    end,
    minigamelv5 = function()
        return lib.skillCheck({ 'easy', 'easy', 'medium', 'hard' }, { 'e', 'e', 'e', 'e' })
    end,
}
