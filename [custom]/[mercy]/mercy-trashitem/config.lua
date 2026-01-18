Config = {
    Core = 'qb-core',  
    Target = 'qb-target',  
}

Config.NewItemsInterval = 3600 --3600 -- in sec -- 3600 = 1 hr

Config.CommonIetms = {
    ['garbage'] = {amount = {min = 1, max = 1}},
    -- ['glass'] = {amount = {min = 1, max = 2}},
    -- ['plastic'] = {amount = {min = 1, max = 2}},
    -- ['aluminum'] = {amount = {min = 1, max = 2}},
}

Config.RareIetms = {
    ['ammo-9'] = {amount = {min = 1, max = 5}, chance = 1},
    ['burger'] = {amount = {min = 1, max = 2}, chance = 5},
    ['water'] = {amount = {min = 1, max = 2}, chance = 5},
    ['cash'] = {amount = {min = 1, max = 200}, chance = 2},
    ['pillbottle'] = {amount = {min = 1, max = 5}, chance = 10},
    ['pooch_bag'] = {amount = {min = 1, max = 5}, chance = 10},
}



Config.DumpsterModels = { 
    `prop_dumpster_01a`, `prop_dumpster_02a`, `prop_dumpster_02b`, `prop_dumpster_3a`, `prop_dumpster_4a`, `prop_dumpster_4b`,
    `prop_bin_05a`, `prop_bin_06a`, `prop_bin_07a`, `prop_bin_07b`, `prop_bin_07c`, `prop_bin_07d`, `prop_bin_08a`, `prop_bin_08open`,
    `prop_bin_09a`, `prop_bin_10a`, `prop_bin_10b`, `prop_bin_11a`, `prop_bin_12a`, `prop_bin_13a`, `prop_bin_14a`, `prop_bin_14b`,
    `prop_bin_beach_01d`, `prop_bin_delpiero`, `prop_bin_delpiero_b`, `prop_recyclebin_01a`, `prop_recyclebin_02_c`, `prop_recyclebin_02_d`,
    `prop_recyclebin_02a`, `prop_recyclebin_02b`, `prop_recyclebin_03_a`, `prop_recyclebin_04_a`, `prop_recyclebin_04_b`, `prop_recyclebin_05_a`,
    `zprop_bin_01a_old`, `hei_heist_kit_bin_01`, `ch_prop_casino_bin_01a`, `vw_prop_vw_casino_bin_01a`, `mp_b_kit_bin_01`, `prop_bin_01a`,
}

