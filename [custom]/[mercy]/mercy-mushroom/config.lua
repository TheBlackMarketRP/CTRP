Config = {
    Debug = true,
    Core = 'qb-core',  
    Target = 'qb-target', 
}

Config.HarvestZone = {
    Coords = vector3(4798.06, -4393.06, 20.96),
    Radius = 20.0,
    Model = "mushroom",
    MaxSpawn = 30,
    Items = {
        { name = 'shroom', amount = {min = 1, max = 2} },
    }
}
