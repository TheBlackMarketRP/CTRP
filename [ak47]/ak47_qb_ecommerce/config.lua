Config = {}
Config.Locale = 'en'

-- The command players use to open the shop UI
Config.OpenCommand = 'market'

Config.InvImgLink = "nui://ox_inventory/web/images/" -- ak47_qb_inventory
--[[
Config.InvImgLink = "nui://qb-inventory/html/images/"           -- qb-inventory
Config.InvImgLink = "nui://ps-inventory/html/images/"           -- ps-inventory
Config.InvImgLink = "nui://lj-inventory/html/images/"           -- lj-inventory
Config.InvImgLink = "nui://qs-inventory/html/images/"           -- qs-inventory
Config.InvImgLink = "nui://ox_inventory/web/images/"            -- ox_inventory
Config.InvImgLink = "nui://ak47_qb_inventory/web/build/images/" -- ak47_qb_inventory
]]

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
Config.ClearOldOrders = 7 -- 7 days

Config.RegistrationCost = 0 -- One-time cost to register a new shop

Config.DeliveryFee = 0 -- The amount for the delivery fee

Config.MaxProduct = 10 -- for each player

Config.ShopBlip = {
    enable = true,
    sprite = 52,
    color = 2,
    scale = 0.6,
}

Config.Marker = {
    enable = true,
    id = 29,
    size = vector3(0.3, 0.3, 0.3),
    color = {r = 0, g = 255, b = 0, a = 200},
}

Config.BlackListedItems = {
    medikit = true,
    weapon_rpg = true,

}

