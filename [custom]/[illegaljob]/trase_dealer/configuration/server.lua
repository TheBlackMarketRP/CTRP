while (not Config) do Wait(100) end

Config.PayType = 'markedbills' -- ESX = "money", "bank", "black_money" | QBCore = "cash", "markedbills"
Config.RandomizePay = false -- If enabled, it will add a random number 1-200
-- Please keep in mind, if you use marked bills disable the option above and change the prices. (QBCore)

Config.Command = {
    Enabled = true,
    Command = 'dealerrank'
}

Config.Drugs = {
    [1] = {
        Label = 'Bag of Meth',
        Item = 'meth',
        Legal = false,
        Price = 500, 
        RequiredAmount = {1, 10}, -- Must have atleast 1 to sale, can sell upto 5. (will pick a # 1-5 randomly)
        DenyChance = 5
    },
    [2] = {
        Label = 'Bag of Coke',
        Item = 'cokebaggy',
        Legal = false,
        Price = 550, 
        RequiredAmount = {1, 10}, -- Must have atleast 1 to sale, can sell upto 5. (will pick a # 1-5 randomly)
        DenyChance = 5
    },
    [3] = {
        Label = 'Bag of Crack',
        Item = 'crack_baggy',
        Legal = false,
        Price = 600, 
        RequiredAmount = {1, 10}, -- Must have atleast 1 to sale, can sell upto 5. (will pick a # 1-5 randomly)
        DenyChance = 5
    },
    [4] = {
        Label = 'Xannax',
        Item = 'xannax',
        Legal = false,
        Price = 600, 
        RequiredAmount = {1, 10}, -- Must have atleast 1 to sale, can sell upto 5. (will pick a # 1-5 randomly)
        DenyChance = 5
    },
    [5] = {
        Label = 'ak 47',
        Item = 'weed_ak47',
        Legal = false,
        Price = 750, 
        RequiredAmount = {1, 10}, -- Must have atleast 1 to sale, can sell upto 5. (will pick a # 1-5 randomly)
        DenyChance = 5
    },
    [6] = {
        Label = 'Tiger Breath',
        Item = 'tiger_breath',
        Legal = false,
        Price = 750, 
        RequiredAmount = {1, 10}, -- Must have atleast 1 to sale, can sell upto 5. (will pick a # 1-5 randomly)
        DenyChance = 5
    },
    [7] = {
        Label = 'OG Kush',
        Item = 'ogkushbag',
        Legal = false,
        Price = 750, 
        RequiredAmount = {1, 10}, -- Must have atleast 1 to sale, can sell upto 5. (will pick a # 1-5 randomly)
        DenyChance = 5
    },
    [8] = {
        Label = 'Leaf Kush',
        Item = 'leafbag',
        Legal = false,
        Price = 750, 
        RequiredAmount = {1, 10}, -- Must have atleast 1 to sale, can sell upto 5. (will pick a # 1-5 randomly)
        DenyChance = 5
    },
    [9] = {
        Label = 'Lean Cup',
        Item = 'leancup',
        Legal = false,
        Price = 1150, 
        RequiredAmount = {1, 10}, -- Must have atleast 1 to sale, can sell upto 5. (will pick a # 1-5 randomly)
        DenyChance = 5
    },
    [10] = {
        Label = 'Shroom Pouch',
        Item = 'shroom_pouch',
        Legal = false,
        Price = 1500, 
        RequiredAmount = {1, 10}, -- Must have atleast 1 to sale, can sell upto 5. (will pick a # 1-5 randomly)
        DenyChance = 5
    },
    [11] = {
        Label = 'Retro 3s',
        Item = 'shoes',
        Legal = true,
        Price = 600, 
        RequiredAmount = {1, 10}, -- Must have atleast 1 to sale, can sell upto 5. (will pick a # 1-5 randomly)
        DenyChance = 5
    },
    
}

Config.Discord = {
    Enabled = false, -- Requires: https://github.com/ImTrase/trase_discord
    ResourceName = 'zdiscord', -- In case you renamed the resource.
    Roles = {
        [1] = {
            RoleID = 1452286929801580625,
            SellPrice = 10 -- Sell 25% more (adds on to the rank)
        }
    }
}