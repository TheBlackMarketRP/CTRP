Config = {}
Config.Locale = 'en'

Config.Inventory = 'ox_inventory' -- 'ak47_inventory', 'ox_inventory', 'qs-inventory', 'codem-inventory', 'origen_inventory', 'tgiann-inventory'

Config.Debug = false

Config.TargetScript = 'qb-target' -- ⚠️Don't change if you are using ox_target

Config.AutoDespawn = 60 --minutes, set false if you want to disable it

Config.Bags = {
	largeoutfitbag = {
		prop = 'reh_prop_reh_bag_outfit_01a',
		slots = 10,
		uniqueBag = true, -- will show specific outfit that player stored, if item lost then outfits will be lost also
		canShare = true,  -- option for bag owner to give access other player to use the bag
	},
	smalloutfitbag = {
		prop = 'bkr_prop_duffel_bag_01a',
		slots = 5,
		uniqueBag = false,
		canShare = false,
	},
}

Config.Defaults = { -- naked clothing ids
	male = {
		mask 	= 0,
        arms 	= 15,
        tshirt 	= 15,
        torso 	= 15,
        chain 	= 0,
        vest 	= 0,
        decals 	= 0,
        bag 	= 0,
        pant 	= 61,
        shoes 	= 34,
	},
	female = {
        ear 	= -1,
        arms 	= 15,
        tshirt 	= 14,
        torso 	= 18,
        chain 	= 0,
        vest 	= 0,
        decals 	= 0,
        bag 	= 0,
        pant 	= 62,
        shoes 	= 35,
	}
}