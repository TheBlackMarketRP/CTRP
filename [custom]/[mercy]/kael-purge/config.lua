Config = {
    Core = 'qb-core',    
}

Config.StartCommand = "purgestart"
Config.StopCommand = "purgestop"

Config.WeatherName = "HALLOWEEN"


Config.DropInterVal = 1 -- in min
Config.DropBlip = {
    Enable = true,
    Icon = 550,
    Color = 61,
    Text = "Air Drop",
    Size = 0.9,
}

Config.DropCoords = {
    vector3(1012.8, -3209.95, 5.88),
    vector3(1260.69, -3220.2, 5.89),
    vector3(1257.3, -3086.56, 5.9),
    vector3(1115.79, -3080.97, 5.83),
}

Config.DropItems = {
    {name = 'ammo-9', amount = {min = 50, max = 100}},
    {name = 'WEAPON_ILLTITAN17', amount = {min = 1, max = 1}},
    {name = 'heavyarmor', amount = {min = 1, max = 3}},
}

Config.Peds = {
    SpawnNumbers = 10,
    SpawnInterval = {min = 1, max = 2}, --  min
    LootChance = 50,
    Loots = {
        {name = 'weapon_bat', amount = {min = 1, max = 1}},
        {name = 'sprunk', amount = {min = 1, max = 2}},
        {name = 'burger', amount = {min = 1, max = 2}},
        {name = 'weapon_hatchet', amount = {min = 1, max = 1}},
        {name = 'bandage', amount = {min = 1, max = 1}},
        {name = 'ammo-9', amount = {min = 1, max = 30}},
    },
    Weapons = {
        "weapon_bat",
        "weapon_hammer",
        "weapon_knife",
        "weapon_pistol",
        "weapon_microsmg",
        "weapon_crowbar",
        "weapon_hatchet",
        "weapon_machete",
        "weapon_wrench",
        "weapon_battleaxe",
        "weapon_golfclub",
    },
    Models = {
        "a_f_y_business_04",
        "a_f_o_indian_01",
        "a_f_y_tourist_01",
        "a_m_m_beach_01",
        "a_m_m_hasjew_01",
        "a_m_m_soucent_01",
        "cs_orleans",
        "u_m_m_jesus_01",        
    },
}


Config.Plane = { -- Dont Touch
    Enable = false,
    Pilot = "s_m_m_pilot_02", 
    Model = "titan", 
    Height = 500.0, 
    Speed = 95.0, 
}

Config.CurrentPurge = { -- dont put anything or remove thnk you
    Active = false,
    Dropped = false,
    KillScores = {},
    StoredItems = {},
} 