Config = {}
Config.Debug = false

----------------------------------------------------------------
-- CORE SETTINGS
----------------------------------------------------------------
Config.EnableMechanicProcess = false -- Set to true to enable the interactive installation process.
Config.RepairCostMultiplier = 3.5 -- Formula: (Total Damage / 2) * Multiplier
Config.LaborFee = 0.05 -- 5% labor fee on top of modification costs.

Config.Inventory = 'ox_inventory' -- ak47_qb_inventory, ox_inventory, qs-inventory, qb-inventory, qb-inventory-old, ps-inventory, codem-inventory, lj-inventory, origen_inventory, tgiann-inventory
Config.OwnedVehiclesTable = 'player_vehicles' --in database

Config.InvImgLink = "nui://ox_inventory/web/images/" -- ak47_qb_inventory
--[[
Config.InvImgLink = "nui://qb-inventory/html/images/"           -- qb-inventory
Config.InvImgLink = "nui://ps-inventory/html/images/"           -- ps-inventory
Config.InvImgLink = "nui://lj-inventory/html/images/"           -- lj-inventory
Config.InvImgLink = "nui://qs-inventory/html/images/"           -- qs-inventory
Config.InvImgLink = "nui://ox_inventory/web/images/"            -- ox_inventory
Config.InvImgLink = "nui://ak47_qb_inventory/web/build/images/" -- ak47_qb_inventory
]]

Config.SocietyInManagement = false --enable if your society is inside qb-management
Config.SocietyIncomePercentage = 100 --%

----------------------------------------------------------------
-- MECHANIC LOCATIONS
----------------------------------------------------------------
Config.MechanicLocations = {
    {
        name = "Bennys Original Motor Works", 
        coords = vector3(-211.8, -1323.5, 30.8),
        job = 'mechanic', -- set nil if job is not required, if job is set, money will be related with job society account
        grade = 0, -- minimum job grade
        discount = 100, -- set 0 if no discount for mechanic. 100 will stop the mechanic process
        blip = {id = 446, color = 24, scale = 0.6}, -- remove this line if you don't need any blip
    },
    {
        name = "BMC Auto Body1", 
        coords = vector3(1694.41, 3589.53, 35.62),
        job = 'bmc', -- set nil if job is not required, if job is set, money will be related with job society account
        grade = 0, -- minimum job grade
        discount = 100, -- set 0 if no discount for mechanic. 100 will stop the mechanic process
    },
    -- {
    --     name = "BMC Auto Body2", 
    --     coords = vector3(1970.85, 3841.4, 31.48),
    --     job = 'bmc', -- set nil if job is not required, if job is set, money will be related with job society account
    --     grade = 0, -- minimum job grade
    --     discount = 100, -- set 0 if no discount for mechanic. 100 will stop the mechanic process
    -- },
    {
        name = "PD", 
        coords = vector3(431.53, -984.47, 25.47),
        job = 'police', -- set nil if job is not required, if job is set, money will be related with job society account
        grade = 0, -- minimum job grade
        discount = 100, -- set 0 if no discount for mechanic. 100 will stop the mechanic process
    },
    {
        name = "kush1", 
        coords = vector3(1588.33, 3758.67, 36.75),
        job = 'kush', -- set nil if job is not required, if job is set, money will be related with job society account
        grade = 0, -- minimum job grade
        discount = 100, -- set 0 if no discount for mechanic. 100 will stop the mechanic process
    },
    {
        name = "kush2", 
        coords = vector3(1591.61, 3754.74, 36.75),
        job = 'kush', -- set nil if job is not required, if job is set, money will be related with job society account
        grade = 0, -- minimum job grade
        discount = 100, -- set 0 if no discount for mechanic. 100 will stop the mechanic process
    },
    {
        name = "kush3", 
        coords = vector3(1594.5, 3750.49, 36.75),
        job = 'kush', -- set nil if job is not required, if job is set, money will be related with job society account
        grade = 0, -- minimum job grade
        discount = 100, -- set 0 if no discount for mechanic. 100 will stop the mechanic process
    },
}

Config.MechanicJobs = {
    mechanic = true,
    police = true,
    bmc = true,
    kush = true,
}

----------------------------------------------------------------
-- PRICING MODEL
----------------------------------------------------------------
Config.UseVehiclePrice = false -- SET TO TRUE to use vehicle price for mod costs. SET TO FALSE to use the static prices defined below.

--[[
================================================================
== DYNAMIC PRICING (BASED ON VEHICLE PRICE)
================================================================
- This section is ONLY used if "Config.UseVehiclePrice" is TRUE.
- Prices are calculated as a percentage of the vehicle's dealership price from qb-core.
- For tiered upgrades (Engine, Brakes, etc.), you list the percentages for each level.
  - Example: Engine has 4 levels, so you provide 4 percentage values.
- For cosmetic upgrades (Spoilers, Bumpers, etc.), you provide a single percentage.
- A "Default" percentage is used for any category not specifically listed.
]]
Config.PricePercentages = {
    -- PERFORMANCE
    ["Engine"] = { 8, 10, 12, 14 }, -- Percentages for Level 1, 2, 3, 4
    ["Brakes"] = { 3, 4, 5 },
    ["Transmission"] = { 4, 5, 6 },
    ["Suspension"] = { 2, 3, 4, 5 },
    ["Armor"] = { 2.0, 4.0, 6.0, 8.0, 10.0 },
    ["Turbo"] = { 7.5 },

    -- COSMETICS (Single percentage value)
    ["Spoilers"] = 2,
    ["Front Bumper"] = 3,
    ["Rear Bumper"] = 3,
    ["Side Skirts"] = 2,
    ["Exhaust"] = 4,
    ["Grille"] = 2,
    ["Hood"] = 3,
    ["Fender"] = 3,
    ["Roof"] = 3,
    ["Wheels"] = 3,
    ["Liveries"] = 2,

    -- LIGHTS & NEONS
    ["Headlights"] = 3,
    ["Headlight Color"] = 1.5,
    ["Neon Kits"] = 2,
    ["Neon Color"] = 0.6,
    ["Interior Color"] = 0.8,

    -- MISC
    ["Window Tint"] = 0.4,
    ["Horns"] = 0.6,

    -- DEFAULT FALLBACK
    ["Default"] = 0.2 -- Used for any category not listed above (e.g., Trim, Dials, etc.)
}

Config.PricePercentagesColor = 1.5 -- All Paint
Config.PricePercentagesWheels = 1.0 -- All Wheels

----------------------------------------------------------------
-- REQUIRED ITEMS FOR MECHANIC PROCESS
----------------------------------------------------------------
Config.RequiredItems = {
    ["Engine"] = {
        {item = "engine", amount = 1, label = "Engine", remove = true}
    },
    ["Engine Block"] = {
        {item = "engine", amount = 1, label = "Engine", remove = true}
    },
    ["Brakes"] = {
        {item = "brakes", amount = 2, label = "Brakes", remove = true}
    },
    ["Suspension"] = {
        {item = "suspension", amount = 2, label = "Suspension", remove = true}
    },
    ["Armor"] = {
        {item = "armorkit", amount = 1, label = "Armor Kit", remove = true}
    },
    ["Turbo"] = {
        {item = "turbokit", amount = 1, label = "Turbo Kit", remove = true}
    },
    ["Spoilers"] = {
        {item = "spoiler", amount = 1, label = "Spoiler", remove = true}
    },
    ["Front Bumper"] = {
        {item = "bumper", amount = 1, label = "Bumper", remove = true}
    },
    ["Rear Bumper"] = {
        {item = "bumper", amount = 1, label = "Bumper", remove = true}
    },
    ["Exhaust"] = {
        {item = "exhaust", amount = 1, label = "Exhaust", remove = true}
    },
    ["Steering Wheels"] = {
        {item = "steeringwheel", amount = 1, label = "Steering Wheel", remove = true}
    },
    ["Seats"] = {
        {item = "seats", amount = 1, label = "Seats", remove = true}
    },
    ["Wheels"] = {
        {item = "wheels", amount = 1, label = "Wheels", remove = true}
    },
    ["Primary Color"] = {
        {item = "spraypaint", amount = 1, label = "Spray Paint", remove = true}
    },
    ["Secondary Color"] = {
        {item = "spraypaint", amount = 1, label = "Spray Paint", remove = true}
    },
    ["Pearlescent"] = {
        {item = "spraypaint", amount = 1, label = "Spray Paint", remove = true}
    },
    ["Wheel Color"] = {
        {item = "spraypaint", amount = 1, label = "Spray Paint", remove = true}
    },
    ["Interior Color"] = {
        {item = "spraypaint", amount = 1, label = "Spray Paint", remove = true}
    },
    ["Liveries"] = {
        {item = "spraypaint", amount = 1, label = "Spray Paint", remove = true}
    },
    ["Neon Kits"] = {
        {item = "neonkit", amount = 1, label = "Neon Kit", remove = true}
    },
    ["Default"] = {
        {item = "mechanictools", amount = 1, label = "Mechanic Tools", remove = false}
    }
}

