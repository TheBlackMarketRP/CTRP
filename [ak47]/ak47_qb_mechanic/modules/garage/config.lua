Config.UpperRankCanAccessLowerRankVehicles = true

Config.Garages = {
    {
        name = 'Mechanic Garage',
        zone        = vector3(-191.99, -1304.19, 31.28),       --zone position
        rotation    = 90.0,                                    --zone rotation
        size        = vector3(6.0, 20.0, 2.0),                 --zone size
        spawns      = {
            vector4(-191.99, -1304.19, 31.28, 90.0),            --vehicle spawn point with heading
        }, 
        setting = {
            refill = true,
            clean = true,
            vehicletype = 'car' -- 'car', 'heli', 'boat', 'plane'
        }, 
        jobs = {
            mechanic = true,
            --mechanic2 = true,
        },
        vehicles = {
            {model = 'flatbed',  label = 'Flatbed',  rank = 0,  mods = {modEngine = 3, modBrakes = 2, modTransmission = 2, modSuspension = 3, modArmor = true}},
            {model = 'towtruck',  label = 'Tow Truck',  rank = 0,  mods = {modEngine = 3, modBrakes = 2, modTransmission = 2, modSuspension = 3, modArmor = true}},
            {model = 'minivan',  label = 'Minivan',  rank = 0,  mods = {modEngine = 3, modBrakes = 2, modTransmission = 2, modSuspension = 3, modArmor = true}},
            {model = 'guardian',  label = 'Guardian',  rank = 0,  mods = {modEngine = 3, modBrakes = 2, modTransmission = 2, modSuspension = 3, modArmor = true}},
        }
    },
}