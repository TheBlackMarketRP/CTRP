config = {}

-- target resource (only one of these can be true)
-------------------------------------------------------
config.qbtarget = true
config.oxtarget = false
-------------------------------------------------------

config.InventorySystem = 'qb' -- Supports 'ox' & 'qb'
config.useBlip = true
config.pedmodel = 'a_m_m_prolhost_01' -- ped model hash

config.scenario = 'WORLD_HUMAN_CLIPBOARD' -- scenario for ped to play, false to disable

config.locations = {
    ['paletohospital'] = {
        ped = true, -- if false uses boxzone (below)
        coords = vector4(-226.84, 6326.68, 31.51, 217.2),
        -------- boxzone (only used if ped is false) --------
        length = 1.0,  
        width = 1.0,   
        minZ = 30.81,  
        maxZ = 30.81,  
        debug = false, 
        -----------------------------------------------------
        vehicles = {
            ['panto'] = {
                price = 50,
                image = 'https://i.imgur.com/vuP5xMc.jpeg',
            },
            ['sanchez'] = {
                price = 0,
                image = 'https://i.imgur.com/TKTtwYF.jpeg',
            },
        },
        vehiclespawncoords = vector4(-221.01, 6321.64, 30.68, 133.67), -- where vehicle spawns when rented
    },
    ['pillhospital'] = {
        ped = true,
        coords = vector4(246.93, -559.06, 43.27, 159.85),
        -------- boxzone (only used if ped is false) --------
        length = 1.0,  
        width = 1.0,   
        minZ = 30.81,  
        maxZ = 30.81,  
        debug = false, 
        -----------------------------------------------------
        vehicles = {
            ['panto'] = {
                price = 50,
                image = 'https://i.imgur.com/vuP5xMc.jpeg',
            },
            ['sanchez'] = {
                price = 0,
                image = 'https://i.imgur.com/TKTtwYF.jpeg',
            },
        },
        vehiclespawncoords = vector4(253.77, -564.2, 43.27, 152.49),
    },
    ['sandyhospital'] = {
        ped = true,
        coords = vector4(1791.02, 3644.16, 34.54, 168.23),
        -------- boxzone (only used if ped is false) --------
        length = 1.0,  
        width = 1.0,   
        minZ = 30.81,  
        maxZ = 30.81,  
        debug = false, 
        -----------------------------------------------------
        vehicles = {
            ['panto'] = {
                price = 0,
                image = 'https://i.imgur.com/vuP5xMc.jpeg',
            },
            ['sanchez'] = {
                price = 1000,
                image = 'https://i.imgur.com/TKTtwYF.jpeg',
            },
        },
        vehiclespawncoords = vector4(1791.2, 3638.37, 33.69, 234.88),
    },
    ['lakeboat'] = {
        ped = true,
        coords = vector4(1453.29, 3794.53, 31.81, 113.94),
        -------- boxzone (only used if ped is false) --------
        length = 1.0,  
        width = 1.0,   
        minZ = 30.81,  
        maxZ = 30.81,  
        debug = false, 
        -----------------------------------------------------
        vehicles = {
            ['vd_boat'] = {
                price = 10000,
                image = 'https://i.imgur.com/vuP5xMc.jpeg',
            },
            
        },
        vehiclespawncoords = vector4(1457.9, 3802.47, 30.53, 338.94),
    },
    -- add as many locations as you'd like with any type of vehicle (air, water, land) follow same format as above
}

