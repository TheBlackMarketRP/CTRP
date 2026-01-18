Config = {}

-- Configure all drugs on server config.

Config.Framework = 1 -- ESX = 0, QBCore = 1, Custom = 2 (For custom, setup in frameworks/custom.lua)
Config.SellCommands = { 'dealer', 'selldrugs', 'trap' } -- Commands that are used to sell drugs
Config.EnableSelection = true -- Enable the context menu to select the drug IF they have more then 1
Config.SpawnDistance = 20.0 -- The distance the peds are spawned from the player
Config.CustomerPedsAtaTime = 3
Config.DefaultSellTime = 5 -- Time (in seconds) it takes to sell on level 1
Config.SellOnlyNight = false -- true/false if enabled it will only allow them to sell at night
Config.EnableProps = true -- true/false if enabled it will spawn props on the peds when selling
Config.SyncPeds = true -- true/false if enabled it will sync the peds to all players

Config.Agressive = { -- What happens when drug is denied (deny chance is in the drug config [server-sided])
    Enabled = false,
    Type = 1, -- 1 = Melee, 2 = Gun (Will select a random weapon from the list below)
    WeaponList = { `WEAPON_PISTOL`, `WEAPON_COMBATPISTOL` } -- List of weapons to select from (Only used if Type = 2)
}

Config.Props = {
    Enabled = true,
    Duration = 2, -- How long the props stay on the ped (in seconds)
    Prop1 = {
        Model = `prop_weed_bottle`,
        Bone = 57005,
        Coords = {X = 0.13, Y = 0.02, Z = 0.0},
        Rotation = {XRot = -90.0, YRot = 0, ZRot = 0},
    },
    Prop2 = {
        Model = `hei_prop_heist_cash_pile`,
        Bone = 57005,
        Coords = {X = 0.13, Y = 0.02, Z = 0.0},
        Rotation = {XRot = -90.0, YRot = 0, ZRot = 0},
    },
}

Config.BlacklistedJobs = { -- A list of jobs that cannot do /dealer
    'police',
    'ambulance'
}

Config.BlacklistedLocations = {
    vec4(0.0, 0.0, 0.0, 25.0), -- X, Y, Z, Radius
}

--------------------------------------------------------------------------------------
-- Supported Dispatch Systems (server/open.lua to configure and add more)
-- It will automatically detect if you have one of these installed and use it.
-- If you don't have any of these installed, it will use the default dispatch system.
--------------------------------------------------------------------------------------


Config.Police = {
    Enabled = true,
    Jobs = { 'police' },
}

Config.DenyStrings = {
    'This stuff is shitty!',
    'I want the real shit, what is this?!',
    'This shit wack.',
}

Config.Strings = {
    ['NoDrugs'] = 'You have no drugs to sell!',
    ['MenuTitle'] = 'Select Drug Option',
    ['NoClientFound'] = 'No clients were found, try moving around.',
    ['ClientFound'] = 'Client found, they\'re approaching now.',
    ['ClientScared'] = 'The client got scared and ran away.',
    ['NoInVeh'] = 'You can\'t sell drugs while in a vehicle.',
    ['SoldDrug'] = 'You sold {DRUG_NAME} for ${DRUG_PRICE}.',
    ['RankUp'] = 'Congrats! You have sold a total of {TOTAL_DRUGSALE} drugs and ranked up to {RANK_LABEL}!',
    ['SellIncrease'] = 'You got a {DRUG_MULTI}% sell increase due to your rank!',
    ['SellIncreaseDiscord'] = 'You got a {DRUG_MULTI}% sell increase due to being a donator!',
    ['AlertPolice'] = 'A suspect spotted selling drugs!',
    ['BlacklistedJob'] = 'You are not allowed to sell drugs with this job!',
    ['CantSellHere'] = 'You cannot sell drugs here!',
    ['CurrentlyDrugRank'] = 'You are currently rank {DRUG_RANK}, and have sold a total of x{DRUG_TOTALSOLD} drugs!',
    ['NotNight'] = 'You can only sell drugs during night time!',
    ['Dispatch_Title'] = 'Drug Selling',
    ['Dispatch_Code'] = '10-32',
    ['Dispatch_Description'] = 'A suspect has been spotted selling drugs!',
}

