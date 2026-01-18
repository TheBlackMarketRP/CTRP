Config.Commands = {
    attach = 'attach',
    detach = 'detach',
}

Config.MaxDistance = 10.0           --Max distance from tow vehicle
Config.SafeDetachDistance = 2.

Config.TowVehicles = {
    [`flatbed`] = true,
    [`guardian`] = true,
}

Config.TowableVehicleClasses = {
    [0] = true, --Compacts  
    [1] = true, --Sedans  
    [2] = true, --SUVs  
    [3] = true, --Coupes  
    [4] = true, --Muscle  
    [5] = true, --Sports Classics    
    [6] = true, --Sports 
    [7] = true, --Super   
    [8] = true, --Motorcycles     
    [9] = true, --Off-road       
    [12] = true, --Vans 
    [13] = true, --Cycles   
    [18] = true, --Emergency     
    [22] = true, --Emergency     
}

Config.Controls = { -- Don't touch if don't know what you are doing
    {label = 'Done/Cancel', codes = {201, 177}},
    {label = 'Move', codes = {174, 175, 27, 173}},
    {label = 'Up/Down', codes = {44, 46}},
    {label = 'Rotate', codes = {14, 15}},
    {label = 'Speed', codes = {21}},
}

Config.DefaultMultiplier = 1
Config.SpeedMultiplier = 3

