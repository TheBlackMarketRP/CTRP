Config = {}
Config.Locale = 'en'
Config.Debug = false

Config.Commands = {
	createsafezone  = 'createsafezone',
    deletesafezone  = 'deletesafezone',
    zonesetting     = 'zonesetting',
}

--You can set admin in alternative ways-------------------
--Ace Permission
Config.AdminWithAce = true
--Or group (Only works in my qb base)
Config.AdminWithGroup = {
    ['admin'] = true,
    ['god'] = true,
}
--Or license
Config.AdminWithLicense = {
    ['license:f500dcf04823ac4f2d3d35313ac84939b8f6fdca'] = true,--fran
    ['license:bc49f091bb50967039b397084b0babc8a1028d0b'] = true,--mercy
    ['license:aace24de2dcee83016ef4788bd039e1f40fb165b'] = true,--mari
    ['license:07bcc69e68643e238c261817675a4dbf98aef397'] = true,--rico
    ['license:63bc0651a36755b6682a94a4a892d7205a39e895'] = true,--pony
    ['license:ea5aa74d0e644023ed80af08911e76feebfe0660'] = true,--rob
}
--Or character id
Config.AdminWithIdentifier = {
    ['xxxxxxxx'] = true,
}
----------------------------------------------------------

Config.AlertStyle = {
    icon = 'hand',
    textColor = 'white',
    position = 'right-center',
    borderRadius = 5,
    backgroundColor = 'rgb(187 72 72)',
}
Config.HideAlertAfterDelay = false
Config.HideAlertDelay = 6 --seconds

Config.WhitelistedWeapons = {
    --[`weapon_pistol`] = true,
    --[`weapon_combatpistol`] = true,
}

Config.WhitelistedJobWeapons = {
    police = {
        [`weapon_stungun`] = {0, 1, 2, 3, 4}, -- weapon has & job ranks
        [`weapon_combatpistol`] = {2, 3, 4},
    },
    ambulance = {
        --[`weapon_stungun`] = {0, 1, 2, 3, 4},
    },
}

