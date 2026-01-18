Config = {
    Core = 'qb-core',
}

Config.BoxModel = "prop_rub_boxpile_06"

Config.Packs = {
    ['ems_pack'] = {
        name = "EMS Starter Pack",
        job = "ambulance",
        jobLock = true,
        rewardItems = {
            {name = "weapon_pepperspray", amount = 1},
            {name = "radio", amount = 1},
            {name = "medbag", amount = 1},
            {name = "djs_prop_pineapple", amount = 20},
            {name = "djs_box_oxtailmac", amount = 20},
        }
    },
    ['pd_pack'] = {
        name = "PD Starter Pack",
        job = "police",
        jobLock = true,
        rewardItems = {
            {name = "WEAPON_PD_BEANBAG", amount = 1},
            {name = "WEAPON_PD_G17", amount = 1},
            {name = "WEAPON_PD_UMP9", amount = 1},
            {name = "WEAPON_PD_TASER", amount = 1},
            {name = "WEAPON_FLASHLIGHT", amount = 1},
            {name = "weapon_pepperspray", amount = 1},
            {name = "uvlight", amount = 1},
            {name = "radio", amount = 1},
            {name = "handcuffs", amount = 5},
            {name = "djs_prop_pineapple", amount = 20},
            {name = "djs_box_oxtailmac", amount = 20},
        }
    },
    ['female_pack'] = {
        name = "Female Starter Pack",
        job = "",
        jobLock = false,
        rewardItems = {
            {name = "WEAPON_DILDO", amount = 1},
            {name = "WEAPON_HELLOKITTY_ARP", amount = 1},
            {name = "ammo-rifle", amount = 100},
            {name = "djs_prop_pineapple", amount = 20},
            {name = "djs_box_oxtailmac", amount = 20},
        }
    },
    ['vip_pack'] = {
        name = "VIP Starter Pack",
        job = "",
        jobLock = false,
        rewardItems = {
            {name = "fraudprinter", amount = 1},
            {name = "fraudscaner", amount = 1},
            {name = "fraudgnei", amount = 1},
            {name = "fraudlaptop", amount = 1},
        }
    },
}

