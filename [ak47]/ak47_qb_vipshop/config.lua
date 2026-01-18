Config = {}
Config.Locale = 'en'

--You can set admin in alternative ways-------------------
--Ace Permission
Config.AdminWithAce = true
--Or license
Config.AdminWithLicense = {
    ['license:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'] = true,
}
--Or identifier
Config.AdminWithIdentifier = {
    ['xxxxxxxx'] = true,
}
----------------------------------------------------------

Config.OwnedVehiclesTable = 'player_vehicles' --in database

Config.InvImgLink = "nui://ox_inventory/web/images/" -- ak47_qb_inventory
--[[
Config.InvImgLink = "nui://qb-inventory/html/images/"           -- qb-inventory
Config.InvImgLink = "nui://ps-inventory/html/images/"           -- ps-inventory
Config.InvImgLink = "nui://lj-inventory/html/images/"           -- lj-inventory
Config.InvImgLink = "nui://qs-inventory/html/images/"           -- qs-inventory
Config.InvImgLink = "nui://ox_inventory/web/images/"            -- ox_inventory
Config.InvImgLink = "nui://ak47_qb_inventory/web/build/images/" -- ak47_qb_inventory
]]

Config.FiveManageImageToken = 'vG1MMW2YRbooMIHWDOhHZlZd9Gspo6NW' -- change this with yours
--[[
    app.fivemanage.com -> Tokens -> Create Token -> Token Type = Image Only -> Create Token -> Copy Token
]]

-- Command to open the VIP shop for players.
Config.OpenShopCommand = 'vipshop'

Config.SpecialCoin = { 
    tablename            = 'vip_players',
    identifiercolumname  = 'identifier',
    coincolumname        = 'vcoin',
}

Config.DailyRewardCooldown = 24 * 60 * 60 * 1000 -- (24 hours in milliseconds)

Config.SpecNormalization = {
    SpeedMax = 68.25,
    AccelerationMax = 0.41,
    BrakingMax = 3.3,
    HandlingMax = 3.11
}

Config.TestDrive = {
    blip = {enable = true, sprite = 483, color = 43, size = 1.0},
    position = vector4(-1719.66, -2924.64, 13.94, 236.65),
    minimumDistance = 50.0,
    timeLimit = 1 -- minute
}