Config.PedModels = { -- List of peds that are selected when selling
    `a_m_m_salton_04`,
    `a_m_m_salton_03`,
    `a_m_m_rurmeth_01`,
    `a_m_m_skidrow_01`,
    `a_m_m_socenlat_01`,
    `a_m_m_soucent_01`,
    `a_m_m_soucent_03`,
    `a_m_m_soucent_04`,
    `a_m_o_acult_02`,
    `a_m_o_soucent_02`,
    `a_m_o_soucent_03`,
    `a_m_o_tramp_01`,
    `csb_tonya`,
    `g_f_y_ballas_01`,
    `g_f_y_families_01`,
    `g_f_y_lost_01`,
    `g_f_y_vagos_01`,
}

Config.Ranks = {
    [1] = {
        RankLabel = 'Rank: 2',
        SellRequirement = 200,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 2 -- Sell 10% more
        }
    },
    [2] = {
        RankLabel = 'Rank: 3',
        SellRequirement = 300,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 2 -- Sell 10% more
        }
    },
    [3] = {
        RankLabel = 'Rank: 4',
        SellRequirement = 400,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 2 -- Sell 10% more
        }
    },
    [4] = {
        RankLabel = 'Rank: 5',
        SellRequirement = 500,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 2 -- Sell 10% more
        }
    },
    [5] = {
        RankLabel = 'Rank: 6',
        SellRequirement = 600,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 3 -- Sell 10% more
        }
    },
    [6] = {
        RankLabel = 'Rank: 7',
        SellRequirement = 700,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 3 -- Sell 10% more
        }
    },
    [7] = {
        RankLabel = 'Rank: 8',
        SellRequirement = 800,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 3 -- Sell 10% more
        }
    },
    [8] = {
        RankLabel = 'Rank: 9',
        SellRequirement = 900,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 3 -- Sell 10% more
        }
    },
    [9] = {
        RankLabel = 'Rank: 10',
        SellRequirement = 1000,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 3 -- Sell 10% more
        }
    },
    [10] = {
        RankLabel = 'Rank: 11',
        SellRequirement = 1100,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 4 -- Sell 10% more
        }
    },
    [11] = {
        RankLabel = 'Rank: 12',
        SellRequirement = 1200,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 4 -- Sell 15% more
        }
    },
    [12] = {
        RankLabel = 'Rank: 13',
        SellRequirement = 1300,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 4 -- Sell 15% more
        }
    },
    [13] = {
        RankLabel = 'Rank: 14',
        SellRequirement = 1400,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 4 -- Sell 15% more
        }
    },
    [14] = {
        RankLabel = 'Rank: 15',
        SellRequirement = 1500,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 4 -- Sell 15% more
        }
    },
    [15] = {
        RankLabel = 'Rank: 16',
        SellRequirement = 1600,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 5 -- Sell 15% more
        }
    },
    [16] = {
        RankLabel = 'Rank: 17',
        SellRequirement = 1700,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 5 -- Sell 15% more
        }
    },
    [17] = {
        RankLabel = 'Rank: 18',
        SellRequirement = 1800,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 5 -- Sell 15% more
        }
    },
    [18] = {
        RankLabel = 'Rank: 19',
        SellRequirement = 1900,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 5 -- Sell 15% more
        }
    },
    [19] = {
        RankLabel = 'Rank: 20',
        SellRequirement = 2000,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 5 -- Sell 15% more
        }
    },
    [20] = {
        RankLabel = 'Rank: 21',
        SellRequirement = 2100,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 6 -- Sell 15% more
        }
    },
    [21] = {
        RankLabel = 'Rank: 22',
        SellRequirement = 2200,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 6 -- Sell 20% more
        }
    },
    [22] = {
        RankLabel = 'Rank: 23',
        SellRequirement = 2300,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 6 -- Sell 20% more
        }
    },
    [23] = {
        RankLabel = 'Rank: 24',
        SellRequirement = 2400,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 6 -- Sell 20% more
        }
    },
    [24] = {
        RankLabel = 'Rank: 25',
        SellRequirement = 2500,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 6 -- Sell 20% more
        }
    },
    [25] = {
        RankLabel = 'Rank: 2600',
        SellRequirement = 2600,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 7 -- Sell 20% more
        }
    },
    [26] = {
        RankLabel = 'Rank: 27',
        SellRequirement = 2700,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 7 -- Sell 20% more
        }
    },
    [27] = {
        RankLabel = 'Rank: 28',
        SellRequirement = 2800,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 7 -- Sell 20% more
        }
    },
    [28] = {
        RankLabel = 'Rank: 29',
        SellRequirement = 2900,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 7 -- Sell 20% more
        }
    },
    [29] = {
        RankLabel = 'Rank: 30',
        SellRequirement = 3000,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 7 -- Sell 20% more
        }
    },
    [30] = {
        RankLabel = 'Rank: 31',
        SellRequirement = 3100,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 8 -- Sell 20% more
        }
    },
    [31] = {
        RankLabel = 'Rank: 32',
        SellRequirement = 3200,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 8 -- Sell 20% more
        }
    },
    [32] = {
        RankLabel = 'Rank: 33',
        SellRequirement = 3300,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 8 -- Sell 25% more
        }
    },
    [33] = {
        RankLabel = 'Rank: 34',
        SellRequirement = 3400,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 8 -- Sell 25% more
        }
    },
    [34] = {
        RankLabel = 'Rank: 35',
        SellRequirement = 3500,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 9 -- Sell 25% more
        }
    },
    [35] = {
        RankLabel = 'Rank: 36',
        SellRequirement = 3600,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 9 -- Sell 25% more
        }
    },
    [36] = {
        RankLabel = 'Rank: 37',
        SellRequirement = 3700,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 9 -- Sell 25% more
        }
    },
    [37] = {
        RankLabel = 'Rank: 38',
        SellRequirement = 3800,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 9 -- Sell 25% more
        }
    },
    [38] = {
        RankLabel = 'Rank: 39',
        SellRequirement = 3900,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 9 -- Sell 25% more
        }
    },
    [39] = {
        RankLabel = 'Rank: 40',
        SellRequirement = 4000,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 10 -- Sell 25% more
        }
    },
    [40] = {
        RankLabel = 'Rank: 41',
        SellRequirement = 4100,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 10 -- Sell 25% more
        }
    },
    [41] = {
        RankLabel = 'Rank: 42',
        SellRequirement = 4200,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 10 -- Sell 25% more
        }
    },
    [42] = {
        RankLabel = 'Rank: 43',
        SellRequirement = 4300,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 10 -- Sell 25% more
        }
    },
    [43] = {
        RankLabel = 'Rank: 44',
        SellRequirement = 4400,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 10 -- Sell 25% more
        }
    },
    [44] = {
        RankLabel = 'Rank: 45',
        SellRequirement = 4500,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 11 -- Sell 25% more
        }
    },
    [45] = {
        RankLabel = 'Rank: 46',
        SellRequirement = 4600,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 11 -- Sell 25% more
        }
    },
    [46] = {
        RankLabel = 'Rank: 47',
        SellRequirement = 4700,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 11 -- Sell 25% more
        }
    },
    [47] = {
        RankLabel = 'Rank: 48',
        SellRequirement = 4800,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 11 -- Sell 25% more
        }
    },
    [48] = {
        RankLabel = 'Rank: 49',
        SellRequirement = 4900,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 11 -- Sell 25% more
        }
    },
    [49] = {
        RankLabel = 'Rank: 50',
        SellRequirement = 5000,
        Modifiers = {
            SellTime = 5, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 11 -- Sell 25% more
        }
    },
    
}