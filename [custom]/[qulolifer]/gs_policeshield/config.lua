Config = {
    enableCommand = false,   -- Enables the /shield command
    commandName = 'shield', -- The command name (In this case /shield)

    enableItems = true,     -- Enables the shield item to used through items
    removeItem = true,      -- Remove the shield item when the player uses the shield item

    shields = {
        ['ballistic'] = {
            itemName = 'ballistic_shield',
            modelHash = `prop_ballistic_shield_custom`,
            jobs = { ['police'] = 0, ['sheriff'] = 0 },
            attach = {
                boneId = 36029,
                anim = { dict = 'combat@gestures@gang@pistol_1h@glances', name = '0' },
                pos = vector3(0.0, -0.03, -0.07),
                rot = vector3(-35.0, 180.0, -40.0),
            },
            weapons = {
                `WEAPON_PISTOL`,
                `WEAPON_PISTOL_MK2`,
                `WEAPON_COMBATPISTOL`,
                `WEAPON_STUNGUN`,
                `WEAPON_G19X`,
                `WEAPON_MP7_BLACKTIDE_PD`,
                `WEAPON_KSGR_REVENGER_PD`,
                `WEAPON_PD_AR15`,
                `WEAPON_PD_UMP9`,
                `WEAPON_PD_TASER`,
                `WEAPON_PD_SR47`,
                `WEAPON_PD_SCAR`,
                `WEAPON_PD_SAWOFF`,
                `WEAPON_PD_SABRE`,
                `WEAPON_PD_PUMP`,
                `WEAPON_PD_MPX`,
                `WEAPON_PD_MP5`,
                `WEAPON_PD_M4URX`,
                `WEAPON_PD_G36C`,
                `WEAPON_PD_G19`,
                `WEAPON_PD_G17`,
                `WEAPON_PD_FX05`,
                `WEAPON_PD_FN509`,
                `WEAPON_PD_EVO`,
                `WEAPON_PD_CBATON`,
                `WEAPON_PD_BEANBAG`,
                `WEAPON_PD_BATON`,
                `WEAPON_GOLD1911`,
            }
        },
        ['riot'] = {
            itemName = 'riot_shield',
            modelHash = `prop_riot_shield`,
            jobs = { ['police'] = 0, ['sheriff'] = 0 },
            attach = {
                boneId = 36029,
                anim = { dict = 'combat@gestures@gang@pistol_1h@glances', name = '0' },
                pos = vector3(0.05, -0.03, -0.01),
                rot = vector3(-35.0, 180.0, -40.0),
            },
            weapons = {
                `WEAPON_PISTOL`,
                `WEAPON_PISTOL_MK2`,
                `WEAPON_COMBATPISTOL`,
                `WEAPON_STUNGUN`,
                `WEAPON_G19X`,
                `WEAPON_MP7_BLACKTIDE_PD`,
                `WEAPON_KSGR_REVENGER_PD`,
                `WEAPON_PD_AR15`,
                `WEAPON_PD_UMP9`,
                `WEAPON_PD_TASER`,
                `WEAPON_PD_SR47`,
                `WEAPON_PD_SCAR`,
                `WEAPON_PD_SAWOFF`,
                `WEAPON_PD_SABRE`,
                `WEAPON_PD_PUMP`,
                `WEAPON_PD_MPX`,
                `WEAPON_PD_MP5`,
                `WEAPON_PD_M4URX`,
                `WEAPON_PD_G36C`,
                `WEAPON_PD_G19`,
                `WEAPON_PD_G17`,
                `WEAPON_PD_FX05`,
                `WEAPON_PD_FN509`,
                `WEAPON_PD_EVO`,
                `WEAPON_PD_CBATON`,
                `WEAPON_PD_BEANBAG`,
                `WEAPON_PD_BATON`,
                `WEAPON_GOLD1911`,
            }
        },
    },

    disableLadderClimb = true,
    disabledControls = {
        22, -- Space
        23, -- F
    },

    -- Unequip shield controls
    removeShield = { enable = true, label = '[H] Unequip', key = 74 },

    -- Drop shield controls
    dropShield = { enable = true, label = '[X] Drop', key = 73, },

    -- Place shield controls
    placeShield = { enable = true, label = '[G] Place', key = 47 },

    -- Place shield animation
    placeAnim = {
        dict = 'anim@mp_fireworks',
        name = 'place_firework_3_box',
        flags = 1,
        duration = 1500,
    }
}

Config.Locales = {
    ['pickup_shield'] = 'Pickup shield',
    ['invalid_shield'] = '~r~Invalid shield type.',
    ['cant_use_shield'] = '~r~You cannot use this shield right now.',
    ['not_allowed'] = '~r~You are not allowed to use this shield.',
    ['disallowed_weapon'] = '~r~You cannot use this shield with this weapon.',
    ['no_shield_item'] = '~r~You do not have the required item.',
    ['unequip_shield'] = '~r~Unequip your shield first.',
}
