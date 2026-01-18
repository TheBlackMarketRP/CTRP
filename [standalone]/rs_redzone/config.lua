Config = {} 

Config.Debug = false

Config.Inventory = 'ox' -- ox = Ox inventory, esx = ESX inventory, codem = CodeM inventory
Config.Notify = 'okok'



Config.ZoneSeries = {
    ['mirroroarktrain'] = {
        ChangeInternal = 10, 
        ActiveZoneCount = 1, 
        ['sandy_motel'] = {
            ZoneGun = "WEAPON_ZETA_19_CHR",
            ZoneAmmo = "ammo-9",
            Items = {
                -- {item = 'ev_coin', count = math.random(75,155), chance = 50},
                -- {item = 'vipcoin', count = math.random(10,25), chance = 15},
                {item = 'money', count = math.random(400,500), chance = 100},
            },
            Zone = {
                coords = vector3(1167.48, -405.71, 67.66), 
                radius = 40,
                rspoints = {
                    vector3(1214.36, -408.38, 68.04),
                    vector3(1161.45, -360.95, 67.54),
                    vector3(1127.94, -398.28, 67.14),
                    vector3(1134.94, -430.55, 66.48),
                },
            },
            Blip = {
                color = 1,
            }
        },
         ['megamall'] = {
            ZoneGun = "WEAPON_R90",
            ZoneAmmo = "ammo-rifle",
            Items = {
                -- {item = 'weapon_pistol', count = math.random(1,3), chance = 50},
                -- {item = 'weapon_pistolmk2', count = math.random(1,3), chance = 15},
                {item = 'money', count = math.random(500,500), chance = 100},
            },
            Zone = {
                coords = vector3(65.45, -1587.81, 29.51), 
                radius = 60,
                rspoints = {
                    vector3(14.91, -1641.58, 29.3),
                    vector3(77.65, -1651.58, 29.34),
                    vector3(132.79, -1587.46, 29.32),
                    vector3(106.72, -1542.82, 29.38),
                    vector3(27.85, -1540.88, 29.34),
                },
            },
            Blip = {
                color = 1,
            }
        },
        ['sandy_scrap'] = {
            ZoneGun = "WEAPON_R90",
            ZoneAmmo = "ammo-rifle",
            Items = {
                -- {item = 'ev_coin', count = math.random(75,155), chance = 50},
                -- {item = 'vipcoin', count = math.random(10,25), chance = 15},
                {item = 'money', count = math.random(500,500), chance = 100},
            },
            Zone = {
                coords = vector3(2380.3616, 3078.8875, 48.2546), 
                radius = 120,
                rspoints = {
                    vector3(2425.91, 3153.09, 48.23),
                    vector3(2505.25, 3062.12, 46.0),
                    vector3(2227.69, 2991.09, 46.58),
                },
            },
            Blip = {
                color = 1,
            }
        },
        ['step_city'] = {
            ZoneGun = "WEAPON_R90",
            ZoneAmmo = "ammo-rifle",
            Items = {
                -- {item = 'ev_coin', count = math.random(75,155), chance = 50},
                -- {item = 'vipcoin', count = math.random(10,25), chance = 15},
                {item = 'money', count = math.random(500,500), chance = 100},
            },
            Zone = {
                coords = vector3(55.8053, 3708.0964, 39.7546), 
                radius = 120,
                rspoints = {
                    vector3(-83.17, 3735.4, 31.65),
                    vector3(158.06, 3591.48, 31.99),
                },
            },
            Blip = {
                color = 1,
            }
        },
    },
}

-- Notification settings
Config.Notifications = {
    enter = "You entered the ~r~Redzone~w~!",
    exit = "You left ~r~Redzone~w~!",
    kill_reward = "You received a kill reward in redzone!",
    zone_change = "Redzones have changed! Check the map",
}

-- Blip settings
Config.BlipSettings = {
    sprite = 84,
    scale = 0.8,
    alpha = 200,
    name = "Redzone"
}



function ShowNotification(message)
    if Config.Notify == 'ox' then
            lib.notify({
                title = 'RedZone',
                description = message,
                type = 'infom',
                showDuration = true,
                duration = 3000,
            })
        elseif Config.Notify == 'esx' then
            ESX.ShowNotification("RedZone", "info", 3000, message, "top-left")
        elseif Config.Notify == 'okok' then
            exports['okokNotify']:Alert('RedZone', message, 3000, 'info', true)
        elseif Config.Notify == 'custom' then
            -- Custom notify code
    else
        SetNotificationTextEntry("STRING")
        AddTextComponentString(message)
        DrawNotification(false, false)
    end
end