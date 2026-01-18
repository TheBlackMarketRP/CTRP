Config = {
    Core = 'qb-core',  
    Target = 'qb-target',  
    Menu = 'qb-menu', 
    Dispatch = 'ps-dispatch',
}


Config.LaptopModel = 'gr_prop_gr_laptop_01a'
Config.PrinterModel = 'prop_printer_01'
Config.GeniModel = 'prop_generator_01a'
Config.ScannerModel = 'v_res_ipoddock'

Config.AtmFraud = true 
Config.AtmFraudReward = {min = 5000, max = 30000}
Config.LoseCardChance = 20
Config.AtmMiniGame = {Circles = 2, Time = 10}
Config.AtmModels = {
    'prop_atm_03',
    'prop_fleeca_atm',
    'prop_atm_01',
    'prop_atm_02',
}

Config.FakeCardItem = 'clonedcard'

Config.Zones = {
    -- {
    --     Zone = {
    --         Coords = vector3(373.15, 328.86, 103.57),
    --         Heading = 0,
    --         Length = 1.5,
    --         Width = 1.5,
    --         MinZ = 102.0,
    --         MaxZ = 105.0,
    --     },
    --     Rewards = {
            
    --     },
    --     MiniGame = {
    --         Circles = 3,
    --         Time = 15,
    --     },
    --     Used = false, -- Don't Touch This --
    -- },
    -- {
    --     Zone = {
    --         Coords = vector3(372.49, 326.4, 103.57),
    --         Heading = 0,
    --         Length = 1.5,
    --         Width = 1.5,
    --         MinZ = 102.0,
    --         MaxZ = 105.0,
    --     },
    --     Rewards = {
            
    --     },
    --     MiniGame = {
    --         Circles = 5,
    --         Time = 8,
    --     },
    --     Used = false, -- Don't Touch This --
    -- },
}

Config.Buyer = {
    Coords = vector4(1689.35, 3291.69, 40.15, 210.7),
    MoneyType = 'cash',
    Blip = {
        Enabled = false,
        Icon = 500,
        Color = 2,
        Size = 0.9,
        Legend = "Buyer",
    },
    Items = {
        laptop = 200,
        tablet = 300,
        fitbit = 400,
        phone = 100,
    },
}

Config.ChequeFraudSuccessChance = 30
Config.ChequeReward = {min = 5000, max = 50000}
Config.Banker = {
    Coords = vector4(-170.53, 6329.0, 31.62, 315.96-1),
    Blip = {
        Enabled = true,
        Icon = 500,
        Color = 4,
        Size = 0.9,
        Legend = "Check Cashing",
    },
}

-- Don't Touch -- 
Config.AnimDir = 'move_weapon@jerrycan@generic'
Config.Animation = 'idle'
Config.Prop = 'prop_shopping_bags02'
Config.Bone = 28422
