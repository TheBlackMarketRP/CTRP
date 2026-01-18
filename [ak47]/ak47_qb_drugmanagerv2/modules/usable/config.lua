Config.DrugStayInBlood = 5 -- 5 minutes (related with drug test and overdose)
Config.TestKit = 'drugtestkit'
Config.RemoveKit = true
Config.DrugTestDelay = 5 -- 5 seconds

Config.InstantEffect = true -- enable to make the usable drug effect instantly after use

Config.AddAddiction = 5
Config.AddTolerance = 4

Config.OverDoseLimit = {
    same_drug = 10,
    mixed_drug = 5,
}

Config.OverdoseEffect = { -- will loose health 1 in every 1 second
    tick = 1,
    HealthLose = 1,
}

Config.AntiAddiction = {
    acamprosate = 20,   -- will reduce addiction 20 from each drug
    lofexidine = 50,    -- will reduce addiction 50 from each drug
}

Config.AddictionLevel = {   -- max 99
    low  = {    
        level = 30, health_lose = 5, tick = 30, period = 15,       -- player will lose 10 health in every 30 sec after 15 minutes to reach the level
        passout_chance = 10, vomit_chance = 30, chance_tick = 10,   -- will check for passout & vomit in every 2 minutes
    },  
    mid  = {
        level = 50, health_lose = 5,  tick = 15, period = 10,       -- player will lose 5 health in every 10 sec after 10 minutes to reach the level
        passout_chance = 20, vomit_chance = 50, chance_tick = 5,    -- will check for passout & vomit in every 5 minutes
    },  
    high = {
        level = 75, health_lose = 5,  tick = 3,  period = 0,        -- player will lose 1 health in every 1 sec after 5 minutes to reach the level
        passout_chance = 30, vomit_chance = 70, chance_tick = 1,    -- will check for passout & vomit in every 1 minute
    },
}

Config.AddictionReduce = {   -- addiction Level reduce
    tick = 3,                -- every 3 minute
    amount = 2
}

Config.ToleranceReduce = {  -- tolerance Level reduce
    tick = 6,               -- every 6 minute
    amount = 2
}

Config.AddictionEffect = {  -- make false if you don't want any effect
    MotionBlur      = true,
    ScreenEffect    = {enable = true, effect = 'Drug_gas_huffin', strength = 0.1},
    ScreenShake     = {enable = true, strength = 0.15},
    WalkStyle       = {enable = true, style = 'MOVE_M@DRUNK@SLIGHTLYDRUNK'},
}

Config.DatabaseSave = 2 -- every 2 minutes

Config.BongMaxSound = 0.3

--Vehicle Control Config
--Don't touch if you don't know what you are doing
Config.ApplyForceFor = {min = 1, max = 3} -- second
Config.NextForceIntervel = {min = 5, max = 10} --second
Config.VehicleControl = {
    left_force = { --maximum value 1.0, higher value makes harder to drive
        [1] = 0.010,
        [2] = 0.011,
        [3] = 0.012,
        [4] = 0.014,
        [5] = 0.015,
        [6] = 0.016,
        [7] = 0.017,
        [8] = 0.018,
        [9] = 0.019,
        [10] = 0.020,
    },
    right_force = { --minimum value -1.0, lower value makes harder to drive
        [1] = -0.010,
        [2] = -0.011,
        [3] = -0.012,
        [4] = -0.014,
        [5] = -0.015,
        [6] = -0.016,
        [7] = -0.017,
        [8] = -0.018,
        [9] = -0.019,
        [10] = -0.020,
    },
}
Config.LooseGripFor = {min = 1, max = 3} --second