----------------------------------------------------------------
-- PRICE MULTIPLIERS (FALLBACK)
-- These are ONLY used if "Config.UseVehiclePrice" is set to FALSE.
----------------------------------------------------------------
Config.PriceMultipliers = {
    ["Default"] = 1.0, -- Default for any category not listed below
    ["Engine"] = 1.2,
    ["Brakes"] = 1.0,
    ["Transmission"] = 1.1,
    ["Suspension"] = 1.0,
    ["Armor"] = 1.5,
    ["Turbo"] = 2.0,
    ["Spoilers"] = 0.8,
    ["Front Bumper"] = 1.0,
    ["Rear Bumper"] = 1.0,
    ["Side Skirts"] = 1.0,
    ["Exhaust"] = 1.1,
    ["Grille"] = 0.9,
    ["Hood"] = 1.0,
    ["Roof"] = 1.0,
    ["Liveries"] = 1.5,
    ["Wheels"] = 1.2,
    ["Tire Smoke"] = 1.2,
    ["Pearlescent"] = 1.3,
    ["Neon Kits"] = 1.2,
    ["Neon Color"] = 1.1,
    ["Headlight Color"] = 1.1,
    ["Interior Color"] = 1.1,
    ["Horns"] = 0.8
}

----------------------------------------------------------------
-- STATIC PRICES (FALLBACK)
-- These are ONLY used if "Config.UseVehiclePrice" is set to FALSE.
-- You can disable a mod by remove it from this list
----------------------------------------------------------------
Config.Currency = 'cash' -- 'cash', 'bank'
Config.StaticPrices = {
    -- == PERFORMANCE ==
    ["Engine"] = {
        Label = "Engine",
        ModId = 11,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = 0, name = "EMS Upgrade, Level 1", price = 1500},
            {id = 1, name = "EMS Upgrade, Level 2", price = 4000},
            {id = 2, name = "EMS Upgrade, Level 3", price = 7500},
            {id = 3, name = "EMS Upgrade, Level 4", price = 15000}
        }
    },
    ["Brakes"] = {
        Label = "Brakes",
        ModId = 12,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = 0, name = "Street Brakes", price = 1000},
            {id = 1, name = "Sport Brakes", price = 2200},
            {id = 2, name = "Race Brakes", price = 4500}
        }
    },
    ["Transmission"] = {
        Label = "Transmission",
        ModId = 13,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = 0, name = "Street Transmission", price = 3000},
            {id = 1, name = "Sport Transmission", price = 6500},
            {id = 2, name = "Race Transmission", price = 12000}
        }
    },
    ["Suspension"] = {
        Label = "Suspension",
        ModId = 15,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = 0, name = "Lowered Suspension", price = 1200},
            {id = 1, name = "Street Suspension", price = 2500},
            {id = 2, name = "Sport Suspension", price = 5000},
            {id = 3, name = "Competition Suspension", price = 8000}
        }
    },
    ["Armor"] = {
        Label = "Armor",
        ModId = 16,
        Data = {
            {id = -1, name = "No Armor", price = 0},
            {id = 0, name = "Armor Upgrade 20%", price = 2500},
            {id = 1, name = "Armor Upgrade 40%", price = 5000},
            {id = 2, name = "Armor Upgrade 60%", price = 8000},
            {id = 3, name = "Armor Upgrade 80%", price = 12000},
            {id = 4, name = "Armor Upgrade 100%", price = 20000}
        }
    },
    ["Turbo"] = {
        Label = "Turbo",
        ModId = 18,
        Data = {
            {id = -1, name = "No Turbo", price = 0},
            {id = 0, name = "Turbo Tuning", price = 10000}
        }
    },
    ["Nitrous"] = {
        Label = "Nitrous",
        ModId = 17,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = 'default', name = "Nitrous", price = 1500},
        }
    },
    -- == EXTERIOR & BODY ==
    ["Spoilers"] = {
        Label = "Spoilers",
        ModId = 0,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Spoiler", price = 750}
        }
    },
    ["Front Bumper"] = {
        Label = "Front Bumper",
        ModId = 1,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Bumper", price = 1200}
        }
    },
    ["Rear Bumper"] = {
        Label = "Rear Bumper",
        ModId = 2,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Bumper", price = 1200}
        }
    },
    ["Side Skirts"] = {
        Label = "Side Skirts",
        ModId = 3,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Skirts", price = 1000}
        }
    },
    ["Exhaust"] = {
        Label = "Exhaust",
        ModId = 4,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Exhaust", price = 1500}
        }
    },
    ["Grille"] = {
        Label = "Grille",
        ModId = 6,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Grille", price = 800}
        }
    },
    ["Hood"] = {
        Label = "Hood",
        ModId = 7,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Hood", price = 1200}
        }
    },
    ["Fender"] = {
        Label = "Fender",
        ModId = 8,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Fender", price = 1000}
        }
    },
    ["Right Fender"] = {
        Label = "Right Fender",
        ModId = 9,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Right Fender", price = 1000}
        }
    },
    ["Roof"] = {
        Label = "Roof",
        ModId = 10,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Roof", price = 1800}
        }
    },
    ["Frame"] = {
        Label = "Frame",
        ModId = 5,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Frame", price = 3500}
        }
    },
    ["Tank"] = {
        Label = "Tank",
        ModId = 45,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Tank", price = 1200}
        }
    },
    ["Aerials"] = {
        Label = "Aerials",
        ModId = 43,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Aerial", price = 800}
        }
    },
    ["Arch Cover"] = {
        Label = "Arch Cover",
        ModId = 42,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Arch Cover", price = 1500}
        }
    },
    ["Trunk"] = {
        Label = "Trunk",
        ModId = 37,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Trunk", price = 1500}
        }
    },
    ["Struts"] = {
        Label = "Struts",
        ModId = 41,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Struts", price = 2000}
        }
    },
    ["Sub Woofer"] = {
        Label = "Sub Woofer",
        ModId = 19,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Sub Woofer", price = 2000}
        }
    },
    -- == INTERIOR & ENGINE BAY ==
    ["Engine Block"] = {
        Label = "Engine Block",
        ModId = 39,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Engine Block", price = 1800}
        }
    },
    ["Air Filter"] = {
        Label = "Air Filter",
        ModId = 40,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Air Filter", price = 1200}
        }
    },
    ["Steering Wheels"] = {
        Label = "Steering Wheels",
        ModId = 33,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Wheel", price = 1500}
        }
    },
    ["Seats"] = {
        Label = "Seats",
        ModId = 32,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Seats", price = 2500}
        }
    },
    ["Dials"] = {
        Label = "Dials",
        ModId = 30,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Dials", price = 1200}
        }
    },
    ["Dashboard"] = {
        Label = "Dashboard",
        ModId = 29,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Dashboard", price = 1500}
        }
    },
    ["Trim Design"] = {
        Label = "Trim Design",
        ModId = 44,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Trim Design", price = 1500}
        }
    },
    ["Trim"] = {
        Label = "Trim",
        ModId = 27,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Trim", price = 1500}
        }
    },
    ["Ornaments"] = {
        Label = "Ornaments",
        ModId = 28,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Ornament", price = 800}
        }
    },
    ["Shift Levers"] = {
        Label = "Shift Levers",
        ModId = 34,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Shift Lever", price = 800}
        }
    },
    ["Speakers"] = {
        Label = "Speakers",
        ModId = 36,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Speakers", price = 1000}
        }
    },
    ["Door Speakers"] = {
        Label = "Door Speakers",
        ModId = 31,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Door Speaker", price = 800}
        }
    },
    ["Plaques"] = {
        Label = "Plaques",
        ModId = 35,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Plaques", price = 500}
        }
    },
    ["Hydraulics"] = {
        Label = "Hydraulics",
        ModId = 38,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Hydraulics", price = 7500}
        }
    },
    ["Hydraulics2"] = {
        Label = "Hydraulics2",
        ModId = 21,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Hydraulics2", price = 7500}
        }
    },
    -- ["Rear Wheels"] = {
    --     Label = "Rear Wheels",
    --     ModId = 24,
    --     Data = {
    --         {id = -1, name = "Stock", price = 0},
    --         {id = "default", name = "Rear Wheels", price = 7500}
    --     }
    -- },
    ["Door Left"] = {
        Label = "Door Left",
        ModId = 46,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Door Left", price = 7500}
        }
    },
    ["Door Right"] = {
        Label = "Door Right",
        ModId = 47,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Door Right", price = 7500}
        }
    },
    -- == WHEELS & TIRES ==
    ["Wheels"] = {
        Label = "Wheels",
        ModId = 23,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Wheels", price = 5000}
        }
    },
    ["Tire Smoke"] = {
        Label = "Tire Smoke",
        ModId = 20,
        Data = {
            {id = "custom", name = "Custom RGB Smoke", price = 2500},
            {id = "white", name = "White Smoke", price = 0, color = {255, 255, 255}},
            {id = "black", name = "Black Smoke", price = 1000, color = {1, 1, 1}},
            {id = "blue", name = "Blue Smoke", price = 1500, color = {24, 54, 163}},
            {id = "red", name = "Red Smoke", price = 1500, color = {244, 65, 65}},
            {id = "green", name = "Green Smoke", price = 1500, color = {22, 160, 22}},
            {id = "yellow", name = "Yellow Smoke", price = 1500, color = {255, 255, 0}},
            {id = "purple", name = "Purple Smoke", price = 1500, color = {128, 0, 128}},
            {id = "patriot", name = "Patriot Smoke", price = 5000, color = {255, 0, 0}}
        }
    },
    -- == PAINT & LIVERIES ==
    ["Primary Color"] = {
        Label = "Primary Color",
        Data = {
            {id = "custom", name = "Custom Color", price = 2000}
        }
    },
    ["Secondary Color"] = {
        Label = "Secondary Color",
        Data = {
            {id = "custom", name = "Custom Color", price = 2000}
        }
    },
    ["Pearlescent"] = {
        Label = "Pearlescent",
        Data = {
            {id = "custom", name = "Custom Color", price = 2500},
            {id = -1, name = "No Pearlescent", price = 0}
        }
    },
    ["Wheel Color"] = {
        Label = "Wheel Color",
        Data = {
            {id = 156, name = "Default Alloy", price = 0}
        }
    },
    ["Interior Color"] = {
        Label = "Interior Color",
        Data = {
            {id = "custom", name = "Custom Color", price = 1500}
        }
    },
    ["Liveries"] = {
        Label = "Liveries",
        ModId = 48,
        Data = {
            {id = -1, name = "No Livery", price = 0},
            {id = "default", name = "Livery", price = 2500}
        }
    },
    -- == LIGHTS & NEONS ==
    ["Headlights"] = {
        Label = "Headlights",
        ModId = 22,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = 0, name = "Xenon Headlights", price = 3000}
        }
    },
    ["Headlight Color"] = {
        Label = "Headlight Color",
        Data = {
            {id = -1, name = "Default", price = 0},
            {id = 0, name = "White", price = 1000},
            {id = 1, name = "Blue", price = 1000},
            {id = 2, name = "Electric Blue", price = 1000},
            {id = 3, name = "Mint Green", price = 1000},
            {id = 4, name = "Lime Green", price = 1000},
            {id = 5, name = "Yellow", price = 1000},
            {id = 6, name = "Golden Shower", price = 1000},
            {id = 7, name = "Orange", price = 1000},
            {id = 8, name = "Red", price = 1000},
            {id = 9, name = "Pony Pink", price = 1000},
            {id = 10, name = "Hot Pink", price = 1000},
            {id = 11, name = "Purple", price = 1000},
            {id = 12, name = "Blacklight", price = 1000}
        }
    },
    ["Neon Kits"] = {
        Label = "Neon Kits",
        Data = {
            {id = -1, name = "No Neons", price = 0},
            {id = 0, name = "Front & Back", price = 4000},
            {id = 1, name = "Left & Right", price = 4000},
            {id = 2, name = "Full Layout", price = 7500}
        }
    },
    ["Neon Color"] = {
        Label = "Neon Color",
        Data = {
            {id = {0, 0, 0}, name = "Stock (Black)", price = 0},
            {id = "custom", name = "Custom Color", price = 2000},
            {id = {255, 255, 255}, name = "White", price = 1000},
            {id = {2, 21, 255}, name = "Blue", price = 1500},
            {id = {94, 255, 1}, name = "Lime Green", price = 1500},
            {id = {255, 0, 0}, name = "Red", price = 1500},
            {id = {255, 5, 190}, name = "Hot Pink", price = 1500}
        }
    },
    ["Light Bar"] = {
        Label = "Light Bar",
        ModId = 49,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Light Bar", price = 3000}
        }
    },
    -- == MISCELLANEOUS ==
    ["Extras"] = {
        Label = "Extras",
        ModId = 99,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Extra", price = 500}
        }
    },
    ["Window Tint"] = {
        Label = "Window Tint",
        Data = {
            {id = 0, name = "No Tint", price = 0},
            {id = 5, name = "Limo", price = 500},
            {id = 3, name = "Light Smoke", price = 800},
            {id = 2, name = "Dark Smoke", price = 800},
            {id = 1, name = "Pure Black", price = 1200},
            {id = 6, name = "Green", price = 1200},
        }
    },
    ["License Plate"] = {
        Label = "License Plate",
        Data = {
            {id = 0, name = "Blue on White 1", price = 200},
            {id = 3, name = "Yellow on White 2", price = 200},
            {id = 4, name = "Yellow on Black", price = 200},
            {id = 2, name = "Yellow on Blue", price = 200},
            {id = 1, name = "Yellow on Black", price = 500},
            {id = 5, name = "North Yankton", price = 500},
        }
    },
    ["Plate Holder"] = {
        Label = "Plate Holder",
        ModId = 25,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Plate Holder", price = 500}
        }
    },
    ["Vanity Plates"] = {
        Label = "Vanity Plates",
        ModId = 26,
        Data = {
            {id = -1, name = "Stock", price = 0},
            {id = "default", name = "Vanity Plate", price = 800}
        }
    },
    ["Horns"] = {
        Label = "Horns",
        ModId = 14,
        Data = {
            {id = -1, name = "Stock Horn", price = 0},
            {id = 0, name = "Truck Horn", price = 1000},
            {id = 1, name = "Cop Horn", price = 1200},
            {id = 2, name = "Clown Horn", price = 1500},
            {id = 3, name = "Musical Horn 1", price = 2500},
            {id = 4, name = "Musical Horn 2", price = 2500},
            {id = 5, name = "Musical Horn 3", price = 3000},
            {id = 6, name = "Musical Horn 4", price = 3000},
            {id = 7, name = "Musical Horn 5", price = 3000},
            {id = 8, name = "Sadtrombone Horn", price = 3000},
            {id = 9, name = "Calssical Horn 1", price = 3000},
            {id = 10, name = "Calssical Horn 2", price = 3000},
            {id = 11, name = "Calssical Horn 3", price = 3000},
            {id = 12, name = "Calssical Horn 4", price = 3000},
            {id = 13, name = "Calssical Horn 5", price = 3000},
            {id = 14, name = "Calssical Horn 6", price = 3000},
            {id = 15, name = "Calssical Horn 7", price = 3000},
            {id = 16, name = "Scaledo Horn", price = 3000},
            {id = 17, name = "Scalere Horn", price = 3000},
            {id = 18, name = "Scalemi Horn", price = 3000},
            {id = 19, name = "Scalefa Horn", price = 3000},
            {id = 20, name = "Scalesol Horn", price = 3000},
            {id = 21, name = "Scalela Horn", price = 3000},
            {id = 22, name = "Scaleti Horn", price = 3000},
            {id = 23, name = "Scaledo Horn High", price = 3000},
            {id = 25, name = "Jazz Horn 1", price = 3000},
            {id = 26, name = "Jazz Horn 2", price = 3000},
            {id = 27, name = "Jazz Horn 3", price = 3000},
            {id = 28, name = "Jazzloop Horn", price = 3000},
            {id = 29, name = "Starspangban Horn 1", price = 3000},
            {id = 30, name = "Starspangban Horn 2", price = 3000},
            {id = 31, name = "Starspangban Horn 3", price = 3000},
            {id = 32, name = "Starspangban Horn 4", price = 3000},
            {id = 33, name = "Classicalloop Horn 1", price = 3000},
            {id = 34, name = "Classicalloop Horn 2", price = 3000},
            {id = 35, name = "Classicalloop Horn 3", price = 3000}
        }
    }
}

