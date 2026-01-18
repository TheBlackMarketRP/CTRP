Config = {}
Config.Locale = 'en'

Config.WashAll = true           -- if disabled, it will wash 1 marked bill at a time
Config.RemoveOnUse = false      -- you will not get back your laundrycard if enabled
Config.WashTimeMultiplier = 1  -- 30 sec per 10k
Config.WashingTax = 0.80        -- player will get 80% money
Config.WaitAfterWash = 0.30        -- minutes (this is also the cooldown time, you can't disable cooldown)

Config.Item = 'markedbills'
Config.HasMetaData = false --if you are using any different item then make it false

Config.Keys = {
    [1] = 38, --E
    [2] = 74, --H
}

Config.LoadDistance = 10.0

Config.LaundryPlaces = {
    [1] = {
        pos = vector3(1644.58, 3652.55, 35.02), -- marker position
        machine = {
            pos = vector4(1643.74, 3652.15, 34.01, 120.0),
            state = 1,
        }
    },
    [2] = {
        pos = vector3(1645.35, 3651.41, 35.02),
        machine = {
            pos = vector4(1644.46, 3650.92, 34.01, 120.0),
            state = 1,
        }
    },
    [3] = {
        pos = vector3(1646.08, 3650.12, 35.02),
        machine = {
            pos = vector4(1645.2, 3649.68, 34.01, 120.0),
            state = 1,
        }
    },
    [4] = {
        pos = vector3(1646.8, 3648.94, 35.02),
        machine = {
            pos = vector4(1645.93, 3648.42, 34.01, 120.0),
            state = 1,
        }
    },
    [5] = {
        pos = vector3(1647.43, 3647.67, 35.02),
        machine = {
            pos = vector4(1646.64, 3647.19, 34.01, 120.0),
            state = 1,
        }
    },
    [6] = {
        pos = vector3(1648.2, 3646.44, 35.02),
        machine = {
            pos = vector4(1647.36, 3645.95, 34.01, 120.0),
            state = 1,
        }
    },
    [7] = {
        pos = vector3(1648.9, 3645.18, 35.02),
        machine = {
            pos = vector4(1648.07, 3644.71, 34.01, 120.0),
            state = 1,
        }
    },
}

Config.Blips = {
    {enable = true, pos = vector3(1643.86, 3660.76, 34.93), name = 'Money Wash', sprite = 207, size = 1.0, color = 1}, -- to disable blip, remove this line or make enable = false
}

Config.Teleports = {
    -- ['Money Wash'] = {enter = vector3(255.76, 274.29, 105.81), exit = vector3(1138.05, -3199.19, -39.67)},
}

Config.Props = {
    [1] = `bkr_prop_prtmachine_dryer`,
    [2] = `bkr_prop_prtmachine_dryer_op`,
    [3] = `bkr_prop_prtmachine_dryer_spin`,
}