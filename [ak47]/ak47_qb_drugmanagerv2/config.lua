Config = {}
Config.Locale = 'en'

Config.Debug = false
Config.TargetScript = 'qb-target'                               --⚠️Don't change if you are using ox_target

Config.InvImgLink = "nui://ox_inventory/web/images/" -- ak47_qb_inventory
--[[
Config.InvImgLink = "nui://qb-inventory/html/images/"           -- qb-inventory
Config.InvImgLink = "nui://ps-inventory/html/images/"           -- ps-inventory
Config.InvImgLink = "nui://lj-inventory/html/images/"           -- lj-inventory
Config.InvImgLink = "nui://qs-inventory/html/images/"           -- qs-inventory
Config.InvImgLink = "nui://ox_inventory/web/images/"            -- ox_inventory
Config.InvImgLink = "nui://ak47_qb_inventory/web/build/images/" -- ak47_qb_inventory
]]

Config.Animation = {
    collect = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', anim = 'machinic_loop_mechandplayer' },
    process = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', anim = 'machinic_loop_mechandplayer' },
    handcraft = { dict = 'nmt_3_rcm-10', anim = 'cs_nigel_dual-10' },
}

--You can set admin in alternative ways-------------------
--Ace Permission
Config.AdminWithAce = true
--Or license
Config.AdminWithLicense = {
    ['license:f500dcf04823ac4f2d3d35313ac84939b8f6fdca'] = true,--fran
    ['license:bc49f091bb50967039b397084b0babc8a1028d0b'] = true,--mercy
    ['license:aace24de2dcee83016ef4788bd039e1f40fb165b'] = true,--mari
    ['license:07bcc69e68643e238c261817675a4dbf98aef397'] = true,--rico
    ['license:63bc0651a36755b6682a94a4a892d7205a39e895'] = true,--pony
    ['license:ea5aa74d0e644023ed80af08911e76feebfe0660'] = true,--rob
}
--Or identifier
Config.AdminWithIdentifier = {
    ['xxxxxxxx'] = true,
}
----------------------------------------------------------

Config.Commands = {
    drugmanager = 'drugmanager', -- event name ("ak47_qb_drugmanagerv2:drugmanager")
    startsell   = '',   -- event name ("ak47_qb_drugmanagerv2:startsell")
    stopsell    = '',    -- event name ("ak47_qb_drugmanagerv2:stopsell")
}

Config.MarkedbillItem = {
    item = 'markedbills',
    label = 'Marked Money',
    usemetavalue = false,
}

Config.Currency = {
    cash = "Cash",
    bank = "Bank",
    --black_money = "Black Money",
}

Config.CopAlertBlipTime = 60 --in sec

Config.Cops = {
    police = true,
    sheriff = true,
}

Config.UsableProps = {
    {
        model = 'p_amb_joint_01',
        position = vector3(0.15, 0.015, 0.0),
        rotation = vector3(0.0, 90.0, 0.0),
    },
    {
        model = 'prop_cigar_01',
        position = vector3(0.15, 0.015, 0.0),
        rotation = vector3(0.0, -80.0, 0.0),
    },
    {
        model = 'prop_cigar_03',
        position = vector3(0.15, 0.015, 0.00),
        rotation = vector3(0.0, -80.0, 0.0),
    },
    {
        model = 'p_amb_coffeecup_01',
        position = vector3(0.14, -0.03, -0.08),
        rotation = vector3(-60.0, 40.0, 0.0),
    },
}

Config.ScreenEffects = {
    'spectator1',
    'spectator5',
    'spectator7',
    'spectator8',
    'spectator9',
    'BikerForm01',
    'Dont_tazeme_bro',
    'Drug_gas_huffin',
}

Config.WalkStyles = {
    'DEFAULT',
    'MOVE_M@DRUNK@SLIGHTLYDRUNK',
    'MOVE_M@DRUNK@MODERATEDRUNK',
    'MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP',
    'MOVE_M@DRUNK@VERYDRUNK',
    'MOVE_M@GANGSTER@VAR_E',
    'MOVE_M@CASUAL@E',
}

Config.FieldProps = {
    'prop_weed_02',
    'prop_weed_01',
    'prop_plant_cane_02b',
    'prop_plant_01a',
    'prop_plant_flower_03',
    'prop_stoneshroom1',
    'prop_cs_plant_01',
    'prop_plant_01b',
    'prop_plant_paradise',
    'prop_plant_paradise_b',
    'prop_agave_01',
    'prop_agave_02',
    'prop_p_spider_01c',
    'prop_plant_fern_02a',
    'h4_prop_bush_cocaplant_01',
}

Config.MiniGames = {
    minigamelv1 = function()
        return lib.skillCheck({ 'easy' }, { 'e' })
    end,
    minigamelv2 = function()
        return lib.skillCheck({ 'easy', 'easy' }, { 'e', 'e' })
    end,
    minigamelv3 = function()
        return lib.skillCheck({ 'easy', 'medium', 'medium' }, { 'e', 'e', 'e' })
    end,
    minigamelv4 = function()
        return lib.skillCheck({ 'medium', 'medium', 'hard' }, { 'e', 'e', 'e' })
    end,
    minigamelv5 = function()
        return lib.skillCheck({ 'easy', 'medium', 'hard', 'hard' }, { 'e', 'e', 'e', 'e' })
    end,
}

Config.Dispatch = function()
    if GetResourceState('ps-dispatch') == 'started' then
        exports['ps-dispatch']:DrugSale()
    elseif GetResourceState('qs-dispatch') == 'started' then
        exports['qs-dispatch']:DrugSale()
    elseif GetResourceState('cd_dispatch') == 'started' then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = { 'police', 'sheriff' },
            coords = data.coords,
            title = '10-13 - Drug Sell',
            message = 'A ' .. data.sex .. ' drug selling at ' .. data.street,
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 51,
                scale = 1.0,
                colour = 1,
                flashes = false,
                text = '10-13 - Drug Sell',
                time = 5,
                radius = 0,
            }
        })
    elseif GetResourceState('qb-policejob') == 'started' then
        TriggerServerEvent('police:server:policeAlert', 'Drug sale in progress')
    else
        local playerCoords = GetEntityCoords(cache.ped)
        streetName, _ = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
        playerStreet = GetStreetNameFromHashKey(streetName)
        TriggerServerEvent('ak47_qb_drugmanagerv2:policeAlert', playerCoords, playerStreet)
    end
end

-- ================ Only for devs ==============
-- (client side only)
Config.CanSellDealer = function(dealerdata)
    return true
end

Config.OnSellDealer = function(dealerdata, item, amount)
    -- print(json.encode(dealerdata))
    -- print(item, amount)
end

Config.CanSellNPC = function(zonedata)
    return true
end

Config.OnSellNPC = function(zonedata, item, amount)
    -- print(json.encode(zonedata))
    -- print(item, amount)
    TriggerEvent('ak47_qb_territories:addinfluence', 2.0)
end
-- (server side only)
Config.OnSellNPCServer = function(source, zonedata, item, amount)
    -- print(json.encode(zonedata))
    -- print(item, amount)
    TriggerEvent("rcore_gangs:server:increase_loyalty", source, "DRUGS", 1.0)
end