-- change key name if you want to translate
--[[
    ["Custom Name"] = {
        {name = "Black", id = 0, price = 500},
]]
Config.MetallicText = 'Metallic' -- change this if you translate Metallic in Config.ColorData
Config.ColorData = {
    Classic = {
        {name = "Black", id = 0, price = 500},
        {name = "Carbon Black", id = 147, price = 750},
        {name = "Graphite", id = 1, price = 500},
        {name = "Anhracite Black", id = 11, price = 500},
        {name = "Black Steel", id = 2, price = 600},
        {name = "Dark Steel", id = 3, price = 600},
        {name = "Silver", id = 4, price = 500},
        {name = "Bluish Silver", id = 5, price = 500},
        {name = "Rolled Steel", id = 6, price = 600},
        {name = "Shadow Silver", id = 7, price = 500},
        {name = "Stone Silver", id = 8, price = 500},
        {name = "Midnight Silver", id = 9, price = 500},
        {name = "Cast Iron Silver", id = 10, price = 600},
        {name = "Red", id = 27, price = 500},
        {name = "Torino Red", id = 28, price = 500},
        {name = "Formula Red", id = 29, price = 500},
        {name = "Lava Red", id = 150, price = 750},
        {name = "Blaze Red", id = 30, price = 500},
        {name = "Grace Red", id = 31, price = 500},
        {name = "Garnet Red", id = 32, price = 500},
        {name = "Sunset Red", id = 33, price = 500},
        {name = "Cabernet Red", id = 34, price = 600},
        {name = "Wine Red", id = 143, price = 750},
        {name = "Candy Red", id = 35, price = 750},
        {name = "Hot Pink", id = 135, price = 1000},
        {name = "Pfister Pink", id = 137, price = 1000},
        {name = "Salmon Pink", id = 136, price = 500},
        {name = "Sunrise Orange", id = 36, price = 500},
        {name = "Orange", id = 38, price = 500},
        {name = "Bright Orange", id = 138, price = 500},
        {name = "Bronze", id = 90, price = 1500},
        {name = "Yellow", id = 88, price = 500},
        {name = "Race Yellow", id = 89, price = 500},
        {name = "Dew Yellow", id = 91, price = 500},
        {name = "Dark Green", id = 49, price = 500},
        {name = "Racing Green", id = 50, price = 600},
        {name = "Sea Green", id = 51, price = 500},
        {name = "Olive Green", id = 52, price = 600},
        {name = "Bright Green", id = 53, price = 500},
        {name = "Gasoline Green", id = 54, price = 750},
        {name = "Lime Green", id = 92, price = 750},
        {name = "Midnight Blue", id = 141, price = 600},
        {name = "Galaxy Blue", id = 61, price = 500},
        {name = "Dark Blue", id = 62, price = 500},
        {name = "Saxon Blue", id = 63, price = 500},
        {name = "Blue", id = 64, price = 500},
        {name = "Mariner Blue", id = 65, price = 500},
        {name = "Harbor Blue", id = 66, price = 500},
        {name = "Diamond Blue", id = 67, price = 500},
        {name = "Surf Blue", id = 68, price = 500},
        {name = "Nautical Blue", id = 69, price = 500},
        {name = "Racing Blue", id = 73, price = 600},
        {name = "Ultra Blue", id = 70, price = 600},
        {name = "Light Blue", id = 74, price = 500},
        {name = "Chocolate Brown", id = 96, price = 500},
        {name = "Bison Brown", id = 101, price = 500},
        {name = "Creek Brown", id = 95, price = 500},
        {name = "Feltzer Brown", id = 94, price = 500},
        {name = "Maple Brown", id = 97, price = 500},
        {name = "Beechwood Brown", id = 103, price = 500},
        {name = "Sienna Brown", id = 104, price = 500},
        {name = "Saddle Brown", id = 98, price = 500},
        {name = "Moss Brown", id = 100, price = 500},
        {name = "Woodbeech Brown", id = 102, price = 500},
        {name = "Straw Brown", id = 99, price = 500},
        {name = "Sandy Brown", id = 105, price = 500},
        {name = "Bleached Brown", id = 106, price = 500},
        {name = "Schafter Purple", id = 71, price = 600},
        {name = "Spinnaker Purple", id = 72, price = 600},
        {name = "Midnight Purple", id = 142, price = 750},
        {name = "Bright Purple", id = 145, price = 750},
        {name = "Cream", id = 107, price = 500},
        {name = "Ice White", id = 111, price = 600},
        {name = "Frost White", id = 112, price = 600}
    },
    Metallic = {
        {name = "Black", id = 0, price = 500},
        {name = "Carbon Black", id = 147, price = 750},
        {name = "Graphite", id = 1, price = 500},
        {name = "Anhracite Black", id = 11, price = 500},
        {name = "Black Steel", id = 2, price = 600},
        {name = "Dark Steel", id = 3, price = 600},
        {name = "Silver", id = 4, price = 500},
        {name = "Bluish Silver", id = 5, price = 500},
        {name = "Rolled Steel", id = 6, price = 600},
        {name = "Shadow Silver", id = 7, price = 500},
        {name = "Stone Silver", id = 8, price = 500},
        {name = "Midnight Silver", id = 9, price = 500},
        {name = "Cast Iron Silver", id = 10, price = 600},
        {name = "Red", id = 27, price = 500},
        {name = "Torino Red", id = 28, price = 500},
        {name = "Formula Red", id = 29, price = 500},
        {name = "Lava Red", id = 150, price = 750},
        {name = "Blaze Red", id = 30, price = 500},
        {name = "Grace Red", id = 31, price = 500},
        {name = "Garnet Red", id = 32, price = 500},
        {name = "Sunset Red", id = 33, price = 500},
        {name = "Cabernet Red", id = 34, price = 600},
        {name = "Wine Red", id = 143, price = 750},
        {name = "Candy Red", id = 35, price = 750},
        {name = "Hot Pink", id = 135, price = 1000},
        {name = "Pfister Pink", id = 137, price = 1000},
        {name = "Salmon Pink", id = 136, price = 500},
        {name = "Sunrise Orange", id = 36, price = 500},
        {name = "Orange", id = 38, price = 500},
        {name = "Bright Orange", id = 138, price = 500},
        {name = "Bronze", id = 90, price = 1500},
        {name = "Yellow", id = 88, price = 500},
        {name = "Race Yellow", id = 89, price = 500},
        {name = "Dew Yellow", id = 91, price = 500},
        {name = "Dark Green", id = 49, price = 500},
        {name = "Racing Green", id = 50, price = 600},
        {name = "Sea Green", id = 51, price = 500},
        {name = "Olive Green", id = 52, price = 600},
        {name = "Bright Green", id = 53, price = 500},
        {name = "Gasoline Green", id = 54, price = 750},
        {name = "Lime Green", id = 92, price = 750},
        {name = "Midnight Blue", id = 141, price = 600},
        {name = "Galaxy Blue", id = 61, price = 500},
        {name = "Dark Blue", id = 62, price = 500},
        {name = "Saxon Blue", id = 63, price = 500},
        {name = "Blue", id = 64, price = 500},
        {name = "Mariner Blue", id = 65, price = 500},
        {name = "Harbor Blue", id = 66, price = 500},
        {name = "Diamond Blue", id = 67, price = 500},
        {name = "Surf Blue", id = 68, price = 500},
        {name = "Nautical Blue", id = 69, price = 500},
        {name = "Racing Blue", id = 73, price = 600},
        {name = "Ultra Blue", id = 70, price = 600},
        {name = "Light Blue", id = 74, price = 500},
        {name = "Chocolate Brown", id = 96, price = 500},
        {name = "Bison Brown", id = 101, price = 500},
        {name = "Creek Brown", id = 95, price = 500},
        {name = "Feltzer Brown", id = 94, price = 500},
        {name = "Maple Brown", id = 97, price = 500},
        {name = "Beechwood Brown", id = 103, price = 500},
        {name = "Sienna Brown", id = 104, price = 500},
        {name = "Saddle Brown", id = 98, price = 500},
        {name = "Moss Brown", id = 100, price = 500},
        {name = "Woodbeech Brown", id = 102, price = 500},
        {name = "Straw Brown", id = 99, price = 500},
        {name = "Sandy Brown", id = 105, price = 500},
        {name = "Bleached Brown", id = 106, price = 500},
        {name = "Schafter Purple", id = 71, price = 600},
        {name = "Spinnaker Purple", id = 72, price = 600},
        {name = "Midnight Purple", id = 142, price = 750},
        {name = "Bright Purple", id = 145, price = 750},
        {name = "Cream", id = 107, price = 500},
        {name = "Ice White", id = 111, price = 600},
        {name = "Frost White", id = 112, price = 600}
    },
    Matte = {
        {name = "Black", id = 12, price = 1000},
        {name = "Gray", id = 13, price = 1000},
        {name = "Light Gray", id = 14, price = 1000},
        {name = "Ice White", id = 131, price = 1200},
        {name = "Blue", id = 83, price = 1000},
        {name = "Dark Blue", id = 82, price = 1000},
        {name = "Midnight Blue", id = 84, price = 1200},
        {name = "Midnight Purple", id = 149, price = 1200},
        {name = "Schafter Purple", id = 148, price = 1200},
        {name = "Red", id = 39, price = 1000},
        {name = "Dark Red", id = 40, price = 1000},
        {name = "Orange", id = 41, price = 1000},
        {name = "Yellow", id = 42, price = 1000},
        {name = "Lime Green", id = 55, price = 1200},
        {name = "Green", id = 128, price = 1000},
        {name = "Forest Green", id = 151, price = 1200},
        {name = "Foliage Green", id = 155, price = 1200},
        {name = "Olive Drab", id = 152, price = 1200},
        {name = "Dark Earth", id = 153, price = 1000},
        {name = "Desert Tan", id = 154, price = 1000}
    },
    Metals = {
        {name = "Brushed Steel", id = 117, price = 1500},
        {name = "Brushed Black Steel", id = 118, price = 1750},
        {name = "Brushed Aluminum", id = 119, price = 1500},
        {name = "Chrome", id = 120, price = 5000},
        {name = "Pure Gold", id = 158, price = 10000},
        {name = "Brushed Gold", id = 159, price = 8000}
    },
    Util = {
        {name = "Police Blue", id = 125, price = 800},
        {name = "Police Black", id = 126, price = 800},
        {name = "Ambulance White", id = 127, price = 800}
    },
    Worn = {
        {name = "Worn Black", id = 15, price = 400},
        {name = "Worn Graphite", id = 16, price = 400},
        {name = "Worn Silver", id = 17, price = 400},
        {name = "Worn Red", id = 46, price = 400},
        {name = "Worn Blue", id = 80, price = 400},
        {name = "Worn Brown", id = 108, price = 400}
    },
    Chameleon = {
        {name = "Monochrome", id = 161, price = 5000},
        {name = "Midnight Purple", id = 162, price = 5000},
        {name = "Dark Emerald", id = 163, price = 5000},
        {name = "Anodized Green", id = 164, price = 5000},
        {name = "Anodized Burgundy", id = 166, price = 5000},
        {name = "Red Orange Flip", id = 190, price = 5000},
        {name = "Turq Purp Flip", id = 178, price = 5000},
        {name = "Magen Cyan Flip", id = 187, price = 5000},
        {name = "Purp Green Flip", id = 183, price = 5000},
        {name = "Black Prisma", id = 218, price = 5000},
        {name = "Ykta Christmas", id = 237, price = 5000},
        {name = "Ykta Nite Day", id = 224, price = 5000},
        {name = "Ykta Four Seaso", id = 229, price = 5000},
        {name = "Cream Pearl", id = 210, price = 5000},
        {name = "Red Prisma", id = 216, price = 5000},
        {name = "Green Blue Flip", id = 171, price = 5000},
        {name = "Ykta Monochrome", id = 223, price = 5000},
        {name = "Ykta The Seven", id = 234, price = 5000},
        {name = "Rainbow Prisma", id = 220, price = 5000},
        {name = "Orang Blue Flip", id = 192, price = 5000},
        {name = "Darktealpearl", id = 197, price = 5000},
        {name = "Ykta Verlierer2", id = 225, price = 5000},
        {name = "Oil Slic Prisma", id = 219, price = 5000},
        {name = "Ykta M9 Throwba", id = 230, price = 5000},
        {name = "Ykta Fubuki", id = 242, price = 5000},
        {name = "Darkbluepearl", id = 198, price = 5000},
        {name = "White Holo", id = 222, price = 5000},
        {name = "Anod Bronze", id = 168, price = 5000},
        {name = "Lit Blue Pearl", id = 202, price = 5000},
        {name = "Green Purp Flip", id = 175, price = 5000},
        {name = "Green Turq Flip", id = 174, price = 5000},
        {name = "Blue Green Flip", id = 181, price = 5000},
        {name = "Lit Purp Pearl", id = 203, price = 5000},
        {name = "Lit Pink Pearl", id = 204, price = 5000},
        {name = "Green Brow Flip", id = 173, price = 5000},
        {name = "Ykta Electro", id = 240, price = 5000},
        {name = "Teal Purp Flip", id = 176, price = 5000},
        {name = "Green Prisma", id = 217, price = 5000},
        {name = "Ykta Synthwave", id = 228, price = 5000},
        {name = "Blue Pearl", id = 209, price = 5000},
        {name = "Yellow Pearl", id = 207, price = 5000},
        {name = "Darkblueprisma", id = 213, price = 5000},
        {name = "Oil Slick Pearl", id = 200, price = 5000},
        {name = "Darkgreenpearl", id = 196, price = 5000},
        {name = "Anod Copper", id = 167, price = 5000},
        {name = "Green Pearl", id = 208, price = 5000},
        {name = "Orang Purp Flip", id = 191, price = 5000},
        {name = "Anod Gold", id = 170, price = 5000},
        {name = "Darkpurpprisma", id = 214, price = 5000},
        {name = "White Prisma", id = 211, price = 5000},
        {name = "Turq Red Flip", id = 177, price = 5000},
        {name = "Cyan Purp Flip", id = 179, price = 5000},
        {name = "Magen Oran Flip", id = 189, price = 5000},
        {name = "Magen Gree Flip", id = 184, price = 5000},
        {name = "Darkpurplepearl", id = 199, price = 5000},
        {name = "Ykta Full Rbow", id = 232, price = 5000},
        {name = "Anod Green", id = 165, price = 5000},
        {name = "Purp Red Flip", id = 182, price = 5000},
        {name = "White Purp Flip", id = 193, price = 5000},
        {name = "Hot Pink Prisma", id = 215, price = 5000},
        {name = "Ykta Bubblegum", id = 231, price = 5000},
        {name = "Magen Yell Flip", id = 185, price = 5000},
        {name = "Blue Pink Flip", id = 180, price = 5000},
        {name = "Burg Green Flip", id = 186, price = 5000},
        {name = "Lit Green Pearl", id = 201, price = 5000},
        {name = "Offwhite Prisma", id = 205, price = 5000},
        {name = "Red Rainbo Flip", id = 194, price = 5000},
        {name = "Coppe Purp Flip", id = 188, price = 5000},
        {name = "Ykta Hsw", id = 239, price = 5000},
        {name = "Anod Champagne", id = 169, price = 5000},
        {name = "Ykta Kamenrider", id = 235, price = 5000},
        {name = "Ykta Monika", id = 241, price = 5000},
        {name = "Ykta Sprunk Ex", id = 226, price = 5000},
        {name = "Ykta Vice City", id = 227, price = 5000},
        {name = "Black Holo", id = 221, price = 5000},
        {name = "Blu Rainbo Flip", id = 195, price = 5000},
        {name = "Graphite Prisma", id = 212, price = 5000},
        {name = "Green Red Flip", id = 172, price = 5000},
        {name = "Pink Pearl", id = 206, price = 5000},
        {name = "Ykta Sunsets", id = 233, price = 5000},
        {name = "Ykta Chromabera", id = 236, price = 5000},
        {name = "Ykta Temperatur", id = 238, price = 5000}
    }
}

-- only change if you translate Config.WheelData
Config.WheelTypes = {
    ["Sport"] = 0,
    ["Muscle"] = 1,
    ["Lowrider"] = 2,
    ["SUV"] = 3,
    ["Off-road"] = 4,
    ["Tuner"] = 5,
    ["Bike Wheels"] = 6,
    ["High End"] = 7,
    ["Benny's Original"] = 8,
    ["Benny's Bespoke"] = 9,
    ["Open Wheel"] = 10,
    ["Street"] = 11,
    ["Track"] = 12,
}

-- change key name if you want to translate
--[[
    ["Custom Name"] = {
        {name = "Stock", wtype = 6, mod = -1, price = 500},
]]
Config.WheelData = {
    ["Bike Wheels"] = {
        {name = "Stock", wtype = 6, mod = -1, price = 500},
        {name = "Speedway", wtype = 6, mod = 0, price = 1200},
        {name = "Streetspecial", wtype = 6, mod = 1, price = 1250},
        {name = "Racer", wtype = 6, mod = 2, price = 1300},
        {name = "Trackstar", wtype = 6, mod = 3, price = 1350},
        {name = "Overlord", wtype = 6, mod = 4, price = 1400},
        {name = "Trident", wtype = 6, mod = 5, price = 1450},
        {name = "Triplethreat", wtype = 6, mod = 6, price = 1500},
        {name = "Stilleto", wtype = 6, mod = 7, price = 1550},
        {name = "Wires", wtype = 6, mod = 8, price = 1600},
        {name = "Bobber", wtype = 6, mod = 9, price = 1650},
        {name = "Solidus", wtype = 6, mod = 10, price = 1700},
        {name = "Iceshield", wtype = 6, mod = 11, price = 1750},
        {name = "Loops", wtype = 6, mod = 12, price = 1800}
    },
    ["Sport"] = {
        {name = "Stock", wtype = 0, mod = -1, price = 500},
        {name = "Inferno", wtype = 0, mod = 0, price = 2500},
        {name = "Deepfive", wtype = 0, mod = 1, price = 2550},
        {name = "Lozspeed", wtype = 0, mod = 2, price = 2600},
        {name = "Diamondcut", wtype = 0, mod = 3, price = 2650},
        {name = "Chrono", wtype = 0, mod = 4, price = 2700},
        {name = "Feroccirr", wtype = 0, mod = 5, price = 2750},
        {name = "Fiftynine", wtype = 0, mod = 6, price = 2800},
        {name = "Mercie", wtype = 0, mod = 7, price = 2850},
        {name = "Syntheticz", wtype = 0, mod = 8, price = 2900},
        {name = "Organictyped", wtype = 0, mod = 9, price = 2950},
        {name = "Endov1", wtype = 0, mod = 10, price = 3000},
        {name = "Duper7", wtype = 0, mod = 11, price = 3050},
        {name = "Uzer", wtype = 0, mod = 12, price = 3100},
        {name = "Groundride", wtype = 0, mod = 13, price = 3150},
        {name = "Spacer", wtype = 0, mod = 14, price = 3200},
        {name = "Venum", wtype = 0, mod = 15, price = 3250},
        {name = "Cosmo", wtype = 0, mod = 16, price = 3300},
        {name = "Dashvip", wtype = 0, mod = 17, price = 3350},
        {name = "Icekid", wtype = 0, mod = 18, price = 3400},
        {name = "Ruffeld", wtype = 0, mod = 19, price = 3450},
        {name = "Wangenmaster", wtype = 0, mod = 20, price = 3500},
        {name = "Superfive", wtype = 0, mod = 21, price = 3550},
        {name = "Endov2", wtype = 0, mod = 22, price = 3600},
        {name = "Slitsix", wtype = 0, mod = 23, price = 3650}
    },
    ["SUV"] = {
        {name = "Stock", wtype = 3, mod = -1, price = 500},
        {name = "Vip", wtype = 3, mod = 0, price = 2800},
        {name = "Benefactor", wtype = 3, mod = 1, price = 2850},
        {name = "Cosmo", wtype = 3, mod = 2, price = 2900},
        {name = "Bippu", wtype = 3, mod = 3, price = 2950},
        {name = "Royalsix", wtype = 3, mod = 4, price = 3000},
        {name = "Fagorme", wtype = 3, mod = 5, price = 3050},
        {name = "Deluxe", wtype = 3, mod = 6, price = 3100},
        {name = "Icedout", wtype = 3, mod = 7, price = 3150},
        {name = "Cognscenti", wtype = 3, mod = 8, price = 3200},
        {name = "Lozspeedten", wtype = 3, mod = 9, price = 3250},
        {name = "Supernova", wtype = 3, mod = 10, price = 3300},
        {name = "Obeyrs", wtype = 3, mod = 11, price = 3350},
        {name = "Lozspeedballer", wtype = 3, mod = 12, price = 3400},
        {name = "Extra vaganzo", wtype = 3, mod = 13, price = 3450},
        {name = "Splitsix", wtype = 3, mod = 14, price = 3500},
        {name = "Empowered", wtype = 3, mod = 15, price = 3550},
        {name = "Sunrise", wtype = 3, mod = 16, price = 3600},
        {name = "Dashvip", wtype = 3, mod = 17, price = 3650},
        {name = "Cutter", wtype = 3, mod = 18, price = 3700}
    },
    ["Off-road"] = {
        {name = "Stock", wtype = 4, mod = -1, price = 500},
        {name = "Raider", wtype = 4, mod = 0, price = 2200},
        {name = "Mudslinger", wtype = 4, mod = 1, price = 2250},
        {name = "Nevis", wtype = 4, mod = 2, price = 2300},
        {name = "Cairngorm", wtype = 4, mod = 3, price = 2350},
        {name = "Amazon", wtype = 4, mod = 4, price = 2400},
        {name = "Challenger", wtype = 4, mod = 5, price = 2450},
        {name = "Dunebasher", wtype = 4, mod = 6, price = 2500},
        {name = "Fivestar", wtype = 4, mod = 7, price = 2550},
        {name = "Rockcrawler", wtype = 4, mod = 8, price = 2600},
        {name = "Milspecsteelie", wtype = 4, mod = 9, price = 2650}
    },
    ["Tuner"] = {
        {name = "Stock", wtype = 5, mod = -1, price = 500},
        {name = "Cosmo", wtype = 5, mod = 0, price = 3200},
        {name = "Supermesh", wtype = 5, mod = 1, price = 3250},
        {name = "Outsider", wtype = 5, mod = 2, price = 3300},
        {name = "Rollas", wtype = 5, mod = 3, price = 3350},
        {name = "Driffmeister", wtype = 5, mod = 4, price = 3400},
        {name = "Slicer", wtype = 5, mod = 5, price = 3450},
        {name = "Elquatro", wtype = 5, mod = 6, price = 3500},
        {name = "Dubbed", wtype = 5, mod = 7, price = 3550},
        {name = "Fivestar", wtype = 5, mod = 8, price = 3600},
        {name = "Slideways", wtype = 5, mod = 9, price = 3650},
        {name = "Apex", wtype = 5, mod = 10, price = 3700},
        {name = "Stancedeg", wtype = 5, mod = 11, price = 3750},
        {name = "Countersteer", wtype = 5, mod = 12, price = 3800},
        {name = "Endov1", wtype = 5, mod = 13, price = 3850},
        {name = "Endov2dish", wtype = 5, mod = 14, price = 3900},
        {name = "Guppez", wtype = 5, mod = 15, price = 3950},
        {name = "Chokadori", wtype = 5, mod = 16, price = 4000},
        {name = "Chicane", wtype = 5, mod = 17, price = 4050},
        {name = "Saisoku", wtype = 5, mod = 18, price = 4100},
        {name = "Dishedeight", wtype = 5, mod = 19, price = 4150},
        {name = "Fujiwara", wtype = 5, mod = 20, price = 4200},
        {name = "Zokusha", wtype = 5, mod = 21, price = 4250},
        {name = "Battlevill", wtype = 5, mod = 22, price = 4300},
        {name = "Rallymaster", wtype = 5, mod = 23, price = 4350}
    },
    ["High End"] = {
        {name = "Stock", wtype = 7, mod = -1, price = 500},
        {name = "Shadow", wtype = 7, mod = 0, price = 4500},
        {name = "Hyper", wtype = 7, mod = 1, price = 4550},
        {name = "Blade", wtype = 7, mod = 2, price = 4600},
        {name = "Diamond", wtype = 7, mod = 3, price = 4650},
        {name = "Supagee", wtype = 7, mod = 4, price = 4700},
        {name = "Chromaticz", wtype = 7, mod = 5, price = 4750},
        {name = "Merciechlip", wtype = 7, mod = 6, price = 4800},
        {name = "Obeyrs", wtype = 7, mod = 7, price = 4850},
        {name = "Gtchrome", wtype = 7, mod = 8, price = 4900},
        {name = "Cheetahr", wtype = 7, mod = 9, price = 4950},
        {name = "Solar", wtype = 7, mod = 10, price = 5000},
        {name = "Splitten", wtype = 7, mod = 11, price = 5050},
        {name = "Dashvip", wtype = 7, mod = 12, price = 5100},
        {name = "Lozspeedten", wtype = 7, mod = 13, price = 5150},
        {name = "Carboninferno", wtype = 7, mod = 14, price = 5200},
        {name = "Carbonshadow", wtype = 7, mod = 15, price = 5250},
        {name = "Carbonz", wtype = 7, mod = 16, price = 5300},
        {name = "Carbonsolar", wtype = 7, mod = 17, price = 5350},
        {name = "Carboncheetahr", wtype = 7, mod = 18, price = 5400},
        {name = "Carbonsracer", wtype = 7, mod = 19, price = 5450}
    },
    ["Lowrider"] = {
        {name = "Stock", wtype = 2, mod = -1, price = 500},
        {name = "Flare", wtype = 2, mod = 0, price = 1800},
        {name = "Wired", wtype = 2, mod = 1, price = 1850},
        {name = "Triplegolds", wtype = 2, mod = 2, price = 1900},
        {name = "Bigworm", wtype = 2, mod = 3, price = 1950},
        {name = "Sevenfives", wtype = 2, mod = 4, price = 2000},
        {name = "Splitsix", wtype = 2, mod = 5, price = 2050},
        {name = "Freshmesh", wtype = 2, mod = 6, price = 2100},
        {name = "Leadsled", wtype = 2, mod = 7, price = 2150},
        {name = "Turbine", wtype = 2, mod = 8, price = 2200},
        {name = "Superfin", wtype = 2, mod = 9, price = 2250},
        {name = "Classicrod", wtype = 2, mod = 10, price = 2300},
        {name = "Dollar", wtype = 2, mod = 11, price = 2350},
        {name = "Dukes", wtype = 2, mod = 12, price = 2400},
        {name = "Lowfive", wtype = 2, mod = 13, price = 2450},
        {name = "Gooch", wtype = 2, mod = 14, price = 2500}
    },
    ["Muscle"] = {
        {name = "Stock", wtype = 1, mod = -1, price = 500},
        {name = "Classicfive", wtype = 1, mod = 0, price = 1600},
        {name = "Dukes", wtype = 1, mod = 1, price = 1650},
        {name = "Musclefreak", wtype = 1, mod = 2, price = 1700},
        {name = "Kracka", wtype = 1, mod = 3, price = 1750},
        {name = "Azrea", wtype = 1, mod = 4, price = 1800},
        {name = "Mecha", wtype = 1, mod = 5, price = 1850},
        {name = "Blacktop", wtype = 1, mod = 6, price = 1900},
        {name = "Dragspl", wtype = 1, mod = 7, price = 1950},
        {name = "Revolver", wtype = 1, mod = 8, price = 2000},
        {name = "Classicrod", wtype = 1, mod = 9, price = 2050},
        {name = "Spooner", wtype = 1, mod = 10, price = 2100},
        {name = "Fivestar", wtype = 1, mod = 11, price = 2150},
        {name = "Oldschool", wtype = 1, mod = 12, price = 2200},
        {name = "Eljefe", wtype = 1, mod = 13, price = 2250},
        {name = "Dodman", wtype = 1, mod = 14, price = 2300},
        {name = "Sixgun", wtype = 1, mod = 15, price = 2350},
        {name = "Mercenary", wtype = 1, mod = 16, price = 2400}
    },
    ["Street"] = {
        {name = "Stock Wheels", wtype = 11, mod = -1, price = 1000},
        {name = "Retro Steelie", wtype = 11, mod = 0, price = 1000},
        {name = "Poverty Spec Steelie", wtype = 11, mod = 1, price = 1000},
        {name = "Concave Steelie", wtype = 11, mod = 2, price = 1000},
        {name = "Nebula", wtype = 11, mod = 3, price = 1000},
        {name = "Hotring Steelie", wtype = 11, mod = 4, price = 1000},
        {name = "Cup Champion", wtype = 11, mod = 6, price = 1000},
        {name = "Stanced EG Custom", wtype = 11, mod = 7, price = 1000},
        {name = "Kracka Custom", wtype = 11, mod = 8, price = 1000},
        {name = "Dukes Custom", wtype = 11, mod = 9, price = 1000},
        {name = "Endo v.3 Custom", wtype = 11, mod = 10, price = 1000},
        {name = "V8 Killer", wtype = 11, mod = 11, price = 1000},
        {name = "Fujiwara Custom", wtype = 11, mod = 12, price = 1000},
        {name = "Cosmo MKII", wtype = 11, mod = 13, price = 1000},
        {name = "Aero Star", wtype = 11, mod = 14, price = 1000},
        {name = "Hype Five", wtype = 11, mod = 15, price = 1000},
        {name = "Ruff Weld Mega Deep", wtype = 11, mod = 16, price = 1000},
        {name = "Mercy Concave", wtype = 11, mod = 17, price = 1000},
        {name = "Sugoi Concave", wtype = 11, mod = 18, price = 1000},
        {name = "Synthetic Z Concave", wtype = 11, mod = 19, price = 1000},
        {name = "Endo v.4 Dished", wtype = 11, mod = 20, price = 1000},
        {name = "Hyperfresh", wtype = 11, mod = 21, price = 1000},
        {name = "Truffade Concave", wtype = 11, mod = 22, price = 1000},
        {name = "Organic Type II", wtype = 11, mod = 23, price = 1000},
        {name = "Big Mamba", wtype = 11, mod = 24, price = 1000},
        {name = "Deep Flake", wtype = 11, mod = 25, price = 1000},
        {name = "Cosmo MKIII", wtype = 11, mod = 26, price = 1000},
        {name = "Concave Racer", wtype = 11, mod = 27, price = 1000},
        {name = "Deepflake Reverse", wtype = 11, mod = 28, price = 1000},
        {name = "Wild Wagon", wtype = 11, mod = 29, price = 1000},
        {name = "Concave Mega Mesh", wtype = 11, mod = 30, price = 1000}
    },
    ["Track"] = {
        {name = "Stock Wheels", wtype = 12, mod = -1, price = 1000},
        {name = "Rally Throwback", wtype = 12, mod = 0, price = 1000},
        {name = "Gravel Trap", wtype = 12, mod = 1, price = 1000},
        {name = "Stove Top", wtype = 12, mod = 2, price = 1000},
        {name = "Stove Top Mesh", wtype = 12, mod = 3, price = 1000},
        {name = "Retro 3 Piece", wtype = 12, mod = 4, price = 1000},
        {name = "Rally Monoblock", wtype = 12, mod = 5, price = 1000},
        {name = "Forged 5", wtype = 12, mod = 6, price = 1000},
        {name = "Split Star", wtype = 12, mod = 7, price = 1000},
        {name = "Speed Boy", wtype = 12, mod = 8, price = 1000},
        {name = "90s Running", wtype = 12, mod = 9, price = 1000},
        {name = "Tropos", wtype = 12, mod = 10, price = 1000},
        {name = "Exos", wtype = 12, mod = 11, price = 1000},
        {name = "High Five", wtype = 12, mod = 12, price = 1000},
        {name = "Super Lux", wtype = 12, mod = 13, price = 1000},
        {name = "Pure Business", wtype = 12, mod = 14, price = 1000},
        {name = "Pepper Pot", wtype = 12, mod = 15, price = 1000},
        {name = "Blacktop Blender", wtype = 12, mod = 16, price = 1000},
        {name = "Throwback", wtype = 12, mod = 17, price = 1000},
        {name = "Expressway", wtype = 12, mod = 18, price = 1000},
        {name = "Hidden Six", wtype = 12, mod = 19, price = 1000},
        {name = "Dinka SPL", wtype = 12, mod = 20, price = 1000},
        {name = "Retro Turbofan", wtype = 12, mod = 21, price = 1000},
        {name = "Conical Turbofan", wtype = 12, mod = 22, price = 1000},
        {name = "Ice Storm", wtype = 12, mod = 23, price = 1000},
        {name = "Super Turbine", wtype = 12, mod = 24, price = 1000},
        {name = "Modern Mesh", wtype = 12, mod = 25, price = 1000},
        {name = "Forged Star", wtype = 12, mod = 26, price = 1000},
        {name = "Showflake", wtype = 12, mod = 27, price = 1000},
        {name = "Giga Mesh", wtype = 12, mod = 28, price = 1000},
        {name = "Mesh Meister", wtype = 12, mod = 29, price = 1000}
    },
    ["Benny's Bespoke"] = {
        {name = "Stock Wheels", wtype = 9, mod = -1, price = 1000},
        {name = "Chrome OG Hunnets", wtype = 9, mod = 0, price = 1000},
        {name = "Gold OG Hunnets", wtype = 9, mod = 1, price = 1000},
        {name = "Chrome Wires", wtype = 9, mod = 2, price = 1000},
        {name = "Gold Wires", wtype = 9, mod = 3, price = 1000},
        {name = "Chrome Spoked Out", wtype = 9, mod = 4, price = 1000},
        {name = "Gold Spoked Out", wtype = 9, mod = 5, price = 1000},
        {name = "Chrome Knock-Offs", wtype = 9, mod = 6, price = 1000},
        {name = "Gold Knock-Offs", wtype = 9, mod = 7, price = 1000},
        {name = "Chrome Bigger Worm", wtype = 9, mod = 8, price = 1000},
        {name = "Gold Bigger Worm", wtype = 9, mod = 9, price = 1000},
        {name = "Chrome Vintage Wire", wtype = 9, mod = 10, price = 1000},
        {name = "Gold Vintage Wire", wtype = 9, mod = 11, price = 1000},
        {name = "Chrome Classic Wire", wtype = 9, mod = 12, price = 1000},
        {name = "Gold Classic Wire", wtype = 9, mod = 13, price = 1000},
        {name = "Chrome Smoothie", wtype = 9, mod = 14, price = 1000},
        {name = "Gold Smoothie", wtype = 9, mod = 15, price = 1000},
        {name = "Chrome Classic Rod", wtype = 9, mod = 16, price = 1000},
        {name = "Gold Classic Rod", wtype = 9, mod = 17, price = 1000},
        {name = "Chrome Dollar", wtype = 9, mod = 18, price = 1000},
        {name = "Gold Dollar", wtype = 9, mod = 19, price = 1000},
        {name = "Chrome Mighty Star", wtype = 9, mod = 20, price = 1000},
        {name = "Gold Mighty Star", wtype = 9, mod = 21, price = 1000},
        {name = "Chrome Decadent Dish", wtype = 9, mod = 22, price = 1000},
        {name = "Gold Decadent Dish", wtype = 9, mod = 23, price = 1000},
        {name = "Chrome Razor Style", wtype = 9, mod = 24, price = 1000},
        {name = "Gold Razor Style", wtype = 9, mod = 25, price = 1000},
        {name = "Chrome Celtic Knot", wtype = 9, mod = 26, price = 1000},
        {name = "Gold Celtic Knot", wtype = 9, mod = 27, price = 1000},
        {name = "Chrome Warrior Dish", wtype = 9, mod = 28, price = 1000},
        {name = "Gold Warrior Dish", wtype = 9, mod = 29, price = 1000},
        {name = "Gold Big Dog Spokes", wtype = 9, mod = 30, price = 1000}
    },
    ["Benny's Original"] = {
        {name = "Stock Wheels", wtype = 8, mod = -1, price = 1000},
        {name = "OG Hunnets", wtype = 8, mod = 0, price = 1000},
        {name = "OG Hunnets (Chrome Lip)", wtype = 8, mod = 1, price = 1000},
        {name = "Knock-Offs", wtype = 8, mod = 2, price = 1000},
        {name = "Knock-Offs (Chrome Lip)", wtype = 8, mod = 3, price = 1000},
        {name = "Spoked Out", wtype = 8, mod = 4, price = 1000},
        {name = "Spoked Out (Chrome Lip)", wtype = 8, mod = 5, price = 1000},
        {name = "Vintage Wire", wtype = 8, mod = 6, price = 1000},
        {name = "Vintage Wire (Chrome Lip)", wtype = 8, mod = 7, price = 1000},
        {name = "Smoothie", wtype = 8, mod = 8, price = 1000},
        {name = "Smoothie (Chrome Lip)", wtype = 8, mod = 9, price = 1000},
        {name = "Smoothie (Solid Color)", wtype = 8, mod = 10, price = 1000},
        {name = "Rod Me Up", wtype = 8, mod = 11, price = 1000},
        {name = "Rod Me Up (Chrome Lip)", wtype = 8, mod = 12, price = 1000},
        {name = "Rod Me Up (Solid Color)", wtype = 8, mod = 13, price = 1000},
        {name = "Clean", wtype = 8, mod = 14, price = 1000},
        {name = "Lotta Chrome", wtype = 8, mod = 15, price = 1000},
        {name = "Spindles", wtype = 8, mod = 16, price = 1000},
        {name = "Viking", wtype = 8, mod = 17, price = 1000},
        {name = "Triple Spoke", wtype = 8, mod = 18, price = 1000},
        {name = "Pharohe", wtype = 8, mod = 19, price = 1000},
        {name = "Tiger Style", wtype = 8, mod = 20, price = 1000},
        {name = "Free Wheelin", wtype = 8, mod = 21, price = 1000},
        {name = "Big Bar", wtype = 8, mod = 22, price = 1000},
        {name = "Biohazard", wtype = 8, mod = 23, price = 1000},
        {name = "Waves", wtype = 8, mod = 24, price = 1000},
        {name = "Lick Lick", wtype = 8, mod = 25, price = 1000},
        {name = "Spiralizer", wtype = 8, mod = 26, price = 1000},
        {name = "Hypnotics", wtype = 8, mod = 27, price = 1000},
        {name = "Psycho-Delic", wtype = 8, mod = 28, price = 1000},
        {name = "Half Cut", wtype = 8, mod = 29, price = 1000},
        {name = "Super Electric", wtype = 8, mod = 30, price = 1000}
    },
    ["Open Wheel"] = {
        {name = "Stock Wheels", wtype = 10, mod = -1, price = 1100},
        {name = "Classic 5", wtype = 10, mod = 0, price = 1000},
        {name = "Classic 5 (Stripped)", wtype = 10, mod = 1, price = 1000},
        {name = "Retro Star", wtype = 10, mod = 2, price = 1000},
        {name = "Retro Star (Stripped)", wtype = 10, mod = 3, price = 1000},
        {name = "Triplex", wtype = 10, mod = 4, price = 1000},
        {name = "Triplex (Stripped)", wtype = 10, mod = 5, price = 1000},
        {name = "70s Spec", wtype = 10, mod = 6, price = 1000},
        {name = "70s Spec (Stripped)", wtype = 10, mod = 7, price = 1000},
        {name = "Super 5R", wtype = 10, mod = 8, price = 1000},
        {name = "Super 5R (Stripped)", wtype = 10, mod = 9, price = 1000},
        {name = "Speedster", wtype = 10, mod = 11, price = 1000},
        {name = "GP-90", wtype = 10, mod = 12, price = 1000},
        {name = "GP-90 (Stripped)", wtype = 10, mod = 13, price = 1000},
        {name = "Superspoke", wtype = 10, mod = 14, price = 1000},
        {name = "Superspoke (Stripped)", wtype = 10, mod = 15, price = 1000},
        {name = "Gridline", wtype = 10, mod = 16, price = 1000},
        {name = "Gridline (Stripped)", wtype = 10, mod = 17, price = 1000},
        {name = "Snowflake", wtype = 10, mod = 18, price = 1000},
        {name = "Snowflake (Stripped)", wtype = 10, mod = 19, price = 1000}
    },
}