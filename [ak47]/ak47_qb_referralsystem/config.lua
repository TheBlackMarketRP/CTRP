Config = {}
Config.Locale = 'en'

-- The command players can use to open the referral UI
Config.OpenCommand = 'referral'

Config.InvImgLink = "nui://ox_inventory/web/images/" -- ak47_qb_inventory
--[[
Config.InvImgLink = "nui://qb-inventory/html/images/"           -- qb-inventory
Config.InvImgLink = "nui://ps-inventory/html/images/"           -- ps-inventory
Config.InvImgLink = "nui://lj-inventory/html/images/"           -- lj-inventory
Config.InvImgLink = "nui://qs-inventory/html/images/"           -- qs-inventory
Config.InvImgLink = "nui://ox_inventory/web/images/"            -- ox_inventory
Config.InvImgLink = "nui://ak47_qb_inventory/web/build/images/" -- ak47_qb_inventory
]]

Config.OwnedVehiclesTable = 'player_vehicles' --in database

-- The required playtime in minutes for a referral to be considered successful
Config.RequiredPlaytime = 1200 -- 20 hours

-- Types: 'item', 'vehicle', 'money'
Config.StarterPack = {
    { type = 'money', name = 'bank', label = 'bank', amount = 100000 },
    { type = 'item', name = 'WEAPON_ILLTITAN17', label = 'ILLEGAL TITAN 17', amount = 1 },
    { type = 'item', name = 'ammo-9', label = '9mm', amount = 500 },
    { type = 'item', name = 'bandage', label = 'Bandage', amount = 20 },
    { type = 'item', name = 'burger', label = 'Burger', amount = 20 },
    { type = 'item', name = 'sprunk', label = 'Sprunk', amount = 20 },
    { type = 'item', name = 'xannax', label = 'Xannax', amount = 175 },
}

-- Types: 'item', 'vehicle', 'plate', 'money'
Config.Rewards = {
    { requires = 1,  type = 'money',    name = 'cash',                 label = 'Cash',              amount = 500000 },
    { requires = 2,  type = 'money',    name = 'bank',                 label = 'Bank',              amount = 500000 },
    { requires = 3,  type = 'item',     name = '1backpack1',              label = 'Backpack',          amount = 1 },
    { requires = 4,  type = 'item',     name = 'ammo-9',          label = '9mm',             amount = 1000 },
    { requires = 5,  type = 'item',     name = 'xannax',              label = 'xannax',           amount = 1000 },
    { requires = 6,  type = 'item',     name = 'ammo-9',                label = 'ammo-9',             amount = 1000 },
    { requires = 7,  type = 'money',     name = 'cash',  label = 'Cash' ,    amount = 1000000 },
    { requires = 8,  type = 'money',     name = 'cash', label = 'Cash' ,   amount = 1000000 },
    { requires = 9,  type = 'item',     name = 'WEAPON_GLOCK26V2',   label = 'G26 V2' ,  amount = 1 },
    { requires = 10,  type = 'item',    name = 'bgasbottleb',         label = 'Galaxy Gas' ,         amount = 1 },
    { requires = 11,  type = 'money',    name = 'cash',     label = 'Cash' , amount = 1000000 },
    { requires = 12,  type = 'money',    name = 'cash', label = 'Cash' ,                amount = 1000000 },
    { requires = 13,  type = 'money',   name = 'cash',               label = 'Cash',      amount = 1000000 },
    { requires = 14,  type = 'item', name = 'WEAPON_TACTICALDRACO',            label = 'Draco',  amount = 1 },
    { requires = 15,  type = 'vehicle', name = 'alec',            label = 'Bugatti',      amount = 1 },
}
