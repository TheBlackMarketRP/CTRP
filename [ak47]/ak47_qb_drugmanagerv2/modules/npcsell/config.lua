Config.RequiredItem = nil -- set nil if not required
Config.DistanceForExistingNpc = 30.0
Config.WantToUsePedList = false
Config.CustomerPeds = { -- list of peds that will triggered on startsell
    [`g_f_y_families_01`] = true,
    [`g_m_y_ballaeast_01`] = true,
    [`g_f_y_ballas_01`] = true,
    [`g_m_y_ballaorig_01`] = true,
    [`g_f_y_vagos_01`] = true,
    [`g_m_y_famca_01`] = true,
    [`g_m_y_famdnf_01`] = true,
    [`g_m_y_ballasout_01`] = true,
    [`a_f_y_soucent_02`] = true,
    [`a_f_y_soucent_01`] = true,
    [`a_m_m_afriamer_01`] = true,
    [`a_m_m_hillbilly_02`] = true,
    [`a_m_m_soucent_03`] = true,
    [`a_m_m_soucent_01`] = true,
    [`a_m_m_tramp_01`] = true,
    [`a_m_m_trampbeac_01`] = true,
    [`a_m_o_soucent_02`] = true,
    [`a_m_o_soucent_03`] = true,
    [`a_m_o_tramp_01`] = true,
}                           --more peds https://docs.fivem.net/docs/game-references/ped-models

Config.SellAnyWhere = true -- if enabled then it will use Config.DefaultSetting & Config.DefaultItems

Config.NpcSellDefault = {
    setting = {
        maxcustomer = 3,
        customerdelay = 2,
        rejectchance = 3,
        robchance = 3,
        coprequired = 0,
        copalertchance = 3,
        autoselling = false,
        currency = 'markedbills',
        minigame = '',
    },
    items = {
        ["meth"] = {        -- item name
            name = "meth",  -- item name
            label = "Bag of Meth", -- item label
            minamount = 1,        -- minimum sell amount
            maxamount = 10,        -- maximum sell amount
            minprice = 750,       -- minimum sell price
            maxprice = 750,       -- maximum sell price
        },
        ["cokebaggy"] = {
            name = "cokebaggy",
            label = "Bag of Coke",
            minamount = 1,
            maxamount = 10,
            minprice = 800,
            maxprice = 800,
        },
        ["crack_baggy"] = {
            name = "crack_baggy",
            label = "Bag of Crack",
            minamount = 1,
            maxamount = 10,
            minprice = 1000,
            maxprice = 1000,
        },
        ["xannax"] = {
            name = "xannax",
            label = "Xannax",
            minamount = 1,
            maxamount = 10,
            minprice = 1100,
            maxprice = 1100,
        },
        ["weed_ak47"] = {
            name = "weed_ak47",
            label = "Bag of Ak47",
            minamount = 1,
            maxamount = 10,
            minprice = 700,
            maxprice = 700,
        },
        ["tiger_breath"] = {
            name = "tiger_breath",
            label = "Tiger Breath",
            minamount = 1,
            maxamount = 10,
            minprice = 700,
            maxprice = 700,
        },
        ["ogkushbag"] = {
            name = "ogkushbag",
            label = "Bag of Og",
            minamount = 1,
            maxamount = 10,
            minprice = 700,
            maxprice = 700,
        },
        ["leafbag"] = {
            name = "leafbag",
            label = "Bag Leaf Nugs",
            minamount = 1,
            maxamount = 10,
            minprice = 700,
            maxprice = 700,
        },
        ["leancup"] = {
            name = "leancup",
            label = "Cup of Lean",
            minamount = 1,
            maxamount = 10,
            minprice = 700,
            maxprice = 700,
        },
        
    }
}
