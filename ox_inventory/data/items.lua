return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			image = 'burger_chicken.png',
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['sprunk'] = {
		label = 'Sprunk',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with a sprunk'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
		client = {
			image = 'card_id.png'
		}
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	["cryptostick"] = {
    label = "Crypto Stick",
    weight = 50,
    stack = false,
	},


	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		allowArmed = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Fleeca Card',
		stack = false,
		weight = 10,
		client = {
			image = 'card_bank.png'
		}
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	["iron"] = {
		label = "Iron",
		weight = 100,
		stack = true,
		close = false,
		description = "Handy piece of metal that you can probably use for something",
		client = {
			image = "iron.png",
		}
	},

	["fat_end_muzzle_brake"] = {
		label = "Fat End Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "fat_end_muzzle_brake.png",
		}
	},

	["dendrogyra_coral"] = {
		label = "Dendrogyra",
		weight = 1000,
		stack = true,
		close = true,
		description = "Its also known as pillar coral",
		client = {
			image = "dendrogyra_coral.png",
		}
	},

	["digicamo_attachment"] = {
		label = "Digital Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A digital camo for a weapon",
		client = {
			image = "digicamo_attachment.png",
		}
	},

	["electronickit"] = {
		label = "Electronic Kit",
		weight = 100,
		stack = true,
		close = true,
		description = "If you've always wanted to build a robot you can maybe start here. Maybe you'll be the new Elon Musk?",
		client = {
			image = "electronickit.png",
		}
	},

	["leopardcamo_attachment"] = {
		label = "Leopard Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A leopard camo for a weapon",
		client = {
			image = "leopardcamo_attachment.png",
		}
	},

	["split_end_muzzle_brake"] = {
		label = "Split End Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "split_end_muzzle_brake.png",
		}
	},

	["bellend_muzzle_brake"] = {
		label = "Bellend Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "bellend_muzzle_brake.png",
		}
	},

	["tirerepairkit"] = {
		label = "Tire Repair Kit",
		weight = 1000,
		stack = true,
		close = true,
		description = "A kit to repair your tires",
		client = {
			image = "tirerepairkit.png",
		}
	},

	["handcuffs"] = {
		label = "Handcuffs",
		weight = 100,
		stack = true,
		close = true,
		description = "Comes in handy when people misbehave. Maybe it can be used for something else?",
		client = {
			image = "handcuffs.png",
		}
	},

	["security_card_02"] = {
		label = "Security Card B",
		weight = 0,
		stack = true,
		close = true,
		description = "A security card... I wonder what it goes to",
		client = {
			image = "security_card_02.png",
		}
	},

	["goldbar"] = {
		label = "Gold Bar",
		weight = 700,
		stack = true,
		close = true,
		description = "Looks pretty expensive to me",
		client = {
			image = "goldbar.png",
		}
	},

	["heavyarmor"] = {
		label = "Heavy Armor",
		weight = 500,
		stack = true,
		close = true,
		description = "Some protection won't hurt... right?",
		client = {
			image = "heavyarmor.png",
		}
	},

	["id_card"] = {
		label = "ID Card",
		weight = 0,
		stack = false,
		close = false,
		description = "A card containing all your information to identify yourself",
		client = {
			image = "id_card.png",
		}
	},

	["driver_license"] = {
		label = "Drivers License",
		weight = 0,
		stack = false,
		close = false,
		description = "Permit to show you can drive a vehicle",
		client = {
			image = "driver_license.png",
		}
	},

	["squared_muzzle_brake"] = {
		label = "Squared Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "squared_muzzle_brake.png",
		}
	},

	["smallscope_attachment"] = {
		label = "Small Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A small scope for a weapon",
		client = {
			image = "smallscope_attachment.png",
		}
	},

	["markedbills"] = {
		label = "Marked Money",
		weight = 0,
		stack = true,
		close = true,
		description = "Money?",
		client = {
			image = "markedbills.png",
		}
	},

	["snikkel_candy"] = {
		label = "Snikkel",
		weight = 100,
		stack = true,
		close = true,
		description = "Some delicious candy :O",
		client = {
			image = "snikkel_candy.png",
		}
	},

	["weed_ak47_seed"] = {
		label = "AK47 Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of AK47",
		client = {
			image = "weed_seed.png",
		}
	},
	

	["newscam"] = {
		label = "News Camera",
		weight = 100,
		stack = false,
		close = true,
		description = "A camera for the news",
		client = {
			image = "newscam.png",
		}
	},

	["slanted_muzzle_brake"] = {
		label = "Slanted Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "slanted_muzzle_brake.png",
		}
	},

	["rolling_paper"] = {
		label = "Rolling Paper",
		weight = 0,
		stack = true,
		close = true,
		description = "Paper made specifically for encasing and smoking tobacco or cannabis.",
		client = {
			image = "rolling_paper.png",
		}
	},

	["tactical_muzzle_brake"] = {
		label = "Tactical Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brakee for a weapon",
		client = {
			image = "tactical_muzzle_brake.png",
		}
	},

	["grip_attachment"] = {
		label = "Grip",
		weight = 1000,
		stack = true,
		close = true,
		description = "A grip for a weapon",
		client = {
			image = "grip_attachment.png",
		}
	},

	["rubber"] = {
		label = "Rubber",
		weight = 100,
		stack = true,
		close = false,
		description = "Rubber, I believe you can make your own rubber ducky with it :D",
		client = {
			image = "rubber.png",
		}
	},

	["meth"] = {
		label = "Meth",
		weight = 100,
		stack = true,
		close = true,
		description = "A baggie of Meth",
		client = {
			image = "meth.png",
		}
	},

	["police_stormram"] = {
		label = "Stormram",
		weight = 18000,
		stack = true,
		close = true,
		description = "A nice tool to break into doors",
		client = {
			image = "police_stormram.png",
		}
	},

	["woodcamo_attachment"] = {
		label = "Woodland Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A woodland camo for a weapon",
		client = {
			image = "woodcamo_attachment.png",
		}
	},

	["luxuryfinish_attachment"] = {
		label = "Luxury Finish",
		weight = 1000,
		stack = true,
		close = true,
		description = "A luxury finish for a weapon",
		client = {
			image = "luxuryfinish_attachment.png",
		}
	},

	["geocamo_attachment"] = {
		label = "Geometric Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A geometric camo for a weapon",
		client = {
			image = "geocamo_attachment.png",
		}
	},

	["sandwich"] = {
		label = "Sandwich",
		weight = 200,
		stack = true,
		close = true,
		description = "Nice bread for your stomach",
		client = {
			image = "sandwich.png",
		}
	},

	["goldchain"] = {
		label = "Golden Chain",
		weight = 1500,
		stack = true,
		close = true,
		description = "A golden chain seems like the jackpot to me!",
		client = {
			image = "goldchain.png",
		}
	},

	["gatecrack"] = {
		label = "Gatecrack",
		weight = 0,
		stack = true,
		close = true,
		description = "Handy software to tear down some fences",
		client = {
			image = "usb_device.png",
		}
	},

	["skullcamo_attachment"] = {
		label = "Skull Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A skull camo for a weapon",
		client = {
			image = "skullcamo_attachment.png",
		}
	},

	["fitbit"] = {
		label = "Fitbit",
		weight = 500,
		stack = false,
		close = true,
		description = "I like fitbit",
		client = {
			image = "fitbit.png",
		}
	},

	["water_bottle"] = {
		label = "Bottle of Water",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "water_bottle.png",
		}
	},

	["patriotcamo_attachment"] = {
		label = "Patriot Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A patriot camo for a weapon",
		client = {
			image = "patriotcamo_attachment.png",
		}
	},

	["coffee"] = {
		label = "Coffee",
		weight = 200,
		stack = true,
		close = true,
		description = "Pump 4 Caffeine",
		client = {
			image = "coffee.png",
		}
	},

	["rolex"] = {
		label = "Golden Watch",
		weight = 1500,
		stack = true,
		close = true,
		description = "A golden watch seems like the jackpot to me!",
		client = {
			image = "rolex.png",
		}
	},

	["tosti"] = {
		label = "Grilled Cheese Sandwich",
		weight = 200,
		stack = true,
		close = true,
		description = "Nice to eat",
		client = {
			image = "tosti.png",
		}
	},

	["aluminum"] = {
		label = "Aluminium",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "aluminum.png",
		}
	},

	["weed_brick"] = {
		label = "Weed Brick",
		weight = 1000,
		stack = true,
		close = true,
		description = "1KG Weed Brick to sell to large customers.",
		client = {
			image = "weed_brick.png",
		}
	},

	["bank_card"] = {
		label = "Bank Card",
		weight = 0,
		stack = false,
		close = true,
		description = "Used to access ATM",
		client = {
			image = "bank_card.png",
		}
	},

	["drum_attachment"] = {
		label = "Drum",
		weight = 1000,
		stack = true,
		close = true,
		description = "A drum for a weapon",
		client = {
			image = "drum_attachment.png",
		}
	},

	-- ["cryptostick"] = {
	-- 	label = "Crypto Stick",
	-- 	weight = 200,
	-- 	stack = false,
	-- 	close = true,
	-- 	description = "Why would someone ever buy money that doesn't exist.. How many would it contain..?",
	-- 	client = {
	-- 		image = "cryptostick.png",
	-- 	}
	-- },

	["casinochips"] = {
		label = "Casino Chips",
		weight = 0,
		stack = true,
		close = false,
		description = "Chips For Casino Gambling",
		client = {
			image = "casinochips.png",
		}
	},

	["veh_neons"] = {
		label = "Neons",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle neons",
		client = {
			image = "veh_neons.png",
		}
	},

	["oxy"] = {
		label = "Prescription Oxy",
		weight = 0,
		stack = true,
		close = true,
		description = "The Label Has Been Ripped Off",
		client = {
			image = "oxy.png",
		}
	},

	["firework2"] = {
		label = "Poppelers",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework2.png",
		}
	},

	["trojan_usb"] = {
		label = "Trojan USB",
		weight = 0,
		stack = true,
		close = true,
		description = "Handy software to shut down some systems",
		client = {
			image = "usb_device.png",
		}
	},

	["stickynote"] = {
		label = "Sticky note",
		weight = 0,
		stack = false,
		close = false,
		description = "Sometimes handy to remember something :)",
		client = {
			image = "stickynote.png",
		}
	},

	["precision_muzzle_brake"] = {
		label = "Precision Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "precision_muzzle_brake.png",
		}
	},

	["firework4"] = {
		label = "Weeping Willow",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework4.png",
		}
	},

	["attachment_bench"] = {
		label = "Attachment Workbench",
		weight = 15000,
		stack = false,
		close = false,
		description = "A workbench for crafting attachments.",
		client = {
			image = "attworkbench.png",
		}
	},

	["twerks_candy"] = {
		label = "Twerks",
		weight = 100,
		stack = true,
		close = true,
		description = "Some delicious candy :O",
		client = {
			image = "twerks_candy.png",
		}
	},

	["diving_fill"] = {
		label = "Diving Tube",
		weight = 3000,
		stack = false,
		close = true,
		description = "An oxygen tube and a rebreather",
		client = {
			image = "diving_tube.png",
		}
	},

	["radioscanner"] = {
		label = "Radio Scanner",
		weight = 1000,
		stack = true,
		close = true,
		description = "With this you can get some police alerts. Not 100% effective however",
		client = {
			image = "radioscanner.png",
		}
	},

	["veh_interior"] = {
		label = "Interior",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle interior",
		client = {
			image = "veh_interior.png",
		}
	},

	["ironoxide"] = {
		label = "Iron Powder",
		weight = 100,
		stack = true,
		close = false,
		description = "Some powder to mix with.",
		client = {
			image = "ironoxide.png",
		}
	},

	["tenkgoldchain"] = {
		label = "10k Gold Chain",
		weight = 2000,
		stack = true,
		close = true,
		description = "10 carat golden chain",
		client = {
			image = "10kgoldchain.png",
		}
	},

	["cokebaggy"] = {
		label = "Bag of Coke",
		weight = 100,
		stack = true,
		close = true,
		description = "To get happy real quick",
		client = {
			image = "cokebaggy.png",
		}
	},
	
	["rawmeth"] = {
		label = "Raw Meth",
		weight = 100,
		stack = true,
		close = true,
		description = "Raw Meth",
		client = {
			image = "rawmeth.png",
		}
	},

	["weed_skunk_seed"] = {
		label = "Skunk Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Skunk",
		client = {
			image = "weed_seed.png",
		}
	},

	["nvscope_attachment"] = {
		label = "Night Vision Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A night vision scope for a weapon",
		client = {
			image = "nvscope_attachment.png",
		}
	},

	["laptop"] = {
		label = "Laptop",
		weight = 4000,
		stack = true,
		close = true,
		description = "Expensive laptop",
		client = {
			image = "laptop.png",
		}
	},

	["boomcamo_attachment"] = {
		label = "Boom Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A boom camo for a weapon",
		client = {
			image = "boomcamo_attachment.png",
		}
	},

	["aluminumoxide"] = {
		label = "Aluminium Powder",
		weight = 100,
		stack = true,
		close = false,
		description = "Some powder to mix with",
		client = {
			image = "aluminumoxide.png",
		}
	},

	["suppressor_attachment"] = {
		label = "Suppressor",
		weight = 1000,
		stack = true,
		close = true,
		description = "A suppressor for a weapon",
		client = {
			image = "suppressor_attachment.png",
		}
	},

	["firstaid"] = {
		label = "First Aid",
		weight = 2500,
		stack = true,
		close = true,
		description = "You can use this First Aid kit to get people back on their feet",
		client = {
			image = "firstaid.png",
		}
	},

	["weed_amnesia_seed"] = {
		label = "Amnesia Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Amnesia",
		client = {
			image = "weed_seed.png",
		}
	},

	["security_card_01"] = {
		label = "Security Card A",
		weight = 0,
		stack = true,
		close = true,
		description = "A security card... I wonder what it goes to",
		client = {
			image = "security_card_01.png",
		}
	},

	["tunerlaptop"] = {
		label = "Tunerchip",
		weight = 2000,
		stack = false,
		close = true,
		description = "With this tunerchip you can get your car on steroids... If you know what you're doing",
		client = {
			image = "tunerchip.png",
		}
	},

	["weed_purplehaze"] = {
		label = "Purple Haze 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Purple Haze",
		client = {
			image = "weed_baggy.png",
		}
	},

	["repairkit"] = {
		label = "Repairkit",
		weight = 2500,
		stack = true,
		close = true,
		description = "A nice toolbox with stuff to repair your vehicle",
		client = {
			image = "repairkit.png",
		}
	},

	["coke_brick"] = {
		label = "Coke Brick",
		weight = 1000,
		stack = false,
		close = true,
		description = "Heavy package of cocaine, mostly used for deals and takes a lot of space",
		client = {
			image = "coke_brick.png",
		}
	},

	["lighter"] = {
		label = "Lighter",
		weight = 0,
		stack = true,
		close = true,
		description = "On new years eve a nice fire to stand next to",
		client = {
			image = "lighter.png",
		}
	},

	["weed_whitewidow_seed"] = {
		label = "White Widow Seed",
		weight = 0,
		stack = true,
		close = false,
		description = "A weed seed of White Widow",
		client = {
			image = "weed_seed.png",
		}
	},

	["heavy_duty_muzzle_brake"] = {
		label = "HD Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "heavy_duty_muzzle_brake.png",
		}
	},

	["kurkakola"] = {
		label = "Cola",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "cola.png",
		}
	},

	["joint"] = {
		label = "Joint",
		weight = 0,
		stack = true,
		close = true,
		description = "Sidney would be very proud at you",
		client = {
			image = "joint.png",
		}
	},

	["veh_transmission"] = {
		label = "Transmission",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle transmission",
		client = {
			image = "veh_transmission.png",
		}
	},

	["antipatharia_coral"] = {
		label = "Antipatharia",
		weight = 1000,
		stack = true,
		close = true,
		description = "Its also known as black corals or thorn corals",
		client = {
			image = "antipatharia_coral.png",
		}
	},

	["armor"] = {
		label = "Armor",
		weight = 5000,
		stack = true,
		close = true,
		description = "Some protection won't hurt... right?",
		client = {
			image = "armor.png",
		}
	},

	["veh_tint"] = {
		label = "Tints",
		weight = 1000,
		stack = true,
		close = true,
		description = "Install vehicle tint",
		client = {
			image = "veh_tint.png",
		}
	},

	["diamond"] = {
		label = "Diamond",
		weight = 1000,
		stack = true,
		close = true,
		description = "A diamond seems like the jackpot to me!",
		client = {
			image = "diamond.png",
		}
	},

	["labkey"] = {
		label = "Key",
		weight = 500,
		stack = false,
		close = true,
		description = "Key for a lock...?",
		client = {
			image = "labkey.png",
		}
	},

	["medscope_attachment"] = {
		label = "Medium Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A medium scope for a weapon",
		client = {
			image = "medscope_attachment.png",
		}
	},

	["weed_nutrition"] = {
		label = "Plant Fertilizer",
		weight = 2000,
		stack = true,
		close = true,
		description = "Plant nutrition",
		client = {
			image = "weed_nutrition.png",
		}
	},

	["barrel_attachment"] = {
		label = "Barrel",
		weight = 1000,
		stack = true,
		close = true,
		description = "A barrel for a weapon",
		client = {
			image = "barrel_attachment.png",
		}
	},

	["iphone"] = {
		label = "iPhone",
		weight = 1000,
		stack = true,
		close = true,
		description = "Very expensive phone",
		client = {
			image = "iphone.png",
		}
	},

	["vodka"] = {
		label = "Vodka",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "vodka.png",
		}
	},

	["item_bench"] = {
		label = "Workbench",
		weight = 15000,
		stack = false,
		close = false,
		description = "A workbench to craft items.",
		client = {
			image = "workbench.png",
		}
	},

	["drill"] = {
		label = "Drill",
		weight = 20000,
		stack = true,
		close = false,
		description = "The real deal...",
		client = {
			image = "drill.png",
		}
	},

	["advancedrepairkit"] = {
		label = "Advanced Repairkit",
		weight = 4000,
		stack = true,
		close = true,
		description = "A nice toolbox with stuff to repair your vehicle",
		client = {
			image = "advancedkit.png",
		}
	},

	["veh_plates"] = {
		label = "Plates",
		weight = 1000,
		stack = true,
		close = true,
		description = "Install vehicle plates",
		client = {
			image = "veh_plates.png",
		}
	},

	["newsmic"] = {
		label = "News Microphone",
		weight = 100,
		stack = false,
		close = true,
		description = "A microphone for the news",
		client = {
			image = "newsmic.png",
		}
	},

	["weed_ak47"] = {
		label = "AK47 2g",
		weight = 0,
		stack = true,
		close = false,
		description = "A weed bag with 2g AK47",
		client = {
			image = "weed_ak47.png",
		}
	},
	["plugbrick"] = {
		label = "Plug Brick",
		weight = 0,
		stack = true,
		close = false,
		description = "Take to the trap house",
		client = {
			image = "plugbrick.png",
		}
	},
	

	["xtcbaggy"] = {
		label = "Bag of XTC",
		weight = 0,
		stack = true,
		close = true,
		description = "Pop those pills baby",
		client = {
			image = "xtc_baggy.png",
		}
	},

	["binoculars"] = {
		label = "Binoculars",
		weight = 600,
		stack = true,
		close = true,
		description = "Sneaky Breaky...",
		client = {
			image = "binoculars.png",
		}
	},

	["veh_toolbox"] = {
		label = "Toolbox",
		weight = 1000,
		stack = true,
		close = true,
		description = "Check vehicle status",
		client = {
			image = "veh_toolbox.png",
		}
	},

	["thermite"] = {
		label = "Thermite",
		weight = 1000,
		stack = true,
		close = true,
		description = "Sometimes you'd wish for everything to burn",
		client = {
			image = "thermite.png",
		}
	},

	["newsbmic"] = {
		label = "Boom Microphone",
		weight = 100,
		stack = false,
		close = true,
		description = "A Useable BoomMic",
		client = {
			image = "newsbmic.png",
		}
	},

	["veh_suspension"] = {
		label = "Suspension",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle suspension",
		client = {
			image = "veh_suspension.png",
		}
	},

	["firework1"] = {
		label = "2Brothers",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework1.png",
		}
	},

	["sessantacamo_attachment"] = {
		label = "Sessanta Nove Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A sessanta nove camo for a weapon",
		client = {
			image = "sessantacamo_attachment.png",
		}
	},

	["copper"] = {
		label = "Copper",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "copper.png",
		}
	},

	["veh_exterior"] = {
		label = "Exterior",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle exterior",
		client = {
			image = "veh_exterior.png",
		}
	},

	["beer"] = {
		label = "Beer",
		weight = 500,
		stack = true,
		close = true,
		description = "Nothing like a good cold beer!",
		client = {
			image = "beer.png",
		}
	},

	["screwdriverset"] = {
		label = "Toolkit",
		weight = 1000,
		stack = true,
		close = false,
		description = "Very useful to screw... screws...",
		client = {
			image = "screwdriverset.png",
		}
	},

	["flat_muzzle_brake"] = {
		label = "Flat Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "flat_muzzle_brake.png",
		}
	},

	["steel"] = {
		label = "Steel",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "steel.png",
		}
	},

	["whiskey"] = {
		label = "Whiskey",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "whiskey.png",
		}
	},

	["empty_weed_bag"] = {
		label = "Empty Weed Bag",
		weight = 0,
		stack = true,
		close = true,
		description = "A small empty bag",
		client = {
			image = "weed_baggy_empty.png",
		}
	},

	["perseuscamo_attachment"] = {
		label = "Perseus Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A perseus camo for a weapon",
		client = {
			image = "perseuscamo_attachment.png",
		}
	},

	["pinger"] = {
		label = "Pinger",
		weight = 1000,
		stack = true,
		close = true,
		description = "With a pinger and your phone you can send out your location",
		client = {
			image = "pinger.png",
		}
	},

	["veh_wheels"] = {
		label = "Wheels",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle wheels",
		client = {
			image = "veh_wheels.png",
		}
	},

	["holoscope_attachment"] = {
		label = "Holo Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A holo scope for a weapon",
		client = {
			image = "holoscope_attachment.png",
		}
	},

	["weed_purplehaze_seed"] = {
		label = "Purple Haze Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Purple Haze",
		client = {
			image = "weed_seed.png",
		}
	},

	["zebracamo_attachment"] = {
		label = "Zebra Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A zebra camo for a weapon",
		client = {
			image = "zebracamo_attachment.png",
		}
	},

	["printerdocument"] = {
		label = "Document",
		weight = 500,
		stack = false,
		close = true,
		description = "A nice document",
		client = {
			image = "printerdocument.png",
		}
	},

	["walkstick"] = {
		label = "Walking Stick",
		weight = 1000,
		stack = true,
		close = true,
		description = "Walking stick for ya'll grannies out there.. HAHA",
		client = {
			image = "walkstick.png",
		}
	},

	["wine"] = {
		label = "Wine",
		weight = 300,
		stack = true,
		close = false,
		description = "Some good wine to drink on a fine evening",
		client = {
			image = "wine.png",
		}
	},

	["tablet"] = {
		label = "Tablet",
		weight = 2000,
		stack = true,
		close = true,
		description = "Expensive tablet",
		client = {
			image = "tablet.png",
		}
	},

	["metalscrap"] = {
		label = "Metal Scrap",
		weight = 100,
		stack = true,
		close = false,
		description = "You can probably make something nice out of this",
		client = {
			image = "metalscrap.png",
		}
	},

	["veh_xenons"] = {
		label = "Xenons",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle xenons",
		client = {
			image = "veh_xenons.png",
		}
	},

	["veh_turbo"] = {
		label = "Turbo",
		weight = 1000,
		stack = true,
		close = true,
		description = "Install vehicle turbo",
		client = {
			image = "veh_turbo.png",
		}
	},

	["diving_gear"] = {
		label = "Diving Gear",
		weight = 30000,
		stack = false,
		close = true,
		description = "An oxygen tank and a rebreather",
		client = {
			image = "diving_gear.png",
		}
	},

	["samsungphone"] = {
		label = "Samsung S10",
		weight = 1000,
		stack = true,
		close = true,
		description = "Very expensive phone",
		client = {
			image = "samsungphone.png",
		}
	},

	["comp_attachment"] = {
		label = "Compensator",
		weight = 1000,
		stack = true,
		close = true,
		description = "A compensator for a weapon",
		client = {
			image = "comp_attachment.png",
		}
	},

	["brushcamo_attachment"] = {
		label = "Brushstroke Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A brushstroke camo for a weapon",
		client = {
			image = "brushcamo_attachment.png",
		}
	},

	["grapejuice"] = {
		label = "Grape Juice",
		weight = 200,
		stack = true,
		close = false,
		description = "Grape juice is said to be healthy",
		client = {
			image = "grapejuice.png",
		}
	},

	["grape"] = {
		label = "Grape",
		weight = 100,
		stack = true,
		close = false,
		description = "Mmmmh yummie, grapes",
		client = {
			image = "grape.png",
		}
	},

	["ifaks"] = {
		label = "ifaks",
		weight = 200,
		stack = true,
		close = true,
		description = "ifaks for healing and a complete stress remover.",
		client = {
			image = "ifaks.png",
		}
	},

	["crack_baggy"] = {
		label = "Bag of Crack",
		weight = 100,
		stack = true,
		close = true,
		description = "To get happy faster",
		client = {
			image = "crack_baggy.png",
		}
	},
	
	["filled_evidence_bag"] = {
		label = "Evidence Bag",
		weight = 200,
		stack = false,
		close = false,
		description = "A filled evidence bag to see who committed the crime >:(",
		client = {
			image = "evidence.png",
		}
	},

	["diamond_ring"] = {
		label = "Diamond Ring",
		weight = 1500,
		stack = true,
		close = true,
		description = "A diamond ring seems like the jackpot to me!",
		client = {
			image = "diamond_ring.png",
		}
	},

	["largescope_attachment"] = {
		label = "Large Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A large scope for a weapon",
		client = {
			image = "largescope_attachment.png",
		}
	},

	["advscope_attachment"] = {
		label = "Advanced Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "An advanced scope for a weapon",
		client = {
			image = "advscope_attachment.png",
		}
	},

	["cleaningkit"] = {
		label = "Cleaning Kit",
		weight = 250,
		stack = true,
		close = true,
		description = "A microfiber cloth with some soap will let your car sparkle again!",
		client = {
			image = "cleaningkit.png",
		}
	},

	["painkillers"] = {
		label = "Painkillers",
		weight = 0,
		stack = true,
		close = true,
		description = "For pain you can't stand anymore, take this pill that'd make you feel great again",
		client = {
			image = "painkillers.png",
		}
	},

	["plastic"] = {
		label = "Plastic",
		weight = 100,
		stack = true,
		close = false,
		description = "RECYCLE! - Greta Thunberg 2019",
		client = {
			image = "plastic.png",
		}
	},

	["nitrous"] = {
		label = "Nitrous",
		weight = 1000,
		stack = true,
		close = true,
		description = "Speed up, gas pedal! :D",
		client = {
			image = "nitrous.png",
		}
	},

	["weed_amnesia"] = {
		label = "Amnesia Haze",
		weight = 10,
		stack = true,
		close = false,
		description = "gdz weed",
		client = {
			image = "weed_amnesia.png",
		}
	},

	["lawyerpass"] = {
		label = "Lawyer Pass",
		weight = 0,
		stack = false,
		close = false,
		description = "Pass exclusive to lawyers to show they can represent a suspect",
		client = {
			image = "lawyerpass.png",
		}
	},

	["empty_evidence_bag"] = {
		label = "Empty Evidence Bag",
		weight = 0,
		stack = true,
		close = false,
		description = "Used a lot to keep DNA from blood, bullet shells and more",
		client = {
			image = "evidence.png",
		}
	},

	["weed_ogkush"] = {
		label = "OGKush 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g OG Kush",
		client = {
			image = "weed_baggy.png",
		}
	},

	["veh_engine"] = {
		label = "Engine",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle engine",
		client = {
			image = "veh_engine.png",
		}
	},

	["flashlight_attachment"] = {
		label = "Flashlight",
		weight = 1000,
		stack = true,
		close = true,
		description = "A flashlight for a weapon",
		client = {
			image = "flashlight_attachment.png",
		}
	},

	["advancedlockpick"] = {
		label = "Advanced Lockpick",
		weight = 500,
		stack = true,
		close = true,
		description = "If you lose your keys a lot this is very useful... Also useful to open your beers",
		client = {
			image = "advancedlockpick.png",
		}
	},

	["firework3"] = {
		label = "WipeOut",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework3.png",
		}
	},

	["jerry_can"] = {
		label = "Jerrycan 20L",
		weight = 20000,
		stack = true,
		close = true,
		description = "A can full of Fuel",
		client = {
			image = "jerry_can.png",
		}
	},

	["harness"] = {
		label = "Race Harness",
		weight = 1000,
		stack = false,
		close = true,
		description = "Racing Harness so no matter what you stay in the car",
		client = {
			image = "harness.png",
		}
	},

	["weaponlicense"] = {
		label = "Weapon License",
		weight = 0,
		stack = false,
		close = true,
		description = "Weapon License",
		client = {
			image = "weapon_license.png",
		}
	},

	["veh_armor"] = {
		label = "Armor",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle armor",
		client = {
			image = "veh_armor.png",
		}
	},

	["clip_attachment"] = {
		label = "Clip",
		weight = 1000,
		stack = true,
		close = true,
		description = "A clip for a weapon",
		client = {
			image = "clip_attachment.png",
		}
	},

	["coke_small_brick"] = {
		label = "Coke Package",
		weight = 350,
		stack = false,
		close = true,
		description = "Small package of cocaine, mostly used for deals and takes a lot of space",
		client = {
			image = "coke_small_brick.png",
		}
	},

	["weed_whitewidow"] = {
		label = "White Widow 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g White Widow",
		client = {
			image = "weed_baggy.png",
		}
	},

	["weed_skunk"] = {
		label = "Skunk 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Skunk",
		client = {
			image = "weed_baggy.png",
		}
	},

	["thermalscope_attachment"] = {
		label = "Thermal Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A thermal scope for a weapon",
		client = {
			image = "thermalscope_attachment.png",
		}
	},

	["weed_ogkush_seed"] = {
		label = "OGKush Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of OG Kush",
		client = {
			image = "weed_seed.png",
		}
	},

	["veh_brakes"] = {
		label = "Brakes",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle brakes",
		client = {
			image = "veh_brakes.png",
		}
	},

	["certificate"] = {
		label = "Certificate",
		weight = 0,
		stack = true,
		close = true,
		description = "Certificate that proves you own certain stuff",
		client = {
			image = "certificate.png",
		}
	},

	["glass"] = {
		label = "Glass",
		weight = 100,
		stack = true,
		close = false,
		description = "It is very fragile, watch out",
		client = {
			image = "glass.png",
		}
	},

	["moneybag"] = {
		label = "Money Bag",
		weight = 0,
		stack = false,
		close = true,
		description = "A bag with cash",
		client = {
			image = "moneybag.png",
		}
	},
	["bobby_pin"] = {
		label = "Bobby Pin",
		weight = 2500,
		stack = true,
		close = true,
		description = "Can be used as a makeshift tool for picking locks",
		client = {
			image = "bobby_pin.png",
		}
	},
	["tracking_bracelet"] = {
		label = "Tracking Bracelet",
		weight = 2500,
		stack = true,
		close = true,
		description = "Can be used for tracking a suspect",
		client = {
			image = "tracking_bracelet.png",
		}
	},
	
	

	["perc30"] = {
		label = "Percocet 30MG",
		weight = 2,
		stack = true,
		close = true,
		description = "A controlled substance to control pain",
		client = {
			image = "perc30.png",
		}
	},

	["bgasbottles"] = {
		label = "Galaxy Gas",
		weight = 500,
		allowArmed = true,
		stack = true,
		close = true,
		description = "Strawberry",
		client = {
			image = "strawberry.png",
		}
	},

	["bgasbottlef"] = {
		label = "Galaxy Gas",
		weight = 500,
		allowArmed = true,
		stack = true,
		close = true,
		description = "Freedom",
		client = {
			image = "freedom.png",
		}
	},

	["morphine30"] = {
		label = "Morphine 30MG",
		weight = 2,
		stack = true,
		close = true,
		description = "A controlled substance to control pain",
		client = {
			image = "morphine30.png",
		}
	},

	["perc5"] = {
		label = "Percocet 5MG",
		weight = 2,
		stack = true,
		close = true,
		description = "A controlled substance to control pain",
		client = {
			image = "perc5.png",
		}
	},

	["burncream"] = {
		label = "Burn Cream",
		weight = 125,
		stack = true,
		close = true,
		description = "To help with burns",
		client = {
			image = "burncream.png",
		}
	},

	["medikit"] = {
		label = "Medical Kit",
		weight = 110,
		stack = true,
		close = true,
		description = "A first aid kit for healing injured people.",
		client = {
			image = "medikit.png",
		}
	},

	["perc10"] = {
		label = "Percocet 10MG",
		weight = 2,
		stack = true,
		close = true,
		description = "A controlled substance to control pain",
		client = {
			image = "perc10.png",
		}
	},

	["medbag"] = {
		label = "Medical Bag",
		weight = 2500,
		stack = true,
		close = true,
		description = "A bag of medic tools",
		client = {
			image = "medbag.png",
		}
	},

	["sedative"] = {
		label = "Sedative",
		weight = 20,
		stack = true,
		close = true,
		description = "If needed, this will sedate patient",
		client = {
			image = "sedative.png",
		}
	},

	["vic5"] = {
		label = "Vicodin 5MG",
		weight = 2,
		stack = true,
		close = true,
		description = "A controlled substance to control pain",
		client = {
			image = "vic5.png",
		}
	},

	["vic10"] = {
		label = "Vicodin 10MG",
		weight = 2,
		stack = true,
		close = true,
		description = "A controlled substance to control pain",
		client = {
			image = "vic10.png",
		}
	},

	["bgasbottlet"] = {
		label = "Galaxy Gas",
		weight = 500,
		allowArmed = true,
		stack = true,
		close = true,
		description = "tropical",
		client = {
			image = "tropical.png",
		}
	},

	["defib"] = {
		label = "Defibrillator",
		weight = 1120,
		stack = true,
		close = true,
		description = "Used to revive patients",
		client = {
			image = "defib.png",
		}
	},

	["icepack"] = {
		label = "Ice Pack",
		weight = 110,
		stack = true,
		close = true,
		description = "To help reduce swelling",
		client = {
			image = "icepack.png",
		}
	},

	["bgasbottleb"] = {
		label = "Galaxy Gas",
		weight = 500,
		allowArmed = true,
		stack = true,
		close = true,
		description = "Blueberry",
		client = {
			image = "blueberry.png",
		}
	},

	["tweezers"] = {
		label = "Tweezers",
		weight = 50,
		stack = true,
		close = true,
		description = "For picking out bullets",
		client = {
			image = "tweezers.png",
		}
	},

	["suturekit"] = {
		label = "Suture Kit",
		weight = 60,
		stack = true,
		close = true,
		description = "For stitching your patients",
		client = {
			image = "suturekit.png",
		}
	},

	["morphine15"] = {
		label = "Morphine 15MG",
		weight = 2,
		stack = true,
		close = true,
		description = "A controlled substance to control pain",
		client = {
			image = "morphine15.png",
		}
	},

	["rosy_dunes"] = {
		label = "Rosy Dunes",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "rosy_dunes.png",
		}
	},

	["seed_weed"] = {
		label = "Weed Seed",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "seed_weed.png",
		}
	},

	["vapor_essence"] = {
		label = "Vapor Essence",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "vapor_essence.png",
		}
	},

	["golden_biscuit"] = {
		label = "Golden Biscuit",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "golden_biscuit.png",
		}
	},

	["rosy_dunes_joint"] = {
		label = "Rosy Dunes Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "rosy_dunes_joint.png",
		}
	},

	["frosty_phantom"] = {
		label = "Frosty Phantom",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "frosty_phantom.png",
		}
	},

	["endurance_blend_joint"] = {
		label = "Endurance Blend Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "endurance_blend_joint.png",
		}
	},

	["cafe_icecube"] = {
		label = "Ice Cube",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "cafe_icecube.png",
		}
	},

	["hightimebrownies"] = {
		label = "HighTime Brownies",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "hightimebrownies.png",
		}
	},

	["snowberry_gelato"] = {
		label = "Snowberry Gelato",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "snowberry_gelato.png",
		}
	},

	["runs_elite"] = {
		label = "Runs Elite",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "runs_elite.png",
		}
	},

	["weed_fertilizer"] = {
		label = "Weed Fertilizer",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "weed_fertilizer.png",
		}
	},

	["summit_og"] = {
		label = "Summit OG",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "summit_og.png",
		}
	},

	["lunar_stone"] = {
		label = "Lunar Stone",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "lunar_stone.png",
		}
	},

	["cafe_bluecuracao"] = {
		label = "Blue Curacao",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "cafe_bluecuracao.png",
		}
	},

	["collins_way_joint"] = {
		label = "Collins Way Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "collins_way_joint.png",
		}
	},

	["choco_creme"] = {
		label = "Choco Creme",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "choco_creme.png",
		}
	},

	["cafe_whisky"] = {
		label = "Whisky",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "cafe_whisky.png",
		}
	},

	["vapor_essence_joint"] = {
		label = "Vapor Essence Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "vapor_essence_joint.png",
		}
	},

	["spiky_pear"] = {
		label = "Spiky Pear",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "spiky_pear.png",
		}
	},

	["backroots_grape"] = {
		label = "Backroots Grape",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "backroots_grape.png",
		}
	},

	["cheap_lighter"] = {
		label = "Cheap Lighter",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "cheap_lighter.png",
		}
	},

	["weed_pot"] = {
		label = "Weed Pot",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "weed_pot.png",
		}
	},

	["bio_crunch_joint"] = {
		label = "Bio Crunch Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "bio_crunch_joint.png",
		}
	},

	["snowberry_gelato_joint"] = {
		label = "Snowberry Gelato Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "snowberry_gelato_joint.png",
		}
	},

	["peach_cobbler_joint"] = {
		label = "Peach Cobbler Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "peach_cobbler_joint.png",
		}
	},

	["grain_cream"] = {
		label = "Grain Cream",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "grain_cream.png",
		}
	},

	["golden_crumble"] = {
		label = "Golden Crumble",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "golden_crumble.png",
		}
	},

	["glacatti_joint"] = {
		label = "Glacatti Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "glacatti_joint.png",
		}
	},

	["zen_blend"] = {
		label = "Zen Blend",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "zen_blend.png",
		}
	},

	["backroots_creamy_blend"] = {
		label = "Backroots Creamy Blend",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "backroots_creamy_blend.png",
		}
	},

	["zen_blend_joint"] = {
		label = "Zen Blend Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "zen_blend_joint.png",
		}
	},

	["hary_payton"] = {
		label = "Hary Payton",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "hary_payton.png",
		}
	},

	["banana_backroots"] = {
		label = "Banana Backroots",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "banana_backroots.png",
		}
	},

	["crisp_gelato"] = {
		label = "Crisp Gelato",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "crisp_gelato.png",
		}
	},

	["cafe_redwine"] = {
		label = "Redwine",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "cafe_redwine.png",
		}
	},

	["pure_runs"] = {
		label = "Pure Runs",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "pure_runs.png",
		}
	},

	["choco_creme_joint"] = {
		label = "Choco Creme Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "choco_creme_joint.png",
		}
	},

	["frosties_blend"] = {
		label = "Frosties Blend",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "frosties_blend.png",
		}
	},

	["azure_tomyz"] = {
		label = "Azure Tomyz",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "azure_tomyz.png",
		}
	},

	["chroniccrunchcookies"] = {
		label = "Chronic Crunch Cookies",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "chroniccrunchcookies.png",
		}
	},

	["weed_spray"] = {
		label = "Weed Spray",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "weed_spray.png",
		}
	},

	["vape"] = {
		label = "Vape",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "vape.png",
		}
	},

	["royal_haze_joint"] = {
		label = "Royal Haze Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "royal_haze_joint.png",
		}
	},

	["pure_cone_king"] = {
		label = "Pure Cone King",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "pure_cone_king.png",
		}
	},

	["summit_og_joint"] = {
		label = "Summit OG Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "summit_og_joint.png",
		}
	},

	["sunset_secret_joint"] = {
		label = "Sunset Secret Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "sunset_secret_joint.png",
		}
	},

	["crisp_gelato_joint"] = {
		label = "Crisp Gelato Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "crisp_gelato_joint.png",
		}
	},

	["kushkrisps"] = {
		label = "Kush Krisps",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "kushkrisps.png",
		}
	},

	["blend_99"] = {
		label = "Blend 99",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "blend_99.png",
		}
	},

	["cafe_limejuice"] = {
		label = "Lime juice",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "cafe_limejuice.png",
		}
	},

	["herbaldelightgummies"] = {
		label = "Herbal Delight Gummies",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "herbaldelightgummies.png",
		}
	},

	["tangy_fuel_joint"] = {
		label = "Tangy Fuel Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "tangy_fuel_joint.png",
		}
	},

	["peach_cobbler"] = {
		label = "Peach Cobbler",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "peach_cobbler.png",
		}
	},

	["cafe_whitewine"] = {
		label = "Whitewine",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "cafe_whitewine.png",
		}
	},

	["graba_wrap"] = {
		label = "Graba Wrap",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "graba_wrap.png",
		}
	},

	["pastry_blend_joint"] = {
		label = "Pastry Blend Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "pastry_blend_joint.png",
		}
	},

	["berry_muffin_joint"] = {
		label = "Berry Muffin Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "berry_muffin_joint.png",
		}
	},

	["frosties_blend_joint"] = {
		label = "Frosties Blend Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "frosties_blend_joint.png",
		}
	},

	["sunset_secret"] = {
		label = "Sunset Secret",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "sunset_secret.png",
		}
	},

	["fluffy_og_joint"] = {
		label = "Fluffy OG Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "fluffy_og_joint.png",
		}
	},

	["biscuit_bliss"] = {
		label = "Biscuit Bliss",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "biscuit_bliss.png",
		}
	},

	["endurance_blend"] = {
		label = "Endurance Blend",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "endurance_blend.png",
		}
	},

	["fluffy_crunch"] = {
		label = "Fluffy Crunch",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "fluffy_crunch.png",
		}
	},

	["pastry_blend"] = {
		label = "Pastry Blend",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "pastry_blend.png",
		}
	},

	["grain_cream_joint"] = {
		label = "Grain Cream Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "grain_cream_joint.png",
		}
	},

	["pure_runs_joint"] = {
		label = "Pure Runs Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "pure_runs_joint.png",
		}
	},

	["cafe_champagne"] = {
		label = "Champagne",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "cafe_champagne.png",
		}
	},

	["elegant_porcelain_joint"] = {
		label = "Elegant Porcelain Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "elegant_porcelain_joint.png",
		}
	},

	["lunar_stone_joint"] = {
		label = "Lunar Stone Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "lunar_stone_joint.png",
		}
	},

	["citrus_crumble"] = {
		label = "Citrus Crumble",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "citrus_crumble.png",
		}
	},

	["azure_tomyz_joint"] = {
		label = "Azure Tomyz Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "azure_tomyz_joint.png",
		}
	},

	["fluffy_og"] = {
		label = "Fluffy OG",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "fluffy_og.png",
		}
	},

	["wild_feline"] = {
		label = "Wild Feline",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "wild_feline.png",
		}
	},

	["royal_haze"] = {
		label = "Royal Haze",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "royal_haze.png",
		}
	},

	["pooch_bag"] = {
		label = "Pooch Bag",
		weight = 0,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "pooch_bag.png",
		}
	},

	["boss_blend_joint"] = {
		label = "Boss Blend Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "boss_blend_joint.png",
		}
	},

	["cafe_coffeebean"] = {
		label = "Coffee Bean",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "cafe_coffeebean.png",
		}
	},

	["clover_crunch"] = {
		label = "Clover Crunch",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "clover_crunch.png",
		}
	},

	["preston_pearl_cigars"] = {
		label = "Preston Pearl Cigars",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "preston_pearl_cigars.png",
		}
	},

	["cafe_sodawater"] = {
		label = "Soda Water",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "cafe_sodawater.png",
		}
	},

	["cafe_lemonade"] = {
		label = "Lemonade",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "cafe_lemonade.png",
		}
	},

	["bio_crunch"] = {
		label = "Bio Crunch",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "bio_crunch.png",
		}
	},

	["cafe_shaker"] = {
		label = "Shaker",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "cafe_shaker.png",
		}
	},

	["spiced_crumble"] = {
		label = "Spiced Crumble",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "spiced_crumble.png",
		}
	},

	["weed_leaf"] = {
		label = "Weed Leaf",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "weed_leaf.png",
		}
	},

	["frosted_delight"] = {
		label = "Frosted Delight",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "frosted_delight.png",
		}
	},

	["cafe_khusbloom"] = {
		label = "Dry Khus Bloom",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "cafe_khusbloom.png",
		}
	},

	["hary_payton_joint"] = {
		label = "Hary Payton Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "hary_payton_joint.png",
		}
	},

	["collins_way"] = {
		label = "Collins Way",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "collins_way.png",
		}
	},

	["paris_mist"] = {
		label = "Paris Mist",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "paris_mist.png",
		}
	},

	["glacatti"] = {
		label = "Glacatti",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "glacatti.png",
		}
	},

	["frosted_delight_joint"] = {
		label = "Frosted Delight Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "frosted_delight_joint.png",
		}
	},

	["cafe_vodka"] = {
		label = "Vodka",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "cafe_vodka.png",
		}
	},

	["spiky_pear_joint"] = {
		label = "Spiky Pear Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "spiky_pear_joint.png",
		}
	},

	["cafe_tequila"] = {
		label = "Tequila",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "cafe_tequila.png",
		}
	},

	["boss_blend"] = {
		label = "Boss Blend",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "boss_blend.png",
		}
	},

	["berry_bliss"] = {
		label = "Berry Bliss",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "berry_bliss.png",
		}
	},

	["backroots_honey"] = {
		label = "Backroots Honey",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "backroots_honey.png",
		}
	},

	["runs_elite_joint"] = {
		label = "Runs Elite Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "runs_elite_joint.png",
		}
	},

	["frosty_phantom_joint"] = {
		label = "Frosty Phantom Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "frosty_phantom_joint.png",
		}
	},

	["tangy_fuel"] = {
		label = "Tangy Fuel",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "tangy_fuel.png",
		}
	},

	["wild_feline_joint"] = {
		label = "Wild Feline Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "wild_feline_joint.png",
		}
	},

	["blazebites"] = {
		label = "Blaze Bites",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "blazebites.png",
		}
	},

	["berry_muffin"] = {
		label = "Berry Muffin",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "berry_muffin.png",
		}
	},

	["cafe_mintleaves"] = {
		label = "Mint Leaves",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "cafe_mintleaves.png",
		}
	},

	["golden_biscuit_joint"] = {
		label = "Golden Biscuit Joint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "golden_biscuit_joint.png",
		}
	},

	["elegant_porcelain"] = {
		label = "Elegant Porcelain",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "elegant_porcelain.png",
		}
	},

	["bounce_blend"] = {
		label = "Bounce Blend",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "bounce_blend.png",
		}
	},

	["berry_swirl"] = {
		label = "Berry Swirl",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "berry_swirl.png",
		}
	},

	["cafe_whiterum"] = {
		label = "White Rum",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "cafe_whiterum.png",
		}
	},

	['car_mod_nitro_kit'] = {
    label = 'Nitro Kit',
    weight = 500,
    close = true,
    client = {},
	},
	['car_mod_nitro_tank'] = {
    label = 'Nitro Refill Tank',
    weight = 700,
    close = true,
    client = {},
	},
	['car_mod_diff_lsd'] = {
    label = 'LSD Differential',
    weight = 1000,
    close = true,
    client = {},
	},
	['car_mod_diff_welded'] = {
    label = 'Welded Differential',
    weight = 1000,
    close = true,
    client = {},
	},
	['car_mod_tires'] = {
    label = 'Sport Tires',
    weight = 1000,
    close = true,
    client = {},
    server = {
        -- Add server export if needed
    },
	},
	['car_mod_stiff_arb'] = {
    label = 'Stiff ARB',
    weight = 1000,
    close = true,
    client = {},
	},
	['car_mod_ecu'] = {
    label = 'ECU',
    weight = 175,
    close = true,
    client = {},
	},
	['car_mod_lock_kit'] = {
    label = 'Lock Kit',
    weight = 800,
    close = true,
    client = {},
	},

	["tunertablet"] = {
    label = "Tuner tablet",
    weight = 1,
    stack = true,
    close = true,
	},

	["smalltunertablet"] = {
    label = "Small tuner tablet",
    weight = 1,
    stack = true,
    close = true,
	},
	

	["kq_outfitbag"] = {
		label = "Outfit bag",
		weight = 4000,
		stack = true,
		close = true,
		description = "Holds different outfits",
		client = {
			image = "kq_outfitbag.png",
		}
	},

	["trapphone"] = {
		label = "Trap Phone",
		weight = 4000,
		stack = false,
		close = true,
		description = "Trap Phone",
		client = {
			image = "trapphone.png",
		}
	},

	["ttiger_breath"] = {
		label = "Trimmed Tiger Breath",
		weight = 0,
		stack = true,
		close = true,
		description = "Nug of Tiger Breath",
		client = {
			image = "ttiger_breath.png",
		}
	},

	["weed_ak47_cbd_crop"] = {
		label = "Untrimmed Ak47",
		weight = 0,
		stack = true,
		close = true,
		description = "Untrimmed ak47",
		client = {
			image = "weed_ak47_cbd_crop.png",
		}
	},

	["rtiger_breath"] = {
		label = "Raw Tiger Breath",
		weight = 0,
		stack = true,
		close = true,
		description = "Take to a Cursed Beauty",
		client = {
			image = "rtiger_breath.png",
		}
	},

	["tiger_breath"] = {
		label = "Tiger Breath",
		weight = 0,
		stack = true,
		close = true,
		description = "Tiger Breath",
		client = {
			image = "tiger_breath.png",
		}
	},

	["cocaine"] = {
		label = "Raw Cocaine",
		weight = 100,
		stack = true,
		close = true,
		description = "Raw Cocaine",
		client = {
			image = "cocaine.png",
		}
	},

	["foil_poker"] = {
		label = "Foil Poker",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "foil_poker.png",
		}
	},

	["2005_blueberry"] = {
		label = "2005 Blueberry Tangiers",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "2005_blueberry.png",
		}
	},

	["mofo_fantasia"] = {
		label = "Adios Mofo Fantasia",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "mofo_fantasia.png",
		}
	},

	["social_smoke"] = {
		label = "Social Smoke Absolute Zero",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "social_smoke.png",
		}
	},

	["zomo_lemon"] = {
		label = "Zomo Lemon Mint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "zomo_lemon.png",
		}
	},

	["blue_mist"] = {
		label = "Starbuzz Blue Mist",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "blue_mist.png",
		}
	},

	["foil_poked"] = {
		label = "Foil Poked",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "foil_poked.png",
		}
	},

	["gummi_bear"] = {
		label = "Fumari White Gummi Bear",
		weight = 10,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "gummi_bear.png",
		}
	},

	["hot_coals"] = {
		label = "Hot Coals",
		weight = 300,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "hot_coals.png",
		}
	},

	["cane_mint"] = {
		label = "Tangiers Cane Mint",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "cane_mint.png",
		}
	},

	["double_apple"] = {
		label = "Nakhla Double Apple",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "double_apple.png",
		}
	},

	["zomo_cream"] = {
		label = "Acai Cream Zomo",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "zomo_cream.png",
		}
	},

	["al_fakher"] = {
		label = "Al Fakher Two Apples",
		weight = 250,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "al_fakher.png",
		}
	},

	["peppermint_shake"] = {
		label = "Trifecta Blonde Peppermint Shake",
		weight = 10,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "peppermint_shake.png",
		}
	},

	["50_below"] = {
		label = "50 Below Nirvana Dokha",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "50_below.png",
		}
	},

	["hose"] = {
		label = "Shisha Hose",
		weight = 250,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "hose.png",
		}
	},

	["adalya_love"] = {
		label = "Adalya Love 66",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "adalya_love.png",
		}
	},

	["coals"] = {
		label = "Shisha Coals",
		weight = 300,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "coals.png",
		}
	},

	["foil"] = {
		label = "Foil Paper",
		weight = 150,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "foil.png",
		}
	},

	["4play"] = {
		label = "4Play Fantasia",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "4play.png",
		}
	},

	["el_patron"] = {
		label = "Chaos El Patron",
		weight = 10,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "el_patron.png",
		}
	},

	["spades_fantasia"] = {
		label = "Ace of Spades Fantasia",
		weight = 500,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "spades_fantasia.png",
		}
	},

	["neonkit"] = {
		label = "Neon Kit",
		weight = 1000,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "neonkit.png",
		}
	},

	["brakes"] = {
		label = "Brakes",
		weight = 1000,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "brakes.png",
		}
	},

	["exhaust"] = {
		label = "Exhaust",
		weight = 1000,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "exhaust.png",
		}
	},

	["spraypaint"] = {
		label = "Spray Paint",
		weight = 1000,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "spraypaint.png",
		}
	},

	["turbokit"] = {
		label = "Turbo kit",
		weight = 1000,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "turbokit.png",
		}
	},

	["wheels"] = {
		label = "Wheels",
		weight = 1000,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "wheels.png",
		}
	},

	["mechanictools"] = {
		label = "Mechanic Tools",
		weight = 1000,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "mechanictools.png",
		}
	},

	["horns"] = {
		label = "Horns",
		weight = 1000,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "horns.png",
		}
	},

	["engine"] = {
		label = "Engine",
		weight = 1000,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "engine.png",
		}
	},

	["suspension"] = {
		label = "Suspension",
		weight = 1000,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "suspension.png",
		}
	},

	["spoiler"] = {
		label = "Spoiler",
		weight = 1000,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "spoiler.png",
		}
	},

	["steeringwheel"] = {
		label = "Steering Wheel",
		weight = 1000,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "steeringwheel.png",
		}
	},

	["armorkit"] = {
		label = "Armor kit",
		weight = 1000,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "armorkit.png",
		}
	},

	["bumper"] = {
		label = "Bumper",
		weight = 1000,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "bumper.png",
		}
	},

	["seats"] = {
		label = "Seats",
		weight = 1000,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "seats.png",
		}
	},

	["vehiclehood"] = {
		label = "Vehicle Hood",
		weight = 1000,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "vehiclehood.png",
		}
	},

	["stolenlaptop"] = {
		label = "Portátil",
		weight = 200,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "",
		}
	},

	["stolentv"] = {
		label = "TV",
		weight = 200,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "",
		}
	},

	["stolencoffee"] = {
		label = "Maquina de Café",
		weight = 200,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "",
		}
	},

	["stolenscope"] = {
		label = "Telescópio",
		weight = 200,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "",
		}
	},

	["stolenart"] = {
		label = "Pintura",
		weight = 200,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "",
		}
	},

	["stolenmicro"] = {
		label = "Micro-ondas",
		weight = 200,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "",
		}
	},

	["gruppesechstablet"] = {
		label = "Gruppe Sechs Tablet",
		weight = 500,
		stack = false,
		close = true,
		description = "A nice device that allows you to rob the gruppe sechs transports",
		client = {
			image = "gruppesechstablet.png",
		}
	},

	["bracelet"] = {
		label = "Stolen Bracelet(s)",
		weight = 200,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "pulseira.png",
		}
	},

	["painting"] = {
		label = "Painting",
		weight = 200,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "painting.png",
		}
	},

	["ring"] = {
		label = "Stolen Ring(s)",
		weight = 200,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "anel.png",
		}
	},

	["chain"] = {
		label = "Stolen Necklace(s)",
		weight = 200,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "chain.png",
		}
	},

	["earrings"] = {
		label = "Stolen Earring(s)",
		weight = 200,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "brincos.png",
		}
	},

	['wartablet'] = {
    label = 'War Tablet',
    weight = 200,
    stack = false,
    close = true,
	},

	["fentanyl"] = {
		label = "Fentanyl",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "fentanyl.png",
		}
	},

	["beautyscissors"] = {
		label = "Beauty Scissors",
		weight = 0,
		stack = true,
		close = true,
		description = "Take to a Cursed Beauty",
		client = {
			image = "beautyscissors.png",
		}
	},

	["ogkushbag"] = {
		label = "OG Kush Bag",
		weight = 0,
		stack = true,
		close = true,
		description = "Take to a Cursed Beauty",
		client = {
			image = "ogkushbag.png",
		}
	},

	["pillbottle"] = {
		label = "pill Bottle",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pillbottle.png",
		}
	},

	["xannax"] = {
		label = "Xannax",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "xannax.png",
		}
	},

	["ogkushnug"] = {
		label = "OG Kush Nug",
		weight = 0,
		stack = true,
		close = true,
		description = "Take to a Cursed Beauty",
		client = {
			image = "ogkushnug.png",
		}
	},

	["ogkushleaf"] = {
		label = "Untrimmed OG Kush",
		weight = 0,
		stack = true,
		close = true,
		description = "Take to a Cursed Beauty",
		client = {
			image = "ogkushleaf.png",
		}
	},

	["ak47scissors"] = {
		label = "Ak47 Scissors",
		weight = 0,
		stack = true,
		close = true,
		description = "Take to a Cursed Beauty",
		client = {
			image = "ak47scissors.png",
		}
	},

	["leaftrim"] = {
		label = "Trimmed Leaf Nug",
		weight = 0,
		stack = true,
		close = true,
		description = "Take to a Cursed Beauty",
		client = {
			image = "leaftrim.png",
		}
	},

	["pyrex"] = {
		label = "Pyrex",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pyrex.png",
		}
	},

	["leafscissors"] = {
		label = "Leaf Scissors",
		weight = 0,
		stack = true,
		close = true,
		description = "Take to a Cursed Beauty",
		client = {
			image = "leafscissors.png",
		}
	},

	["leafbag"] = {
		label = "Bag Leaf Nugs",
		weight = 0,
		stack = true,
		close = true,
		description = "Take to a Cursed Beauty",
		client = {
			image = "leafbag.png",
		}
	},

	["pillpress"] = {
		label = "Pill Press",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pillpress.png",
		}
	},

	["bakingsoda"] = {
		label = "Baking Soda",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "bakingsoda.png",
		}
	},

	["kushscissors"] = {
		label = "KushBite Scissors",
		weight = 0,
		stack = true,
		close = true,
		description = "Take to a Cursed Beauty",
		client = {
			image = "kushscissors.png",
		}
	},

	["leafraw"] = {
		label = "Raw Leaf Nug",
		weight = 0,
		stack = true,
		close = true,
		description = "Take to a Cursed Beauty",
		client = {
			image = "leafraw.png",
		}
	},

	["milk"] = {
		label = "Milk",
		weight = 300,
		stack = true,
		close = true,
		description = "Fresh dairy milk.",
		client = {
			image = "milk.png",
		}
	},

	["cilantro"] = {
		label = "Fresh Cilantro",
		weight = 30,
		stack = true,
		close = true,
		description = "Fresh cilantro herb.",
		client = {
			image = "cilantro.png",
		}
	},

	["jasmine_tea"] = {
		label = "Jasmine Tea",
		weight = 90,
		stack = true,
		close = true,
		description = "Delicate floral jasmine tea.",
		client = {
			image = "jasmine_tea.png",
		}
	},

	["coco_cookedsquid"] = {
		label = "Cooked Squid",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "coco_cookedsquid.png",
		}
	},

	["coco_processoctopus"] = {
		label = "Process Octopus",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_processoctopus.png",
		}
	},

	["coco_begal"] = {
		label = "Bagels",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "coco_begal.png",
		}
	},

	["coco_coconut"] = {
		label = "Coconut",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_coconut.png",
		}
	},

	["ksausage"] = {
		label = "Sausage",
		weight = 100,
		stack = true,
		close = false,
		description = "Sausage",
		client = {
			image = "ksausage.png",
		}
	},

	["store_laptop"] = {
		label = "Store Laptop",
		weight = 100,
		stack = false,
		close = false,
		description = "A laptop to access the store.",
		client = {
			image = "store_laptop.png",
		}
	},

	["tea_leaves"] = {
		label = "Tea Leaves",
		weight = 100,
		stack = true,
		close = true,
		description = "A handful of dried tea leaves.",
		client = {
			image = "tea_leaves.png",
		}
	},

	["cabbage"] = {
		label = "Cabbage",
		weight = 150,
		stack = true,
		close = true,
		description = "Fresh raw cabbage.",
		client = {
			image = "cabbage.png",
		}
	},

	["coco_processedlobstar"] = {
		label = "Process Lobstar",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_processedlobstar.png",
		}
	},

	["coco_coconutwater"] = {
		label = "Coconut Water",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "coco_coconutwater.png",
		}
	},

	["noodlebox"] = {
		label = "Noodle Box",
		weight = 200,
		stack = true,
		close = true,
		description = "A classic box full of stir-fried noodles.",
		client = {
			image = "noodlebox.png",
		}
	},

	["coco_scrab"] = {
		label = "Scrab",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_scrab.png",
		}
	},

	["coco_milk"] = {
		label = "Milk",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_milk.png",
		}
	},

	["carrot"] = {
		label = "Carrot",
		weight = 100,
		stack = true,
		close = true,
		description = "Fresh raw carrot.",
		client = {
			image = "carrot.png",
		}
	},

	["coco_squid"] = {
		label = "Squid",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_squid.png",
		}
	},

	["sliced_cabbage"] = {
		label = "Sliced Cabbage",
		weight = 140,
		stack = true,
		close = true,
		description = "Freshly sliced cabbage.",
		client = {
			image = "sliced_cabbage.png",
		}
	},

	["kcheddar"] = {
		label = "Cheese Slice",
		weight = 100,
		stack = true,
		close = false,
		description = "Slice of Cheese",
		client = {
			image = "kcheddar.png",
		}
	},

	["ktocco"] = {
		label = "Tacco",
		weight = 100,
		stack = true,
		close = false,
		description = "Tacco",
		client = {
			image = "ktocco.png",
		}
	},

	["coco_sugar"] = {
		label = "Sugar",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_sugar.png",
		}
	},

	["klettuce"] = {
		label = "Lettuce",
		weight = 100,
		stack = true,
		close = false,
		description = "Some big taco brother",
		client = {
			image = "klettuce.png",
		}
	},

	["ktortia"] = {
		label = "Tortia",
		weight = 100,
		stack = true,
		close = false,
		description = "Torttia",
		client = {
			image = "ktortia.png",
		}
	},

	-- ["lychee"] = {
	-- 	label = "Lychee",
	-- 	weight = 60,
	-- 	stack = true,
	-- 	close = true,
	-- 	description = "Sweet and juicy lychee fruit.",
	-- 	client = {
	-- 		image = "lychee.png",
	-- 	}
	-- },

	-- ["coco_chocosyrup"] = {
	-- 	label = "Choco Syrup",
	-- 	weight = 100,
	-- 	stack = true,
	-- 	close = false,
	-- 	description = "",
	-- 	client = {
	-- 		image = "coco_chocosyrup.png",
	-- 	}
	-- },

	["chicken"] = {
		label = "Raw Chicken",
		weight = 200,
		stack = true,
		close = true,
		description = "Raw chicken meat.",
		client = {
			image = "chicken.png",
		}
	},

	["coco_salmonslice"] = {
		label = "Salmon Slice",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_salmonslice.png",
		}
	},

	["coco_salmon"] = {
		label = "Salmon",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_salmon.png",
		}
	},

	["tomato"] = {
		label = "Tomato",
		weight = 100,
		stack = true,
		close = true,
		description = "Fresh ripe tomato.",
		client = {
			image = "tomato.png",
		}
	},

	["coco_onionslice"] = {
		label = "Onilon",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_onionslice.png",
		}
	},

	["coco_lobstar"] = {
		label = "Lobstar",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_lobstar.png",
		}
	},

	["side_salad"] = {
		label = "Salad",
		weight = 300,
		stack = true,
		close = true,
		description = "Salad",
		client = {
			image = "side_salad.png",
		}
	},

	["onion"] = {
		label = "Onion",
		weight = 80,
		stack = true,
		close = true,
		description = "Fresh onion.",
		client = {
			image = "onion.png",
		}
	},

	["coconut"] = {
		label = "Coconut",
		weight = 250,
		stack = true,
		close = true,
		description = "A whole coconut, full of fresh juice.",
		client = {
			image = "coconut.png",
		}
	},

	["coco_processcrab"] = {
		label = "Process Scrab",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_processcrab.png",
		}
	},

	["sliced_beef"] = {
		label = "Sliced Beef",
		weight = 230,
		stack = true,
		close = true,
		description = "Tender sliced beef meat.",
		client = {
			image = "sliced_beef.png",
		}
	},

	["c4"] = {
		label = "C4",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "c4.png",
		}
	},

	["sliced_tomato"] = {
		label = "Sliced Tomato",
		weight = 90,
		stack = true,
		close = true,
		description = "Freshly sliced tomato.",
		client = {
			image = "sliced_tomato.png",
		}
	},

	["coco_tomatoslice"] = {
		label = "Tomato Slice",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_tomatoslice.png",
		}
	},

	["coco_lemonjuice"] = {
		label = "Lemon Juice",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "coco_lemonjuice.png",
		}
	},

	["chickennoodle"] = {
		label = "Chicken Noodles",
		weight = 220,
		stack = true,
		close = true,
		description = "Delicious noodles mixed with grilled chicken.",
		client = {
			image = "chickennoodle.png",
		}
	},

	["bellpepper"] = {
		label = "Bell Pepper",
		weight = 100,
		stack = true,
		close = true,
		description = "Fresh bell pepper.",
		client = {
			image = "bellpepper.png",
		}
	},

	["sliced_carrot"] = {
		label = "Sliced Carrot",
		weight = 90,
		stack = true,
		close = true,
		description = "Freshly sliced carrot.",
		client = {
			image = "sliced_carrot.png",
		}
	},

	["coco_cococookie"] = {
		label = "Coco Cookie",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "coco_cococookie.png",
		}
	},

	["coco_berryjuice"] = {
		label = "Berry Juice",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "coco_berryjuice.png",
		}
	},

	["coco_salt"] = {
		label = "Sugar",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_salt.png",
		}
	},

	["iced_tea"] = {
		label = "Iced Tea",
		weight = 100,
		stack = true,
		close = true,
		description = "Cool and refreshing iced tea.",
		client = {
			image = "iced_tea.png",
		}
	},

	["shrimp"] = {
		label = "Shrimp",
		weight = 30,
		stack = true,
		close = true,
		description = "Fresh Sea Fish.",
		client = {
			image = "shrimp.png",
		}
	},

	["kbuns"] = {
		label = "Hotdog Bun",
		weight = 100,
		stack = true,
		close = false,
		description = "Buns",
		client = {
			image = "kbuns.png",
		}
	},

	["coco_lemon"] = {
		label = "Lemon",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_lemon.png",
		}
	},

	["coco_egg"] = {
		label = "Eggs",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_egg.png",
		}
	},

	["raw_noodles"] = {
		label = "Raw Noodle",
		weight = 30,
		stack = true,
		close = true,
		description = "Fresh Raw Ramen.",
		client = {
			image = "raw_noodles.png",
		}
	},

	["spinach"] = {
		label = "Spinach",
		weight = 70,
		stack = true,
		close = true,
		description = "Fresh spinach leaves.",
		client = {
			image = "spinach.png",
		}
	},

	["coco_glass"] = {
		label = "Glass",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_glass.png",
		}
	},

	["coco_flour"] = {
		label = "Flour",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_flour.png",
		}
	},

	["grilled_chicken"] = {
		label = "Grilled Chicken",
		weight = 190,
		stack = true,
		close = true,
		description = "Juicy grilled chicken pieces.",
		client = {
			image = "grilled_chicken.png",
		}
	},

	["seafoodnoodle"] = {
		label = "Seafood Noodles",
		weight = 230,
		stack = true,
		close = true,
		description = "Noodles with shrimp, squid, and fish flavor.",
		client = {
			image = "seafoodnoodle.png",
		}
	},

	["chopped_garlic"] = {
		label = "Chopped Garlic",
		weight = 70,
		stack = true,
		close = true,
		description = "Finely chopped garlic.",
		client = {
			image = "chopped_garlic.png",
		}
	},

	["hack_laptop"] = {
		label = "Hacking Laptop",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "hack_laptop.png",
		}
	},

	["sugar"] = {
		label = "Sugar",
		weight = 50,
		stack = true,
		close = true,
		description = "A spoonful of sugar for sweetening.",
		client = {
			image = "sugar.png",
		}
	},

	["spring_water"] = {
		label = "Spring Water",
		weight = 500,
		stack = true,
		close = true,
		description = "Pure bottled spring water.",
		client = {
			image = "spring_water.png",
		}
	},

	["coco_cocosoup"] = {
		label = "Coco Soup",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "coco_cocosoup.png",
		}
	},

	["jasmine_leaves"] = {
		label = "Jasmine Leaves",
		weight = 80,
		stack = true,
		close = true,
		description = "Fragrant jasmine tea leaves.",
		client = {
			image = "jasmine_leaves.png",
		}
	},

	["green_tea"] = {
		label = "Green Tea",
		weight = 100,
		stack = true,
		close = true,
		description = "A warm cup of soothing green tea.",
		client = {
			image = "green_tea.png",
		}
	},

	-- ["lemon"] = {
	-- 	label = "Lemon",
	-- 	weight = 100,
	-- 	stack = true,
	-- 	close = true,
	-- 	description = "Fresh lemon, full of zest.",
	-- 	client = {
	-- 		image = "lemon.png",
	-- 	}
	-- },

	["coco_cococupcake"] = {
		label = "Coco CupCake",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "coco_cococupcake.png",
		}
	},

	["noodleset"] = {
		label = "Noodle Meal Set",
		weight = 300,
		stack = true,
		close = true,
		description = "A complete meal: noodles, drink, and snack.",
		client = {
			image = "noodleset.png",
		}
	},

	["coco_berri"] = {
		label = "Berri",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_berri.png",
		}
	},

	["coco_cutlemon"] = {
		label = "Lemon Slice",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_cutlemon.png",
		}
	},

	["coco_coockedsalmon"] = {
		label = "Salmon Curry",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "coco_cookedsalmon.png",
		}
	},

	["coco_water"] = {
		label = "Water",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_water.png",
		}
	},

	["vegnoodle"] = {
		label = "Veggie Noodles",
		weight = 210,
		stack = true,
		close = true,
		description = "A bowl of fresh stir-fried vegetable noodles.",
		client = {
			image = "vegnoodle.png",
		}
	},

	["coco_orange"] = {
		label = "Orange",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_orange.png",
		}
	},

	["coconut_juice"] = {
		label = "Coconut Juice",
		weight = 110,
		stack = true,
		close = true,
		description = "Cool coconut water served fresh.",
		client = {
			image = "coconut_juice.png",
		}
	},

	["garlic"] = {
		label = "Garlic",
		weight = 50,
		stack = true,
		close = true,
		description = "Fresh garlic cloves.",
		client = {
			image = "garlic.png",
		}
	},

	["store_safe_pass"] = {
		label = "Store Safe Pass",
		weight = 100,
		stack = false,
		close = false,
		description = "A pass to open the store safe.",
		client = {
			image = "store_safe_pass.png",
		}
	},

	["coco_chocobegals"] = {
		label = "Choco Bagels",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "coco_chocobegals.png",
		}
	},

	["coco_drycoconut"] = {
		label = "Dry Coconut",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_drycoconut.png",
		}
	},

	["milk_tea"] = {
		label = "Milk Tea",
		weight = 120,
		stack = true,
		close = true,
		description = "Sweet and creamy milk tea.",
		client = {
			image = "milk_tea.png",
		}
	},

	["kchilisauce"] = {
		label = "Chili Sauce",
		weight = 100,
		stack = true,
		close = false,
		description = "Chili Sauce",
		client = {
			image = "kchilisauce.png",
		}
	},

	["minced_garlic"] = {
		label = "Minced Garlic",
		weight = 40,
		stack = true,
		close = true,
		description = "Minced garlic cloves.",
		client = {
			image = "minced_garlic.png",
		}
	},

	["coco_onion"] = {
		label = "Onilon",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_onion.png",
		}
	},

	["chopped_cilantro"] = {
		label = "Chopped Cilantro",
		weight = 25,
		stack = true,
		close = true,
		description = "Freshly chopped cilantro.",
		client = {
			image = "chopped_cilantro.png",
		}
	},

	["sliced_bellpepper"] = {
		label = "Sliced Bell Pepper",
		weight = 90,
		stack = true,
		close = true,
		description = "Freshly sliced bell pepper.",
		client = {
			image = "sliced_bellpepper.png",
		}
	},

	["chopped_chili"] = {
		label = "Chopped Chili Pepper",
		weight = 35,
		stack = true,
		close = true,
		description = "Chopped spicy chili peppers.",
		client = {
			image = "chopped_chili.png",
		}
	},

	["khotdog"] = {
		label = "Hot Dog",
		weight = 100,
		stack = true,
		close = false,
		description = "Hot Dog",
		client = {
			image = "khotdog.png",
		}
	},

	["konions"] = {
		label = "Onions",
		weight = 100,
		stack = true,
		close = false,
		description = "Sliced Onion",
		client = {
			image = "konions.png",
		}
	},

	["coco_cookedoctopus"] = {
		label = "Cooked Octopus",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "coco_cookedoctopus.png",
		}
	},

	["lemonade"] = {
		label = "Lemonade",
		weight = 100,
		stack = true,
		close = true,
		description = "Freshly squeezed lemonade.",
		client = {
			image = "lemonade.png",
		}
	},

	["coco_cookedlobstar"] = {
		label = "Cooked Lobstar",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "coco_cookedlobstar.png",
		}
	},

	["ice_cube"] = {
		label = "Ice Cube",
		weight = 50,
		stack = true,
		close = true,
		description = "Cold ice cube, perfect for chilling drinks.",
		client = {
			image = "ice_cube.png",
		}
	},

	["chili"] = {
		label = "Chili Pepper",
		weight = 40,
		stack = true,
		close = true,
		description = "Spicy chili pepper.",
		client = {
			image = "chili.png",
		}
	},

	["soda_water"] = {
		label = "Soda Water",
		weight = 300,
		stack = true,
		close = true,
		description = "Sparkling soda water.",
		client = {
			image = "soda_water.png",
		}
	},

	["khotsauce"] = {
		label = "Hot Sauce",
		weight = 100,
		stack = true,
		close = false,
		description = "Hot Sauce",
		client = {
			image = "khotsauce.png",
		}
	},

	["beef"] = {
		label = "Raw Beef",
		weight = 250,
		stack = true,
		close = true,
		description = "Raw beef meat.",
		client = {
			image = "beef.png",
		}
	},

	-- ["coco_chocholate"] = {
	-- 	label = "Chocolate",
	-- 	weight = 100,
	-- 	stack = true,
	-- 	close = false,
	-- 	description = "",
	-- 	client = {
	-- 		image = "coco_chocholate.png",
	-- 	}
	-- },

	["coco_tomato"] = {
		label = "Tomato",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_tomato.png",
		}
	},

	["coco_orangejuice"] = {
		label = "Orange Juice",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "coco_orangejuice.png",
		}
	},

	["spicynoodle"] = {
		label = "Spicy Noodles",
		weight = 210,
		stack = true,
		close = true,
		description = "Hot and spicy noodles that pack a punch!",
		client = {
			image = "spicynoodle.png",
		}
	},

	["coco_octopus"] = {
		label = "Octopus",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_octopus.png",
		}
	},

	["chopped_spinach"] = {
		label = "Chopped Spinach",
		weight = 65,
		stack = true,
		close = true,
		description = "Freshly chopped spinach.",
		client = {
			image = "chopped_spinach.png",
		}
	},

	["kcheque"] = {
		label = "Cheque",
		weight = 100,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "kcheque.png",
		}
	},

	["coco_cutorange"] = {
		label = "Orange Slice",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_cutorange.png",
		}
	},

	["chopped_onion"] = {
		label = "Chopped Onion",
		weight = 70,
		stack = true,
		close = true,
		description = "Finely chopped onion.",
		client = {
			image = "chopped_onion.png",
		}
	},

	["coco_cookedscrab"] = {
		label = "Cooked Scrab",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "coco_cookedscrab.png",
		}
	},

	["beefnoodle"] = {
		label = "Beef Noodles",
		weight = 220,
		stack = true,
		close = true,
		description = "Savory noodles with slices of tender beef.",
		client = {
			image = "beefnoodle.png",
		}
	},

	["lychee_soda"] = {
		label = "Lychee Soda",
		weight = 100,
		stack = true,
		close = true,
		description = "A fizzy lychee-flavored drink.",
		client = {
			image = "lychee_soda.png",
		}
	},

	["coco_processssquid"] = {
		label = "Process Squid",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coco_processssquid.png",
		}
	},

	["berry_sparkle_soda"] = {
		label = "Medium Berry Sparkle Soda",
		weight = 100,
		stack = true,
		close = true,
		description = "A medium soda sparkling with a burst of mixed berry flavors.",
		client = {
			image = "berry_sparkle_soda.png",
		}
	},

	["mc_combo_chicken"] = {
		label = "Combo Chicken",
		weight = 100,
		stack = true,
		close = true,
		description = "A complete meal combo centered around tender chicken.",
		client = {
			image = "mc_combo_chicken.png",
		}
	},

	["quarter_beef_burger"] = {
		label = "Quarter Beef Burger",
		weight = 100,
		stack = true,
		close = true,
		description = "A juicy quarter-pound beef burger crafted for classic flavor.",
		client = {
			image = "quarter_beef_burger.png",
		}
	},

	["hot_chicken_wrap"] = {
		label = "Hot Chicken Wrap",
		weight = 100,
		stack = true,
		close = true,
		description = "A spicy chicken wrap loaded with bold flavors.",
		client = {
			image = "hot_chicken_wrap.png",
		}
	},

	["korean_bbq_wings"] = {
		label = "Korean BBQ Wings",
		weight = 100,
		stack = true,
		close = true,
		description = "Savory wings glazed with tangy Korean BBQ sauce.",
		client = {
			image = "korean_bbq_wings.png",
		}
	},

	["cheese_fries"] = {
		label = "CHEESE FRIES",
		weight = 100,
		stack = true,
		close = true,
		description = "Crispy fries smothered in melted, savory cheese.",
		client = {
			image = "cheese_fries.png",
		}
	},

	["crispy_tender_combo"] = {
		label = "LARGE 5 PC CRISPY TENDER COMBO",
		weight = 100,
		stack = true,
		close = true,
		description = "A combo featuring 5 crispy tenders served with sides.",
		client = {
			image = "crispy_tender_combo.png",
		}
	},

	["cokebrick"] = {
		label = "Coke Brick",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "cokebrick.png",
		}
	},

	["w_ice_cola"] = {
		label = "Ice Cola",
		weight = 100,
		stack = true,
		close = true,
		description = "A perfectly chilled ice cola for a refreshing sip.",
		client = {
			image = "w_ice_cola.png",
		}
	},

	["chicken_caesar_salad"] = {
		label = "Chicken Caesar Salad",
		weight = 100,
		stack = true,
		close = true,
		description = "A classic Caesar salad topped with grilled chicken.",
		client = {
			image = "chicken_caesar_salad.png",
		}
	},

	["boneless_meal_deal"] = {
		label = "Boneless Meal Deal",
		weight = 100,
		stack = true,
		close = true,
		description = "A meal deal featuring boneless wings and tasty sides.",
		client = {
			image = "boneless_meal_deal.png",
		}
	},

	["slim_cola"] = {
		label = "Det Pepsi",
		weight = 100,
		stack = true,
		close = true,
		description = "A light, crisp cola with a distinctive taste.",
		client = {
			image = "slim_cola.png",
		}
	},

	["chocolate_chunk_brownie"] = {
		label = "TRIPLE CHOCOLATE CHUNK BROWNIE",
		weight = 100,
		stack = true,
		close = true,
		description = "A decadent brownie loaded with three types of chocolate chunks.",
		client = {
			image = "chocolate_chunk_brownie.png",
		}
	},

	["crispy_chicken_bites"] = {
		label = "Chicken Nuggets",
		weight = 100,
		stack = true,
		close = true,
		description = "Golden, bite-sized chicken nuggets with a satisfying crunch.",
		client = {
			image = "crispy_chicken_bites.png",
		}
	},

	["fiery_premium_sandwich"] = {
		label = "Fiery Premium Sandwich",
		weight = 100,
		stack = true,
		close = true,
		description = "A premium sandwich with a bold, fiery flavor that packs a punch.",
		client = {
			image = "fiery_premium_sandwich.png",
		}
	},

	["hundred_wings"] = {
		label = "100 WINGS",
		weight = 100,
		stack = true,
		close = true,
		description = "An ultimate challenge: 100 crispy wings to share.",
		client = {
			image = "hundred_wings.png",
		}
	},

	["mc_iced_tea"] = {
		label = "Iced Tea",
		weight = 100,
		stack = true,
		close = true,
		description = "A refreshing glass of iced tea to cool you down.",
		client = {
			image = "mc_iced_tea.png",
		}
	},

	["deluxe_crispy_sandwich_combo"] = {
		label = "Deluxe Crispy Sandwich Combo",
		weight = 100,
		stack = true,
		close = true,
		description = "A deluxe combo featuring a crispy sandwich paired with fries and a drink.",
		client = {
			image = "deluxe_crispy_sandwich_combo.png",
		}
	},

	["mc_hot_chocolate"] = {
		label = "Hot Chocolate",
		weight = 100,
		stack = true,
		close = true,
		description = "A rich and warming hot chocolate, ideal for a chilly day.",
		client = {
			image = "mc_hot_chocolate.png",
		}
	},

	["citrus_spark"] = {
		label = "Citrus Spark",
		weight = 100,
		stack = true,
		close = true,
		description = "A sparkling drink that ignites your taste buds with citrus energy.",
		client = {
			image = "citrus_spark.png",
		}
	},

	["coke_pooch"] = {
		label = "Coke Pooch",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "coke_pooch.png",
		}
	},

	["pepper_twist_cola"] = {
		label = "Pepper Twist Cola",
		weight = 100,
		stack = true,
		close = true,
		description = "A unique cola with a subtle pepper twist for an extra zing.",
		client = {
			image = "pepper_twist_cola.png",
		}
	},

	["fresh_baked_rolls"] = {
		label = "FRESH BAKED ROLLS",
		weight = 100,
		stack = true,
		close = true,
		description = "Soft, freshly baked rolls perfect as a side.",
		client = {
			image = "fresh_baked_rolls.png",
		}
	},

	["garlic_parm_wings"] = {
		label = "Garlic Parm Wings",
		weight = 100,
		stack = true,
		close = true,
		description = "Crispy wings tossed in a savory garlic parmesan sauce.",
		client = {
			image = "garlic_parm_wings.png",
		}
	},

	["citrus_burst_soda"] = {
		label = "Citrus Burst Soda",
		weight = 100,
		stack = true,
		close = true,
		description = "A soda bursting with vibrant citrus flavors to energize your day.",
		client = {
			image = "citrus_burst_soda.png",
		}
	},

	["party_pack"] = {
		label = "50PC PARTY PACK",
		weight = 100,
		stack = true,
		close = true,
		description = "A massive 50-piece party pack of wings for big gatherings.",
		client = {
			image = "party_pack.png",
		}
	},

	["seasoned_fries"] = {
		label = "SEASONED FRIES",
		weight = 100,
		stack = true,
		close = true,
		description = "Crispy fries seasoned with a perfect blend of spices.",
		client = {
			image = "seasoned_fries.png",
		}
	},

	["spicy_crispy_chicken_sandwich"] = {
		label = "Spicy Crispy Chicken Sandwich",
		weight = 100,
		stack = true,
		close = true,
		description = "A fiery chicken sandwich with a crispy exterior and a spicy kick.",
		client = {
			image = "spicy_crispy_chicken_sandwich.png",
		}
	},

	["double_quarter_combo"] = {
		label = "Double Quarter Combo",
		weight = 100,
		stack = true,
		close = true,
		description = "A hearty combo featuring double quarter-pound burgers with sides.",
		client = {
			image = "double_quarter_combo.png",
		}
	},

	["tender_pack"] = {
		label = "24PC CRISPY TENDER PACK",
		weight = 100,
		stack = true,
		close = true,
		description = "A pack of 24 crispy tenders, perfect for sharing.",
		client = {
			image = "tender_pack.png",
		}
	},

	["nugget_kids"] = {
		label = "Nuggets Kids",
		weight = 100,
		stack = true,
		close = true,
		description = "A kid-friendly portion of crispy chicken nuggets, perfectly sized.",
		client = {
			image = "nugget_kids.png",
		}
	},

	["spicy_cajun_fries"] = {
		label = "Spicy Cajun Fries",
		weight = 100,
		stack = true,
		close = true,
		description = "Fries tossed in a spicy Cajun seasoning for an extra kick.",
		client = {
			image = "spicy_cajun_fries.png",
		}
	},

	["mc_flurry_cookies"] = {
		label = "Flurry Cookies",
		weight = 100,
		stack = true,
		close = true,
		description = "A delightful flurry featuring crushed cookies in creamy ice cream.",
		client = {
			image = "mc_flurry_cookies.png",
		}
	},

	["triple_meal_deal"] = {
		label = "Chicken Biscuit",
		weight = 100,
		stack = true,
		close = true,
		description = "A triple meal deal centered around a savory chicken biscuit.",
		client = {
			image = "triple_meal_deal.png",
		}
	},

	["fertilizer"] = {
		label = "Fertilizer",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "fertilizer.png",
		}
	},

	["meth_raw"] = {
		label = "Raw Meth",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "meth_raw.png",
		}
	},

	["mc_vanilla_shake"] = {
		label = "Vanilla Shake",
		weight = 100,
		stack = true,
		close = true,
		description = "A smooth and creamy vanilla shake for a sweet treat.",
		client = {
			image = "mc_vanilla_shake.png",
		}
	},

	["apple_fizz"] = {
		label = "Apple Sparkle",
		weight = 100,
		stack = true,
		close = true,
		description = "A sparkling apple drink with a refreshing fizz.",
		client = {
			image = "apple_fizz.png",
		}
	},

	["chicken_and_waffles"] = {
		label = "Chicken & Waffles",
		weight = 100,
		stack = true,
		close = true,
		description = "A delightful combo of crispy chicken and fluffy waffles.",
		client = {
			image = "chicken_and_waffles.png",
		}
	},

	["orange_juice"] = {
		label = "Orange Juice",
		weight = 100,
		stack = true,
		close = true,
		description = "Freshly squeezed orange juice packed with natural vitamin C.",
		client = {
			image = "orange_juice.png",
		}
	},

	["strawberry_watermelon_slushie"] = {
		label = "Strawberry Watermelon Slushie",
		weight = 100,
		stack = true,
		close = true,
		description = "A refreshing slushie blending sweet strawberry with cool watermelon.",
		client = {
			image = "strawberry_watermelon_slushie.png",
		}
	},

	["spicy_cherry_cola"] = {
		label = "Pepper Twist Cola",
		weight = 100,
		stack = true,
		close = true,
		description = "A unique cola with a spicy cherry twist and pepper kick.",
		client = {
			image = "spicy_cherry_cola.png",
		}
	},

	["mc_flurry_candies"] = {
		label = "Flurry Candies",
		weight = 100,
		stack = true,
		close = true,
		description = "A sweet twist on the classic flurry, mixed with colorful candies.",
		client = {
			image = "mc_flurry_candies.png",
		}
	},

	["buffalo_ranch_fries"] = {
		label = "BUFFALO RANCH FRIES",
		weight = 100,
		stack = true,
		close = true,
		description = "Fries tossed in a tangy buffalo and ranch blend.",
		client = {
			image = "buffalo_ranch_fries.png",
		}
	},

	["sausage_burrito"] = {
		label = "Sausage Burrito",
		weight = 100,
		stack = true,
		close = true,
		description = "A hearty burrito filled with savory sausage and flavorful ingredients.",
		client = {
			image = "sausage_burrito.png",
		}
	},

	["double_beef_supreme"] = {
		label = "Double Beef Supreme",
		weight = 100,
		stack = true,
		close = true,
		description = "An indulgent burger featuring double beef patties for extra flavor.",
		client = {
			image = "double_beef_supreme.png",
		}
	},

	["mc_iced_coffee"] = {
		label = "Iced Coffee",
		weight = 100,
		stack = true,
		close = true,
		description = "A chilled iced coffee that delivers a cool caffeine boost.",
		client = {
			image = "mc_iced_coffee.png",
		}
	},

	["mc_strawberry_shake"] = {
		label = "Strawberry Shake",
		weight = 100,
		stack = true,
		close = true,
		description = "A refreshing strawberry shake bursting with fruity flavor.",
		client = {
			image = "mc_strawberry_shake.png",
		}
	},

	["cheesy_burger_feast"] = {
		label = "Cheesy Burger Feast",
		weight = 100,
		stack = true,
		close = true,
		description = "A burger feast loaded with layers of melty, delicious cheese.",
		client = {
			image = "cheesy_burger_feast.png",
		}
	},

	["boneless_wings"] = {
		label = "BONELESS WINGS",
		weight = 100,
		stack = true,
		close = true,
		description = "Crispy boneless wings served with a tangy dipping sauce.",
		client = {
			image = "boneless_wings.png",
		}
	},

	["sausage_biscuit"] = {
		label = "Sausage Biscuit",
		weight = 100,
		stack = true,
		close = true,
		description = "A savory biscuit loaded with a flavorful sausage patty.",
		client = {
			image = "sausage_biscuit.png",
		}
	},

	["bites_group_pack"] = {
		label = "THIGH BITES GROUP PACK",
		weight = 100,
		stack = true,
		close = true,
		description = "A group pack of crispy thigh bites, ideal for parties.",
		client = {
			image = "bites_group_pack.png",
		}
	},

	["hot_fudge_sundae"] = {
		label = "Hot Fudge Sundae",
		weight = 100,
		stack = true,
		close = true,
		description = "A decadent sundae drizzled with warm hot fudge for dessert delight.",
		client = {
			image = "hot_fudge_sundae.png",
		}
	},

	["light_cola"] = {
		label = "Light Cola",
		weight = 100,
		stack = true,
		close = true,
		description = "A lighter version of cola with a crisp and refreshing taste.",
		client = {
			image = "light_cola.png",
		}
	},

	["chickenwings_dips"] = {
		label = "DIPS",
		weight = 100,
		stack = true,
		close = true,
		description = "A selection of flavorful dipping sauces for your wings.",
		client = {
			image = "chickenwings_dips.png",
		}
	},

	["thigh_bites_combo"] = {
		label = "LARGE THIGH BITES COMBO",
		weight = 100,
		stack = true,
		close = true,
		description = "A combo featuring large, savory thigh bites with sides.",
		client = {
			image = "thigh_bites_combo.png",
		}
	},

	["crispy_tenders"] = {
		label = "8 PC MEAL FOR 2 CRISPY TENDERS",
		weight = 100,
		stack = true,
		close = true,
		description = "A meal for two featuring 8 crispy chicken tenders.",
		client = {
			image = "crispy_tenders.png",
		}
	},

	["large_thigh_bites"] = {
		label = "LARGE THIGH BITES",
		weight = 100,
		stack = true,
		close = true,
		description = "A generous serving of large, savory thigh bites.",
		client = {
			image = "large_thigh_bites.png",
		}
	},

	["thirty_crispy_tenders"] = {
		label = "30 CRISPY TENDERS",
		weight = 100,
		stack = true,
		close = true,
		description = "A hearty serving of 30 crispy chicken tenders.",
		client = {
			image = "thirty_crispy_tenders.png",
		}
	},

	["quarter_beef_burger_cheese"] = {
		label = "Quarter Beef Burger Cheese",
		weight = 100,
		stack = true,
		close = true,
		description = "A classic beef burger topped with a generous layer of melted cheese.",
		client = {
			image = "quarter_beef_burger_cheese.png",
		}
	},

	["medium_citrus_spark"] = {
		label = "Medium Citrus Spark",
		weight = 100,
		stack = true,
		close = true,
		description = "A medium soda with a lively burst of citrus energy.",
		client = {
			image = "medium_citrus_spark.png",
		}
	},

	["classic_wings_combo"] = {
		label = "CLASSIC WINGS COMBO",
		weight = 100,
		stack = true,
		close = true,
		description = "A classic combo of wings paired with your favorite dipping sauce.",
		client = {
			image = "classic_wings_combo.png",
		}
	},

	["tropical_mango_slushie"] = {
		label = "Tropical Mango Slushie",
		weight = 100,
		stack = true,
		close = true,
		description = "A refreshing slushie bursting with sweet tropical mango flavor.",
		client = {
			image = "tropical_mango_slushie.png",
		}
	},

	["meth_pooch"] = {
		label = "Meth Pooch",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "meth_pooch.png",
		}
	},

	["side_of_flavor"] = {
		label = "SIDE OF FLAVOR",
		weight = 100,
		stack = true,
		close = true,
		description = "A side dish bursting with a medley of bold flavors.",
		client = {
			image = "side_of_flavor.png",
		}
	},

	["meal_for_two"] = {
		label = "15PC MEAL FOR 2",
		weight = 100,
		stack = true,
		close = true,
		description = "A 15-piece meal designed for two, perfect for sharing.",
		client = {
			image = "meal_for_two.png",
		}
	},

	["veggie_sticks"] = {
		label = "VEGGIE STICKS",
		weight = 100,
		stack = true,
		close = true,
		description = "Crunchy veggie sticks for a healthy, fresh side.",
		client = {
			image = "veggie_sticks.png",
		}
	},

	["double_stack_deluxe_combo"] = {
		label = "Double Stack Deluxe Combo",
		weight = 100,
		stack = true,
		close = true,
		description = "A combo meal featuring the Double Stack Deluxe with sides and a drink.",
		client = {
			image = "double_stack_deluxe_combo.png",
		}
	},

	["wing_combo"] = {
		label = "LARGE 10 PC WING COMBO",
		weight = 100,
		stack = true,
		close = true,
		description = "A large combo featuring 10 crispy wings with sides.",
		client = {
			image = "wing_combo.png",
		}
	},

	["golden_crispy_fries"] = {
		label = "Golden Crispy Fries",
		weight = 100,
		stack = true,
		close = true,
		description = "Crispy, golden fries that are perfectly seasoned for a savory treat.",
		client = {
			image = "golden_crispy_fries.png",
		}
	},

	["laundrycard"] = {
		label = "Laundry Card",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "laundrycard.png",
		}
	},

	["mc_cappuccino"] = {
		label = "Cappuccino",
		weight = 100,
		stack = true,
		close = true,
		description = "A classic cappuccino with a perfect balance of espresso and foam.",
		client = {
			image = "mc_cappuccino.png",
		}
	},

	["classic_cola"] = {
		label = "Classic Cola",
		weight = 100,
		stack = true,
		close = true,
		description = "An all-time favorite cola with a crisp, refreshing taste.",
		client = {
			image = "classic_cola.png",
		}
	},

	["cajun_fried_corn"] = {
		label = "CAJUN FRIED CORN",
		weight = 100,
		stack = true,
		close = true,
		description = "Crispy fried corn seasoned with bold Cajun spices.",
		client = {
			image = "cajun_fried_corn.png",
		}
	},

	["sunrise_muffin"] = {
		label = "Egg Muffin",
		weight = 100,
		stack = true,
		close = true,
		description = "A warm egg muffin, ideal for a quick and satisfying breakfast.",
		client = {
			image = "sunrise_muffin.png",
		}
	},

	["spicy_chicken_sandwich_combo"] = {
		label = "Spicy Chicken Sandwich Combo",
		weight = 100,
		stack = true,
		close = true,
		description = "A combo meal centered around a spicy chicken sandwich with sides.",
		client = {
			image = "spicy_chicken_sandwich_combo.png",
		}
	},

	["double_stack_deluxe"] = {
		label = "Double Stack Deluxe",
		weight = 100,
		stack = true,
		close = true,
		description = "A towering burger featuring double layers of premium ingredients.",
		client = {
			image = "double_stack_deluxe.png",
		}
	},

	["crispy_chicken_sandwich"] = {
		label = "Crispy Chicken Sandwich",
		weight = 100,
		stack = true,
		close = true,
		description = "A classic crispy chicken sandwich with a perfectly crunchy coating.",
		client = {
			image = "crispy_chicken_sandwich.png",
		}
	},

	["cheese_sauce"] = {
		label = "CHEESE SAUCE",
		weight = 100,
		stack = true,
		close = true,
		description = "Rich, creamy cheese sauce perfect for dipping or drizzling.",
		client = {
			image = "cheese_sauce.png",
		}
	},

	["mc_fruit_punch"] = {
		label = "Fruit Punch",
		weight = 100,
		stack = true,
		close = true,
		description = "A bold fruit punch that delivers a burst of tropical sweetness.",
		client = {
			image = "mc_fruit_punch.png",
		}
	},

	["group_pack"] = {
		label = "WINGS & THIGH BITES GROUP PACK",
		weight = 100,
		stack = true,
		close = true,
		description = "A group pack combining wings and thigh bites for sharing.",
		client = {
			image = "group_pack.png",
		}
	},

	["egg_cheese_biscuit"] = {
		label = "Egg Cheese Biscuit",
		weight = 100,
		stack = true,
		close = true,
		description = "A satisfying biscuit loaded with egg and melted cheese.",
		client = {
			image = "egg_cheese_biscuit.png",
		}
	},

	["weed_pooch"] = {
		label = "Weed Pooch",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "weed_pooch.png",
		}
	},

	["weed_tak47"] = {
		label = "Trimmed AK47",
		weight = 0,
		stack = true,
		close = true,
		description = "Trimmed AK47",
		client = {
			image = "og_kush_weed.png",
		}
	},

	["largeoutfitbag"] = {
		label = "Outfit Bag L",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "largeoutfitbag.png",
		}
	},

	["smalloutfitbag"] = {
		label = "Outfit Bag S",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "smalloutfitbag.png",
		}
	},

	["weaponrepairkit"] = {
		label = "Weapon Repairkit",
		weight = 2500,
		stack = true,
		close = true,
		description = "A nice toolbox with stuff to repair your vehicle",
		client = {
			image = "repairkit.png",
		}
	},

	["plastic_fork"] = {
		label = "Plastic fork",
		weight = 5,
		stack = true,
		close = false,
		description = "Plastic fork",
		client = {
			image = "plastic_fork.png",
		}
	},

	["metal_scrap"] = {
		label = "Metal scrap",
		weight = 10,
		stack = true,
		close = true,
		description = "Metal scrap",
		client = {
			image = "metal_scrap.png",
		}
	},

	["electric_cable"] = {
		label = "Electric cable",
		weight = 10,
		stack = true,
		close = false,
		description = "Electric cable",
		client = {
			image = "electric_cable.png",
		}
	},

	["electronic_scrap"] = {
		label = "Electronic scrap",
		weight = 10,
		stack = true,
		close = false,
		description = "Electronic scrap",
		client = {
			image = "electronic_scrap.png",
		}
	},

	["jail_security_card"] = {
		label = "Prison security card",
		weight = 50,
		stack = true,
		close = false,
		description = "Prison security card",
		client = {
			image = "jail_security_card.png",
		}
	},

	["tape"] = {
		label = "Tape",
		weight = 10,
		stack = true,
		close = false,
		description = "Tape",
		client = {
			image = "tape.png",
		}
	},

	["sharpened_plastic_spoon"] = {
		label = "Sharpened plastic spoon",
		weight = 5,
		stack = true,
		close = true,
		description = "Sharpened plastic spoon",
		client = {
			image = "sharpened_plastic_spoon.png",
		}
	},

	["tin_foil"] = {
		label = "Tin foil",
		weight = 10,
		stack = true,
		close = false,
		description = "Tin foil",
		client = {
			image = "tin_foil.png",
		}
	},

	["jail_lab_tools"] = {
		label = "Laboratory Equipment",
		weight = 100,
		stack = true,
		close = false,
		description = "Laboratory Equipment",
		client = {
			image = "jail_lab_tools.png",
		}
	},

	["jail_cigarette"] = {
		label = "Cigarette",
		weight = 10,
		stack = true,
		close = false,
		description = "Cigarette",
		client = {
			image = "jail_cigarette.png",
		}
	},

	["ankle_monitor"] = {
		label = "Ankle Monitor",
		weight = 500,
		stack = false,
		close = true,
		description = "Ankle monitor",
		client = {
			image = "ankle_monitor.png",
		}
	},

	["battery"] = {
		label = "Battery",
		weight = 250,
		stack = false,
		close = false,
		description = "Battery",
		client = {
			image = "battery.png",
		}
	},

	["sharpened_plastic_knife"] = {
		label = "Sharpened plastic knife",
		weight = 5,
		stack = true,
		close = true,
		description = "Sharpened plastic knife",
		client = {
			image = "sharpened_plastic_knife.png",
		}
	},

	["jail_explosive"] = {
		label = "Handmade explosive",
		weight = 500,
		stack = true,
		close = true,
		description = "Handmade explosive",
		client = {
			image = "jail_explosive.png",
		}
	},

	["jail_chemicals"] = {
		label = "Chemicals",
		weight = 10,
		stack = true,
		close = false,
		description = "Chemicals",
		client = {
			image = "jail_chemicals.png",
		}
	},

	["fence_cutters"] = {
		label = "Fence cutters",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fence cutters",
		client = {
			image = "fence_cutters.png",
		}
	},

	["metal_pipe"] = {
		label = "Metal pipe",
		weight = 10,
		stack = true,
		close = false,
		description = "Metal pipe",
		client = {
			image = "metal_pipe.png",
		}
	},

	["prison_mdt"] = {
		label = "Prison MDT",
		weight = 100,
		stack = true,
		close = true,
		description = "Prison MDT",
		client = {
			image = "prison_mdt.png",
		}
	},

	["slammer"] = {
		label = "Slammer",
		weight = 10,
		stack = true,
		close = false,
		description = "Slammer",
		client = {
			image = "slammer.png",
		}
	},

	["jail_lighter"] = {
		label = "Handmade lighter",
		weight = 50,
		stack = true,
		close = true,
		description = "Handmade lighter",
		client = {
			image = "jail_lighter.png",
		}
	},

	["prisunflower_seed"] = {
		label = "Prisunflower Seed",
		weight = 10,
		stack = true,
		close = true,
		description = "Prisunflower Seed",
		client = {
			image = "prisunflower_seed.png",
		}
	},

	["gunpowder"] = {
		label = "Gunpowder",
		weight = 10,
		stack = true,
		close = false,
		description = "Gunpowder",
		client = {
			image = "gunpowder.png",
		}
	},

	["prisunflower"] = {
		label = "Prisunflower",
		weight = 50,
		stack = true,
		close = false,
		description = "Prisunflower",
		client = {
			image = "prisunflower.png",
		}
	},

	["power_saw"] = {
		label = "Power Saw",
		weight = 5000,
		stack = false,
		close = true,
		description = "Power Saw",
		client = {
			image = "power_saw.png",
		}
	},

	["watering_can"] = {
		label = "Watering Can",
		weight = 2500,
		stack = true,
		close = false,
		description = "Watering Can",
		client = {
			image = "watering_can.png",
		}
	},

	["sharpened_plastic_fork"] = {
		label = "Sharpened plastic fork",
		weight = 5,
		stack = true,
		close = true,
		description = "sharpened_plastic_fork",
		client = {
			image = "sharpened_plastic_fork.png",
		}
	},

	["plastic_knife"] = {
		label = "Plastic knife",
		weight = 5,
		stack = true,
		close = false,
		description = "Plastic knife",
		client = {
			image = "plastic_knife.png",
		}
	},

	["plastic_spoon"] = {
		label = "Plastic spoon",
		weight = 5,
		stack = true,
		close = false,
		description = "Plastic spoon",
		client = {
			image = "plastic_spoon.png",
		}
	},

	["ifak"] = {
		label = "IFAK",
		weight = 50,
		stack = true,
		close = true,
		description = "IFAK",
		client = {
			image = "ifak.png",
		}
	},

	["plastic_scrap"] = {
		label = "Plastic scrap",
		weight = 10,
		stack = true,
		close = false,
		description = "Plastic scrap",
		client = {
			image = "plastic_scrap.png",
		}
	},

	["freedom_chip"] = {
		label = "A32 Freedom Chip",
		weight = 10,
		stack = true,
		close = true,
		description = "A32 Freedom Chip",
		client = {
			image = "freedom_chip.png",
		}
	},

	["jail_shovel"] = {
		label = "Handmade shovel",
		weight = 3000,
		stack = false,
		close = true,
		description = "Handmade shovel",
		client = {
			image = "jail_shovel.png",
		}
	},

	["can"] = {
		label = "Empty Can",
		weight = 10,
		stack = true,
		close = false,
		description = "An empty can, good for recycling",
		client = {
			image = "can.png",
		}
	},

	["ruby_earring"] = {
		label = "Ruby Earrings",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ruby_earring.png",
		}
	},

	["copperore"] = {
		label = "Copper Ore",
		weight = 1000,
		stack = true,
		close = false,
		description = "Copper, a base ore.",
		client = {
			image = "copperore.png",
		}
	},

	["sapphire_ring"] = {
		label = "Sapphire Ring",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "sapphire_ring.png",
		}
	},

	["goldpan"] = {
		label = "Gold Panning Tray",
		weight = 10,
		stack = true,
		close = false,
		description = "Don't worry you'll hit gold eventually!",
		client = {
			image = "goldpan.png",
		}
	},

	["sapphire_necklace_silver"] = {
		label = "Sapphire Necklace Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "sapphire_necklace_silver.png",
		}
	},

	["emerald_necklace_silver"] = {
		label = "Emerald Necklace Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "emerald_necklace_silver.png",
		}
	},

	["drillbit"] = {
		label = "Drill Bit",
		weight = 10,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "drillbit.png",
		}
	},

	["emerald_ring_silver"] = {
		label = "Emerald Ring Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "emerald_ring_silver.png",
		}
	},

	["carbon"] = {
		label = "Carbon",
		weight = 1000,
		stack = true,
		close = false,
		description = "Carbon, a base ore.",
		client = {
			image = "carbon.png",
		}
	},

	["sapphire_earring_silver"] = {
		label = "Sapphire Earrings Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "sapphire_earring_silver.png",
		}
	},

	["sapphire_necklace"] = {
		label = "Sapphire Necklace",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "sapphire_necklace.png",
		}
	},

	["diamond_earring_silver"] = {
		label = "Diamond Earrings Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "diamond_earring_silver.png",
		}
	},

	["sapphire_earring"] = {
		label = "Sapphire Earrings",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "sapphire_earring.png",
		}
	},

	["silverore"] = {
		label = "Silver Ore",
		weight = 1000,
		stack = true,
		close = false,
		description = "Silver Ore",
		client = {
			image = "silverore.png",
		}
	},

	["emerald_necklace"] = {
		label = "Emerald Necklace",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "emerald_necklace.png",
		}
	},

	["bottle"] = {
		label = "Empty Bottle",
		weight = 10,
		stack = true,
		close = false,
		description = "A glass bottle",
		client = {
			image = "bottle.png",
		}
	},

	["goldore"] = {
		label = "Gold Ore",
		weight = 1000,
		stack = true,
		close = false,
		description = "Gold Ore",
		client = {
			image = "goldore.png",
		}
	},

	["miningdrill"] = {
		label = "Mining Drill",
		weight = 1000,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "miningdrill.png",
		}
	},

	["goldearring"] = {
		label = "Golden Earrings",
		weight = 200,
		stack = true,
		close = false,
		description = "Golden earrings for your Golden Girl",
		client = {
			image = "gold_earring.png",
		}
	},

	["ruby"] = {
		label = "Ruby",
		weight = 150,
		stack = true,
		close = false,
		description = "A shiny Ruby gemstone!",
		client = {
			image = "ruby.png",
		}
	},

	["emerald"] = {
		label = "Emerald",
		weight = 150,
		stack = true,
		close = false,
		description = "A shiny Emerald gemstone!",
		client = {
			image = "emerald.png",
		}
	},

	["silverearring"] = {
		label = "Silver Earrings",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "silver_earring.png",
		}
	},

	["goldingot"] = {
		label = "Gold Ingot",
		weight = 1000,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "goldingot.png",
		}
	},

	["uncut_diamond"] = {
		label = "Uncut Diamond",
		weight = 100,
		stack = true,
		close = false,
		description = "A rough Diamond",
		client = {
			image = "uncut_diamond.png",
		}
	},

	["diamond_necklace"] = {
		label = "Diamond Necklace",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "diamond_necklace.png",
		}
	},

	["ruby_necklace_silver"] = {
		label = "Ruby Necklace Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ruby_necklace_silver.png",
		}
	},

	["diamond_ring_silver"] = {
		label = "Diamond Ring Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "diamond_ring_silver.png",
		}
	},

	["gold_ring"] = {
		label = "Gold Ring",
		weight = 200,
		stack = true,
		close = false,
		description = "A diamond ring seems like the jackpot to me!",
		client = {
			image = "gold_ring.png",
		}
	},

	["stone"] = {
		label = "Stone",
		weight = 2000,
		stack = true,
		close = false,
		description = "Stone woo",
		client = {
			image = "stone.png",
		}
	},

	["ironore"] = {
		label = "Iron Ore",
		weight = 1000,
		stack = true,
		close = false,
		description = "Iron, a base ore.",
		client = {
			image = "ironore.png",
		}
	},

	["silverchain"] = {
		label = "Silver Chain",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "silverchain.png",
		}
	},

	["ruby_ring"] = {
		label = "Ruby Ring",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ruby_ring.png",
		}
	},

	["mininglaser"] = {
		label = "Mining Laser",
		weight = 900,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "mininglaser.png",
		}
	},

	["diamond_necklace_silver"] = {
		label = "Diamond Necklace Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "diamond_necklace_silver.png",
		}
	},

	["silveringot"] = {
		label = "Silver Ingot",
		weight = 1000,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "silveringot.png",
		}
	},

	["uncut_emerald"] = {
		label = "Uncut Emerald",
		weight = 100,
		stack = true,
		close = false,
		description = "A rough Emerald",
		client = {
			image = "uncut_emerald.png",
		}
	},

	["sapphire"] = {
		label = "Sapphire",
		weight = 150,
		stack = true,
		close = false,
		description = "A shiny Sapphire gemstone!",
		client = {
			image = "sapphire.png",
		}
	},

	["emerald_ring"] = {
		label = "Emerald Ring",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "emerald_ring.png",
		}
	},

	["ruby_ring_silver"] = {
		label = "Ruby Ring Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ruby_ring_silver.png",
		}
	},

	["uncut_ruby"] = {
		label = "Uncut Ruby",
		weight = 100,
		stack = true,
		close = false,
		description = "A rough Ruby",
		client = {
			image = "uncut_ruby.png",
		}
	},

	["emerald_earring"] = {
		label = "Emerald Earrings",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "emerald_earring.png",
		}
	},

	["uncut_sapphire"] = {
		label = "Uncut Sapphire",
		weight = 100,
		stack = true,
		close = false,
		description = "A rough Sapphire",
		client = {
			image = "uncut_sapphire.png",
		}
	},

	["pickaxe"] = {
		label = "Pickaxe",
		weight = 1000,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "pickaxe.png",
		}
	},

	["ruby_earring_silver"] = {
		label = "Ruby Earrings Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ruby_earring_silver.png",
		}
	},

	["silver_ring"] = {
		label = "Silver Ring",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "silver_ring.png",
		}
	},

	["emerald_earring_silver"] = {
		label = "Emerald Earrings Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "emerald_earring_silver.png",
		}
	},

	["sapphire_ring_silver"] = {
		label = "Sapphire Ring Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "A sparkling ring of sapphire.",
		client = {
			image = "sapphire_ring_silver.png",
		}
	},

	["diamond_earring"] = {
		label = "Diamond Earrings",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "diamond_earring.png",
		}
	},

	["ruby_necklace"] = {
		label = "Ruby Necklace",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ruby_necklace.png",
		}
	},

	["tigerbrick"] = {
		label = "Tiger Brick",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "tigerbrick.png",
		}
	},

	["lean"] = {
		label = "Lean",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "lean.png",
		}
	},

	["babybottle"] = {
		label = "Baby Bottle",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "babybottle.png",
		}
	},

	["leafbrick"] = {
		label = "Leaf Brick",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "leafbrick.png",
		}
	},

	["ak47brick"] = {
		label = "ak47 Brick",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ak47brick.png",
		}
	},

	["leancup"] = {
		label = "Lean Cup",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "leancup.png",
		}
	},

	["kushbrick"] = {
		label = "Kush Brick",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "kushbrick.png",
		}
	},

	["vacuumsealer"] = {
		label = "Vacuum Sealer",
		weight = 0,
		stack = true,
		close = true,
		description = "Vacuum Sealer",
		client = {
			image = "vacuumsealer.png",
		}
	},

	['backpack'] = {
		label = 'Backpack',
		weight = 0,
		stack = false,
		consume = 0,
		client = {
			export = 'wasabi_backpack.openBackpack'
		}
	},

	

	["tier1giftbox"] = {
		label = "Male Gift Box",
		weight = 500,
		stack = true,
		close = true,
		description = "Wow! A tier 1 gift box!",
		client = {
			image = "tier1giftbox.png",
		}
	},

	["tier2giftbox"] = {
		label = "Female Gift Box",
		weight = 500,
		stack = true,
		close = true,
		description = "Wow! A tier 2 gift box!",
		client = {
			image = "tier2giftbox.png",
		}
	},

	["tier4giftbox"] = {
		label = "Tier 4 Gift Box",
		weight = 500,
		stack = true,
		close = true,
		description = "Wow! A tier 4 gift box!",
		client = {
			image = "tier4giftbox.png",
		}
	},

	["tier3giftbox"] = {
		label = "Tier 3 Gift Box",
		weight = 500,
		stack = true,
		close = true,
		description = "Wow! A tier 3 gift box!",
		client = {
			image = "tier3giftbox.png",
		}
	},

	["tier5giftbox"] = {
		label = "Tier 5 Gift Box",
		weight = 500,
		stack = true,
		close = true,
		description = "Wow! A tier 5 gift box!",
		client = {
			image = "tier5giftbox.png",
		}
	},

	["empty_lash_box"] = {
	label = "Empty Lash Box",
	weight = 0.5,
	stack = true,
	close = true,
},

["strips"] = {
	label = "Strips",
	weight = 0.2,
	stack = true,
	close = true,
},

["eyelash_glue"] = {
	label = "Eyelash Glue",
	weight = 0.1,
	stack = true,
	close = true,
},

["lashes_phone"] = {
	label = "Lashes Phone",
	weight = 1.2,
	stack = false,
	close = true,
},

["lashes_table"] = {
	label = "Lashes Table",
	weight = 1,
	stack = true,
	close = true,
},

["ellipse_lashes"] = {
	label = "Ellipse Lashes",
	weight = 0.3,
	stack = true,
	close = true,
},

["faux_mink_lashes"] = {
	label = "Faux Mink Lashes",
	weight = 0.25,
	stack = true,
	close = true,
},

["mink_lashes"] = {
	label = "Mink Lashes",
	weight = 0.2,
	stack = true,
	close = true,
},

["silk_lashes"] = {
	label = "Silk Lashes",
	weight = 0.15,
	stack = true,
	close = true,
},

["synthetic_lashes"] = {
	label = "Synthetic Lashes",
	weight = 0.3,
	stack = true,
	close = true,
},

["volume_lashes"] = {
	label = "Volume Lashes",
	weight = 0.4,
	stack = true,
	close = true,
},


	["babyoil"] = {
		label = "Baby Oil",
		weight = 500,
		stack = true,
		close = true,
		description = "Use this to make your skin shiny and healthy!",
	},


	['bag'] = {
    label = 'Bag',
    weight = 160,
	},
['big_drill'] = {
    label = 'Big Drill',
    weight = 160,
},
['hack_usb'] = {
    label = 'Hack USB',
    weight = 160,
},
['gold'] = {
    label = 'Gold',
    weight = 160,
},


['cutter'] = {
    label = 'Cutter',
    weight = 160,
},
['c4_bomb'] = {
    label = 'C4 Bomb',
    weight = 160,
},
['thermite_bomb'] = {
    label = 'Thermite Bomb',
    weight = 160,
},



['vandiamond'] = {
    label = 'vandiamond',
    weight = 160,
},
['vanpanther'] = {
    label = 'vanpanther',
    weight = 160,
},
['vannecklace'] = {
    label = 'vannecklace',
    weight = 160,
},
['vanbottle'] = {
    label = 'vanbottle',
    weight = 160,
},
['vanpogo'] = {
    label = 'vanpogo',
    weight = 160,
},
['paintingf'] = {
    label = 'Painting E',
    weight = 160,
},
['paintingg'] = {
    label = 'Painting F',
    weight = 160,
},


	["methbrick"] = {
		label = "Meth Brick",
		weight = 1000,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "methbrick.png",
		}
	},

	["meth_pouch"] = {
		label = "Meth Pouch",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "meth_pouch.png",
		}
	},

	["coke_pouch"] = {
		label = "Coke Pouch",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "coke_pouch.png",
		}
	},

	["acidsupply"] = {
		label = "Acid Supply",
		weight = 1000,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "acidsupply.png",
		}
	},

	["flarestick"] = {
		label = "Flare Stick",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "flarestick.png",
		}
	},

	["lsd"] = {
		label = "LSD",
		weight = 10,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "lsd.png",
		}
	},

	["weed_pouch"] = {
		label = "Weed Pouch",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "weed_pouch.png",
		}
	},

	["burnerphone"] = {
		label = "Burner Phone",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "burnerphone.png",
		}
	},

	["weedbrick"] = {
		label = "Weed Brick",
		weight = 1000,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "weedbrick.png",
		}
	},

	["paintremover"] = {
		label = "Paint Remover",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "paintremover.png",
		}
	},

	["spraycan"] = {
		label = "Spray Can",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "spraycan.png",
		}
	},

	["cokepouch"] = {
		label = "Coke Pouch",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "cokepouch.png",
		}
	},

	["weedpouch"] = {
		label = "Weed Pouch",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "weedpouch.png",
		}
	},

	["methpouch"] = {
		label = "Meth Pouch",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "methpouch.png",
		}
	},

	-- ull Christmas Event
	["mystery_package"] = {
		label = "Sealed box wrapped in gift paper",
		weight = 1000,
		stack = false,
		close = true,
	},

	["contract"] = {
		label = "Auto Contract",
		weight = 100,
		stack = true,
		close = true,
		description = "Sell your car",
		client = {
			image = "contract.png",
		}
	},


	["female_pack"] = {
		label = "Female Starter Pack",
		weight = 500,
		stack = false,
		close = true,
		description = "You can use to get your starter pack",
		client = {
			image = "giftbox.png",
		}
	},

	["vip_pack"] = {
		label = "VIP Starter Pack",
		weight = 500,
		stack = false,
		close = true,
		description = "You can use to get your starter pack",
		client = {
			image = "giftbox.png",
		}
	},

	["pd_pack"] = {
		label = "PD Starter Pack",
		weight = 500,
		stack = false,
		close = true,
		description = "You can use to get your starter pack",
		client = {
			image = "giftbox.png",
		}
	},

	["ems_pack"] = {
		label = "EMS Starter Pack",
		weight = 500,
		stack = false,
		close = true,
		description = "You can use to get your starter pack",
		client = {
			image = "giftbox.png",
		}
	},




	["emptyslip"] = {
		label = "Empty Cheque",
		weight = 100,
		stack = false,
		close = false,
		description = "Empty Cheque",
		client = {
			image = "emptyslip.png",
		}
	},

	["emptychip"] = {
		label = "Empty Card Chip",
		weight = 500,
		stack = false,
		close = true,
		description = "For Scanning Card Stuff",
		client = {
			image = "emptychip.png",
		}
	},

	["fraudprinter"] = {
		label = "Fraud Printer",
		weight = 500,
		stack = false,
		close = true,
		description = "For Printing Stuff",
		client = {
			image = "fraudprinter.png",
		}
	},

	["fraudscaner"] = {
		label = "Fraud Scanner",
		weight = 500,
		stack = false,
		close = true,
		description = "For Scanning Card Stuff",
		client = {
			image = "fraudscaner.png",
		}
	},

	["fraudgnei"] = {
		label = "Power Generator",
		weight = 2000,
		stack = false,
		close = true,
		description = "Power Geni",
		client = {
			image = "fraudgnei.png",
		}
	},

	["emptycard"] = {
		label = "Empty Card",
		weight = 500,
		stack = false,
		close = true,
		description = "For Scanning Card Stuff",
		client = {
			image = "emptycard.png",
		}
	},

	["fraudlaptop"] = {
		label = "Fraud Laptop",
		weight = 4000,
		stack = false,
		close = true,
		description = "Fraud Laptop",
		client = {
			image = "fraudlaptop.png",
		}
	},

	["clonedcard"] = {
		label = "Cloned Card",
		weight = 500,
		stack = true,
		close = true,
		description = "Fraud Card",
		client = {
			image = "clonedcard.png",
		}
	},

	["fraudcheque"] = {
		label = "Fraud Cheque",
		weight = 100,
		stack = true,
		close = false,
		description = "Cheque",
		client = {
			image = "fraudcheque.png",
		}
	},

		['djs_box_beefpatties'] = {
		label = 'Beef Patties',
		weight = 1,
		stack = true,
		close = true,
		client = {
			status = { hunger = 2000000 },
			anim = { dict = 'anim@djs@food@plated', clip = 'djs_food_plate_bite_loop' },        
			prop = {model = 'djs_box_beefpatties',
    		bone = 18905,
    		pos = vec3(0.140000, 0.000000, 0.000000),
    		rot = vec3(0.000000, 0.000000, 0.000000)
		},
		propTwo = { model = 'djs_fork',
		bone = 58868,
    	pos = vec3(0.000000, -0.014000, 0.030000),
    	rot = vec3(6.608002, 0.000000, 94.989883)
		},
		usetime = 17500,
		cancel = true,
		notification = 'You have satistfied your hunger'
		},
	},
	['djs_box_goatcurryandrice'] = {
		label = 'Goat Curry and Rice',
		weight = 1,
		stack = true,
		close = true,
		client = {
			status = { hunger = 2000000 },
			anim = { dict = 'anim@djs@food@plated', clip = 'djs_food_plate_bite_loop' },        
			prop = {model = 'djs_box_goatcurryandrice',
    		bone = 18905,
    		pos = vec3(0.140000, 0.000000, 0.000000),
    		rot = vec3(0.000000, 0.000000, 0.000000)
		},
		propTwo = { model = 'djs_fork',
		bone = 58868,
    	pos = vec3(0.000000, -0.014000, 0.030000),
    	rot = vec3(6.608002, 0.000000, 94.989883)
		},
		usetime = 17500,
		cancel = true,
		notification = 'You have satistfied your hunger'
		},
	},
	['djs_box_grizzadatarts'] = {
		label = 'Grizzada Tarts',
		weight = 1,
		stack = true,
		close = true,
		client = {
			status = { hunger = 2000000 },
			anim = { dict = 'anim@djs@food@plated', clip = 'djs_food_plate_bite_loop' },        
			prop = {model = 'djs_box_grizzadatarts',
    		bone = 18905,
    		pos = vec3(0.140000, 0.000000, 0.000000),
    		rot = vec3(0.000000, 0.000000, 0.000000)
		},
		propTwo = { model = 'djs_fork',
		bone = 58868,
    	pos = vec3(0.000000, -0.014000, 0.030000),
    	rot = vec3(6.608002, 0.000000, 94.989883)
		},
		usetime = 17500,
		cancel = true,
		notification = 'You have satistfied your hunger'
		},
	},
	['djs_box_jamicanshortribs'] = {
		label = 'Jamican Short Ribs',
		weight = 1,
		stack = true,
		close = true,
		client = {
			status = { hunger = 2000000 },
			anim = { dict = 'anim@djs@food@plated', clip = 'djs_food_plate_bite_loop' },        
			prop = {model = 'djs_box_jamicanshortribs',
    		bone = 18905,
    		pos = vec3(0.140000, 0.000000, 0.000000),
    		rot = vec3(0.000000, 0.000000, 0.000000)
		},
		propTwo = { model = 'djs_fork',
		bone = 58868,
    	pos = vec3(0.000000, -0.014000, 0.030000),
    	rot = vec3(6.608002, 0.000000, 94.989883)
		},
		usetime = 17500,
		cancel = true,
		notification = 'You have satistfied your hunger'
		},
	},
	['djs_box_jerkchicken'] = {
		label = 'Jerk Chicken',
		weight = 1,
		stack = true,
		close = true,
		client = {
			status = { hunger = 2000000 },
			anim = { dict = 'anim@djs@food@plated', clip = 'djs_food_plate_bite_loop' },        
			prop = {model = 'djs_box_jerkchicken',
    		bone = 18905,
    		pos = vec3(0.140000, 0.000000, 0.000000),
    		rot = vec3(0.000000, 0.000000, 0.000000)
		},
		propTwo = { model = 'djs_fork',
		bone = 58868,
    	pos = vec3(0.000000, -0.014000, 0.030000),
    	rot = vec3(6.608002, 0.000000, 94.989883)
		},
		usetime = 17500,
		cancel = true,
		notification = 'You have satistfied your hunger'
		},
	},
	['djs_box_jerkpork'] = {
		label = 'Jerk Pork',
		weight = 1,
		stack = true,
		close = true,
		client = {
			status = { hunger = 2000000 },
			anim = { dict = 'anim@djs@food@plated', clip = 'djs_food_plate_bite_loop' },        
			prop = {model = 'djs_box_jerkpork',
    		bone = 18905,
    		pos = vec3(0.140000, 0.000000, 0.000000),
    		rot = vec3(0.000000, 0.000000, 0.000000)
		},
		propTwo = { model = 'djs_fork',
		bone = 58868,
    	pos = vec3(0.000000, -0.014000, 0.030000),
    	rot = vec3(6.608002, 0.000000, 94.989883)
		},
		usetime = 17500,
		cancel = true,
		notification = 'You have satistfied your hunger'
		},
	},
	['djs_box_oxtailmac'] = {
		label = 'Oxtail & ,Mac',
		weight = 1,
		stack = true,
		close = true,
		client = {
			status = { hunger = 2000000 },
			anim = { dict = 'anim@djs@food@plated', clip = 'djs_food_plate_bite_loop' },        
			prop = {model = 'djs_box_oxtailmac',
    		bone = 18905,
    		pos = vec3(0.140000, 0.000000, 0.000000),
    		rot = vec3(0.000000, 0.000000, 0.000000)
		},
		propTwo = { model = 'djs_fork',
		bone = 58868,
    	pos = vec3(0.000000, -0.014000, 0.030000),
    	rot = vec3(6.608002, 0.000000, 94.989883)
		},
		usetime = 17500,
		cancel = true,
		notification = 'You have satistfied your hunger'
		},
	},
	['djs_box_oxtailrice'] = {
		label = 'Oxtail & Rice',
		weight = 1,
		stack = true,
		close = true,
		client = {
			status = { hunger = 2000000 },
			anim = { dict = 'anim@djs@food@plated', clip = 'djs_food_plate_bite_loop' },        
			prop = {model = 'djs_box_oxtailrice',
    		bone = 18905,
    		pos = vec3(0.140000, 0.000000, 0.000000),
    		rot = vec3(0.000000, 0.000000, 0.000000)
		},
		propTwo = { model = 'djs_fork',
		bone = 58868,
    	pos = vec3(0.000000, -0.014000, 0.030000),
    	rot = vec3(6.608002, 0.000000, 94.989883)
		},
		usetime = 17500,
		cancel = true,
		notification = 'You have satistfied your hunger'
		},
	},
	['djs_box_rastapasta'] = {
		label = 'Rasta Pasta',
		weight = 1,
		stack = true,
		close = true,
		client = {
			status = { hunger = 2000000 },
			anim = { dict = 'anim@djs@food@plated', clip = 'djs_food_plate_bite_loop' },        
			prop = {model = 'djs_box_rastapasta',
    		bone = 18905,
    		pos = vec3(0.140000, 0.000000, 0.000000),
    		rot = vec3(0.000000, 0.000000, 0.000000)
		},
		propTwo = { model = 'djs_fork',
		bone = 58868,
    	pos = vec3(0.000000, -0.014000, 0.030000),
    	rot = vec3(6.608002, 0.000000, 94.989883)
		},
		usetime = 17500,
		cancel = true,
		notification = 'You have satistfied your hunger'
		},
	},
	['djs_box_seafoodgumbo'] = {
		label = 'Seafood Gumbo',
		weight = 1,
		stack = true,
		close = true,
		client = {
			status = { hunger = 2000000 },
			anim = { dict = 'anim@djs@food@plated', clip = 'djs_food_plate_bite_loop' },        
			prop = {model = 'djs_box_rastapasta',
    		bone = 18905,
    		pos = vec3(0.140000, 0.000000, 0.000000),
    		rot = vec3(0.000000, 0.000000, 0.000000)
		},
		propTwo = { model = 'djs_fork',
		bone = 58868,
    	pos = vec3(0.000000, -0.014000, 0.030000),
    	rot = vec3(6.608002, 0.000000, 94.989883)
		},
		usetime = 17500,
		cancel = true,
		notification = 'You have satistfied your hunger'
		},
	},
	['djs_box_steaknshrimp'] = {
		label = 'Steak n Shrimp',
		weight = 1,
		stack = true,
		close = true,
		client = {
			status = { hunger = 2000000 },
			anim = { dict = 'anim@djs@food@plated', clip = 'djs_food_plate_bite_loop' },        
			prop = {model = 'djs_box_rastapasta',
    		bone = 18905,
    		pos = vec3(0.140000, 0.000000, 0.000000),
    		rot = vec3(0.000000, 0.000000, 0.000000)
		},
		propTwo = { model = 'djs_fork',
		bone = 58868,
    	pos = vec3(0.000000, -0.014000, 0.030000),
    	rot = vec3(6.608002, 0.000000, 94.989883)
		},
		usetime = 17500,
		cancel = true,
		notification = 'You have satistfied your hunger'
		},
	},
	['djs_plate_jerkchicken'] = {
		label = 'Jerk Chicken',
		weight = 1,
		stack = true,
		close = true,
		client = {
			status = { hunger = 2000000 },
			anim = { dict = 'anim@djs@food@plated', clip = 'djs_food_plate_bite_loop' },        
			prop = {model = 'djs_plate_jerkchicken',
    		bone = 18905,
    		pos = vec3(0.140000, 0.000000, 0.000000),
    		rot = vec3(0.000000, 0.000000, 0.000000)
		},
		propTwo = { model = 'djs_fork',
		bone = 58868,
    	pos = vec3(0.000000, -0.014000, 0.030000),
    	rot = vec3(6.608002, 0.000000, 94.989883)
		},
		usetime = 17500,
		cancel = true,
		notification = 'You have satistfied your hunger'
		},
	},
	['djs_plate_oxtail'] = {
		label = 'Oxtail',
		weight = 1,
		stack = true,
		close = true,
		client = {
			status = { hunger = 2000000 },
			anim = { dict = 'anim@djs@food@plated', clip = 'djs_food_plate_bite_loop' },        
			prop = {model = 'djs_plate_oxtail',
    		bone = 18905,
    		pos = vec3(0.140000, 0.000000, 0.000000),
    		rot = vec3(0.000000, 0.000000, 0.000000)
		},
		propTwo = { model = 'djs_fork',
		bone = 58868,
    	pos = vec3(0.000000, -0.014000, 0.030000),
    	rot = vec3(6.608002, 0.000000, 94.989883)
		},
		usetime = 17500,
		cancel = true,
		notification = 'You have satistfied your hunger'
		},
	},
	["djs_prop_coconutdrink"] = { --checked              
		label = "Coconut Mix",
		stack = true,
		close = true,                   
		weight = 2,
		client = {
			status = { hunger = 2000000 },
			anim = { dict = 'anim@djs@drink@soda', clip = 'djs_drink_soda_sip_long' },
			prop = {model = 'djs_prop_coconutdrink',
			bone = 57005,
			pos = vec3(0.130000, -0.010000, -0.060000),
			rot = vec3(-75.000000, -47.000000, -1.000000)
		},
		usetime = 17500,
		cancel = true,
		notification = 'You have satisfied your hunger'
		},
	},
	["djs_prop_pineapple"] = { --checked              
		label = "Pineapple Mix",
		stack = true,
		close = true,                   
		weight = 2,
		client = {
			status = { hunger = 2000000 },
			anim = { dict = 'anim@djs@drink@soda', clip = 'djs_drink_soda_sip_long' },
			prop = {model = 'djs_prop_pineapple',
			bone = 57005,
			pos = vec3(0.130000, -0.010000, -0.060000),
			rot = vec3(-75.000000, -47.000000, -1.000000)
		},
		usetime = 17500,
		cancel = true,
		notification = 'You have satisfied your hunger'
		},
	},

		['djs_berryflower_martini'] = { -- requirement https://docs.djscollections.com/paid-props-products/food-and-drink-animations
		label = 'Berry Flower Martini',
		weight = 350,
		stack = true,
        close = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'anim@djs@drink@margarita', clip = 'djs_drink_margarita_sip_loop' },
			prop = { model = `djs_berryflower_martini`, pos = vec3(0.080000, -0.060000, -0.040000), rot = vec3(-79.800003, 0.000000, -10.500000), bone = 57005, },
			usetime = 2500,
            cancel = true,
		}
	},
	['djs_blackberry_martini'] = { -- requirement https://docs.djscollections.com/paid-props-products/food-and-drink-animations
		label = 'Black Berry Martini',
		weight = 350,
		stack = true,
        close = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'anim@djs@drink@margarita', clip = 'djs_drink_margarita_sip_loop' },
			prop = { model = `djs_blackberry_martini`, pos = vec3(0.080000, -0.060000, -0.040000), rot = vec3(-79.800003, 0.000000, -10.500000), bone = 57005, },
			usetime = 2500,
            cancel = true,
		}
	},
	['djs_bloodorange_margarita'] = { -- requirement https://docs.djscollections.com/paid-props-products/food-and-drink-animations
		label = 'Blood Orange Margarita',
		weight = 350,
		stack = true,
        close = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'anim@djs@drink@margarita', clip = 'djs_drink_margarita_sip_loop' },
			prop = { model = `djs_bloodorange_margarita`, pos = vec3(0.080000, -0.060000, -0.040000), rot = vec3(-79.800003, 0.000000, -10.500000), bone = 57005, },
			usetime = 2500,
            cancel = true,
		}
	},
	['djs_carambolaandmint_margarita'] = { -- requirement https://docs.djscollections.com/paid-props-products/food-and-drink-animations
		label = 'Carambo and Mint Margarita',
		weight = 350,
		stack = true,
        close = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'anim@djs@drink@margarita', clip = 'djs_drink_margarita_sip_loop' },
			prop = { model = `djs_carambolaandmint_margarita`, pos = vec3(0.080000, -0.060000, -0.040000), rot = vec3(-79.800003, 0.000000, -10.500000), bone = 57005, },
			usetime = 2500,
            cancel = true,
		}
	},
	['djs_cherryhibiscus_margarita'] = { -- requirement https://docs.djscollections.com/paid-props-products/food-and-drink-animations
		label = 'Cherry Hibiscus Margarita',
		weight = 350,
		stack = true,
        close = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'anim@djs@drink@margarita', clip = 'djs_drink_margarita_sip_loop' },
			prop = { model = `djs_cherryhibiscus_margarita`, pos = vec3(0.080000, -0.060000, -0.040000), rot = vec3(-79.800003, 0.000000, -10.500000), bone = 57005, },
			usetime = 2500,
            cancel = true,
		}
	},
	['djs_cherrypineapple_margarita'] = { -- requirement https://docs.djscollections.com/paid-props-products/food-and-drink-animations
		label = 'Cherry Pineapple Margarita',
		weight = 350,
		stack = true,
        close = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'anim@djs@drink@margarita', clip = 'djs_drink_margarita_sip_loop' },
			prop = { model = `djs_cherrypineapple_margarita`, pos = vec3(0.080000, -0.060000, -0.040000), rot = vec3(-79.800003, 0.000000, -10.500000), bone = 57005, },
			usetime = 2500,
            cancel = true,
		}
	},
	['djs_ginandtonic'] = { -- requirement https://docs.djscollections.com/paid-props-products/food-and-drink-animations
		label = 'Ocean Water Gin and Tonic',
		weight = 350,
		stack = true,
        close = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'anim@djs@drink@margarita', clip = 'djs_drink_margarita_sip_loop' },
			prop = { model = `djs_ginandtonic`, pos = vec3(0.080000, -0.060000, -0.040000), rot = vec3(-79.800003, 0.000000, -10.500000), bone = 57005, },
			usetime = 2500,
            cancel = true,
		}
	},
	['djs_grapefruit_martini'] = { -- requirement https://docs.djscollections.com/paid-props-products/food-and-drink-animations
		label = 'Grape Fruit Martini',
		weight = 350,
		stack = true,
        close = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'anim@djs@drink@margarita', clip = 'djs_drink_margarita_sip_loop' },
			prop = { model = `djs_grapefruit_martini`, pos = vec3(0.080000, -0.060000, -0.040000), rot = vec3(-79.800003, 0.000000, -10.500000), bone = 57005, },
			usetime = 2500,
            cancel = true,
		}
	},
	['djs_prop_blueberrypie_jelloshot'] = { -- requirement https://docs.djscollections.com/paid-props-products/food-and-drink-animations
		label = 'Blueberry Pie Jello Shot',
		weight = 350,
		stack = true,
        close = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'anim@djs@drink@shot', clip = 'djs_drink_shot_quick' },
			prop = { model = `djs_prop_blueberrypie_jelloshot`, pos = vec3(0.110000, 0.020000, -0.071000), rot = vec3(-75.000000, 0.000000, -9.000000), bone = 57005, },
			usetime = 600,
            cancel = true,
		}
	},
	['djs_prop_cherrylimepie_jelloshot'] = { -- requirement https://docs.djscollections.com/paid-props-products/food-and-drink-animations
		label = 'Cherry Lime Pie Jello Shot',
		weight = 350,
		stack = true,
        close = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'anim@djs@drink@shot', clip = 'djs_drink_shot_quick' },
			prop = { model = `djs_prop_cherrypie_jelloshot`, pos = vec3(0.110000, 0.020000, -0.071000), rot = vec3(-75.000000, 0.000000, -9.000000), bone = 57005, },
			usetime = 600,
            cancel = true,
		}
	},
	['djs_prop_cherrypie_jelloshot'] = { -- requirement https://docs.djscollections.com/paid-props-products/food-and-drink-animations
		label = 'Cherry Pie Jello Shot',
		weight = 350,
		stack = true,
        close = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'anim@djs@drink@shot', clip = 'djs_drink_shot_quick' },
			prop = { model = `djs_prop_cherrypie_jelloshot`, pos = vec3(0.110000, 0.020000, -0.071000), rot = vec3(-75.000000, 0.000000, -9.000000), bone = 57005, },
			usetime = 600,
            cancel = true,
		}
	},
	['djs_prop_keylimepie_jelloshot'] = { -- requirement https://docs.djscollections.com/paid-props-products/food-and-drink-animations
		label = 'Keylime Pie Jello Shot',
		weight = 350,
		stack = true,
        close = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'anim@djs@drink@shot', clip = 'djs_drink_shot_quick' },
			prop = { model = `djs_prop_keylimepie_jelloshot`, pos = vec3(0.110000, 0.020000, -0.071000), rot = vec3(-75.000000, 0.000000, -9.000000), bone = 57005, },
			usetime = 600,
            cancel = true,
		}
	},
	['djs_prop_orangecream_jelloshot'] = { -- requirement https://docs.djscollections.com/paid-props-products/food-and-drink-animations
		label = 'Orange Cream Jello Shot',
		weight = 350,
		stack = true,
        close = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'anim@djs@drink@shot', clip = 'djs_drink_shot_quick' },
			prop = { model = `djs_prop_orangecream_jelloshot`, pos = vec3(0.110000, 0.020000, -0.071000), rot = vec3(-75.000000, 0.000000, -9.000000), bone = 57005, },
			usetime = 600,
            cancel = true,
		}
	},
	['djs_prop_pineappleshortcake_jelloshot'] = { -- requirement https://docs.djscollections.com/paid-props-products/food-and-drink-animations
		label = 'Pineapple Shortcake Jello Shot',
		weight = 350,
		stack = true,
        close = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'anim@djs@drink@shot', clip = 'djs_drink_shot_quick' },
			prop = { model = `djs_prop_pineappleshortcake_jelloshot`, pos = vec3(0.110000, 0.020000, -0.071000), rot = vec3(-75.000000, 0.000000, -9.000000), bone = 57005, },
			usetime = 600,
            cancel = true,
		}
	},
	['djs_raspberry_martini'] = { -- requirement https://docs.djscollections.com/paid-props-products/food-and-drink-animations
		label = 'Raspberry Martini',
		weight = 350,
		stack = true,
        close = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'anim@djs@drink@margarita', clip = 'djs_drink_margarita_sip_loop' },
			prop = { model = `djs_raspberry_martini`, pos = vec3(0.080000, -0.060000, -0.040000), rot = vec3(-79.800003, 0.000000, -10.500000), bone = 57005, },
			usetime = 2500,
            cancel = true,
		}
	},
	['djs_strawberry_margarita'] = { -- requirement https://docs.djscollections.com/paid-props-products/food-and-drink-animations
		label = 'Strawberry Margarita',
		weight = 350,
		stack = true,
        close = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'anim@djs@drink@margarita', clip = 'djs_drink_margarita_sip_loop' },
			prop = { model = `djs_strawberry_margarita`, pos = vec3(0.080000, -0.060000, -0.040000), rot = vec3(-79.800003, 0.000000, -10.500000), bone = 57005, },
			usetime = 2500,
            cancel = true,
		}
	},
	["djs_empanadas"] = { -- requirement https://docs.djscollections.com/paid-props-products/food-and-drink-animations
        label = "VU Tacos",
        weight = 200,
        stack = true,
        close = true,
        client = {
            anim = { dict = 'anim@djs@food@plated', clip = 'djs_food_plate_bite_loop' },
            prop = { model = 'djs_empanadas', pos = vector3(0.1, 0.0, 0.02), rot = vector3(-16.0, 0.0, 0.0), bone = 18905, },
            propTwo = { model = 'djs_prop_empanadas', pos = vector3(0.11, 0.04, -0.03), rot = vector3(-33.0, 0.0, 0.0), bone = 57005, },
			usetime = 17500,
            cancel = true,
        }
    },
	["djs_vutacos"] = { -- requirement https://docs.djscollections.com/paid-props-products/food-and-drink-animations
        label = "VU Tacos",
        weight = 200,
        stack = true,
        close = true,
        client = {
            anim = { dict = 'anim@djs@food@plated', clip = 'djs_food_plate_bite_loop' },
            prop = { model = 'djs_vutacos', pos = vector3(0.1, 0.0, 0.02), rot = vector3(-16.0, 0.0, 0.0), bone = 18905, },
            propTwo = { model = 'djs_prop_vutacos', pos = vector3(0.11, 0.04, -0.03), rot = vector3(-33.0, 0.0, 0.0), bone = 57005, },
			usetime = 17500,
            cancel = true,
        }
    },
	["djs_vuburritos"] = { -- requirement https://docs.djscollections.com/paid-props-products/food-and-drink-animations
        label = "VU Burritos",
        weight = 200,
        stack = true,
        close = true,
        client = {
            anim = { dict = 'anim@djs@food@plated', clip = 'djs_food_plate_bite_loop' },
            prop = { model = 'djs_vuburritos', pos = vector3(0.1, 0.0, 0.02), rot = vector3(-16.0, 0.0, 0.0), bone = 18905, },
            propTwo = { model = 'djs_prop_vuburritos', pos = vector3(0.11, 0.04, -0.03), rot = vector3(-33.0, 0.0, 0.0), bone = 57005, },
			usetime = 17500,
            cancel = true,
        }
    },


	["2backpack1"] = {
		label = "Tier 2 Backpack1",
		weight = 15000,
		stack = false,
		close = true,
		description = "Backpack",
		client = {
			image = "2backpack1.png",
		}
	},

	["1backpack1"] = {
		label = "Tier 1 Backpack1",
		weight = 15000,
		stack = false,
		close = true,
		description = "Backpack",
		client = {
			image = "1backpack1.png",
		}
	},

	["phone"] = {
		label = "Phone",
		weight = 700,
		stack = false,
		close = false,
		description = "Neat phone ya got there",
		client = {
			image = "phone.png",
		}
	},

	['uvlight'] = {
		label = 'UV Light',
		weight = 95,
		stack = false
	},
	['bleachwipes'] = {
		label = 'Bleach Wipes',
		weight = 185,
		stack = true
	},

	['ballistic_shield'] = {
    label = 'Ballistic Shield',
    weight = 250,
    consume = 0,
    allowArmed = true,
    server = {
        export = 'gs_policeshield.ballistic_shield',
    }
	},

	['riot_shield'] = {
    label = 'Riot Shield',
    weight = 250,
    consume = 0,
    allowArmed = true,
    server = {
        export = 'gs_policeshield.riot_shield',
    }
	},


	["casino_vip"] = {
		label = "V.I.P Membership",
		weight = 500,
		stack = false,
		close = false,
		description = "Diamond Casino V.I.P Card",
		client = {
			image = "casino_vip.png",
		}
	},

	["casino_goldchip"] = {
		label = "Casino Chip",
		weight = 0,
		stack = true,
		close = false,
		description = "Diamond Casino Chip",
		client = {
			image = "casino_goldchip.png",
		}
	},

	["casino_member"] = {
		label = "Casino Membership",
		weight = 500,
		stack = false,
		close = false,
		description = "Diamond Casino Member Card",
		client = {
			image = "casino_member.png",
		}
	},
	["casino_gumball"] = {
		label = "Gumball",
		weight = 100,
		stack = false,
		close = true,
		description = "A shiny gumball",
		client = {
			image = "casino_gumball.png",
		}
	},

['nailtable'] = {
    label = 'Nail Table',
    weight = 0,
    stack = true
},

['acrylic-liquid'] = {
    label = 'Acrylic Liquid',
    weight = 0,
    stack = true
},

['acrylic-powder'] = {
    label = 'Acrylic Powder',
    weight = 0,
    stack = true
},

['acrylic-nails'] = {
    label = 'Acrylic Nails',
    weight = 0,
    stack = true
},

['nailphone'] = {
    label = 'Nail Client Phone',
    weight = 0,
    stack = true
},

['cfn-nails'] = {
    label = 'Set Of Coffin Nails',
    weight = 0,
    stack = true
},

['sti-nails'] = {
    label = 'Set Of Stiletto Nails',
    weight = 0,
    stack = true
},

['alm-nails'] = {
    label = 'Set Of Almond Nails',
    weight = 0,
    stack = true
},

['lip-nails'] = {
    label = 'Set Of Lipstick Nails',
    weight = 0,
    stack = true
},

['bal-nails'] = {
    label = 'Set Of Ballerina Nails',
    weight = 0,
    stack = true
},

['squ-nails'] = {
    label = 'Set Of Square Nails',
    weight = 0,
    stack = true
},

['fla-nails'] = {
    label = 'Set Of Flare Nails',
    weight = 0,
    stack = true
},


	["cuff"] = {
		label = "Cuff",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "cuff.png",
		}
	},

	["blindfold"] = {
		label = "Blindfold",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "blindfold.png",
		}
	},

	["rope"] = {
		label = "Rope",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "rope.png",
		}
	},

	["key"] = {
		label = "Armbrace",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "key.png",
		}
	},

	["casino_chips"] = {
		label = "Casino Chips",
		weight = 0,
		stack = true,
		close = false,
		description = "Casino Chips",
		client = {
			image = "casino_chips.png",
		}
	},

	["casino_sprite"] = {
		label = "Casino Sprite",
		weight = 0,
		stack = false,
		close = false,
		description = "Casino Sprite",
		client = {
			image = "casino_sprite.png",
		}
	},

	["casino_coffee"] = {
		label = "Casino Coffee",
		weight = 0,
		stack = false,
		close = false,
		description = "Casino Coffee",
		client = {
			image = "casino_coffee.png",
		}
	},

	["casino_beer"] = {
		label = "Casino Beer",
		weight = 0,
		stack = false,
		close = false,
		description = "Casino Beer",
		client = {
			image = "casino_beer.png",
		}
	},

	["casino_psqs"] = {
		label = "Casino Ps & Qs",
		weight = 0,
		stack = false,
		close = false,
		description = "Casino Ps & Qs",
		client = {
			image = "casino_psqs.png",
		}
	},

	["casino_donut"] = {
		label = "Casino Donut",
		weight = 0,
		stack = false,
		close = false,
		description = "Casino Donut",
		client = {
			image = "casino_donut.png",
		}
	},

	["casino_luckypotion"] = {
		label = "Casino Lucky Potion",
		weight = 0,
		stack = false,
		close = false,
		description = "Casino Lucky Potion",
		client = {
			image = "casino_luckypotion.png",
		}
	},

	["casino_burger"] = {
		label = "Casino Burger",
		weight = 0,
		stack = false,
		close = false,
		description = "Casino Burger",
		client = {
			image = "casino_burger.png",
		}
	},

	["casino_ego_chaser"] = {
		label = "Casino Ego Chaser",
		weight = 0,
		stack = false,
		close = false,
		description = "Casino Ego Chaser",
		client = {
			image = "casino_ego_chaser.png",
		}
	},

	["casino_coke"] = {
		label = "Casino Kofola",
		weight = 0,
		stack = false,
		close = false,
		description = "Casino Kofola",
		client = {
			image = "casino_coke.png",
		}
	},

	["casino_sandwitch"] = {
		label = "Casino Sandwitch",
		weight = 0,
		stack = false,
		close = false,
		description = "Casino Sandwitch",
		client = {
			image = "casino_sandwitch.png",
		}
	},

	  ["bbq_grill"] = {  
        label = "BBQ Grill",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["gazebo"] = {  
        label = "Gazebo",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["soda_machine"] = {  
        label = "Soda Machine",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["table"] = {  
        label = "Table",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["flood_light"] = {  
        label = "Flood Light",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["chair"] = {  
        label = "Chair",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["raw_ribs"] = {  
        label = "Raw Ribs",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["raw_beef_brisket"] = {  
        label = "Raw Beef Brisket",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["pork_joint"] = {  
        label = "Pork Joint",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["raw_sausages"] = {  
        label = "Raw Sausages",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["raw_short_ribs"] = {  
        label = "Raw Short Ribs",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["lamb_chops"] = {  
        label = "Lamb Chops",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["ribeye_steak"] = {  
        label = "Ribeye Steak",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["chicken_thigh"] = {  
        label = "Chicken Thigh",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["raw_turkey_drums"] = {  
        label = "Raw Turkey Drumsticks",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["corn_cob"] = {  
        label = "Corn on the Cob",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["raw_kebab"] = {  
        label = "Raw Kebab",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["bbq_seasoning"] = {  
        label = "BBQ Seasoning",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["raw_wings"] = {  
        label = "Raw Wings",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["cooked_ribs"] = {  
        label = "Cooked Ribs",  
        weight = 15,  
        client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate delicious food'
		},  
    },
    ["cooked_brisket"] = {  
        label = "Cooked Brisket",  
        weight = 15,  
        client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate delicious food'
		},  
    },
    ["cooked_pork_joint"] = {  
        label = "Cooked Pork Joint",  
        weight = 15,  
        client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate delicious food'
		},
    },
    ["cooked_bbq_sausages"] = {  
        label = "Cooked BBQ Sausages",  
        weight = 15,  
        client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate delicious food'
		}, 
    },
    ["cooked_short_ribs"] = {  
        label = "Cooked Short Ribs",  
        weight = 15,  
        client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate delicious food'
		}, 
    },
    ["cooked_lamb_chops"] = {  
        label = "Cooked Lamb Chops",  
        weight = 15,  
        client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate delicious food'
		}, 
    },
    ["cooked_bbq_ribeye"] = {  
        label = "Cooked BBQ Ribeye",  
        weight = 15,  
        client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate delicious food'
		},
    },
    ["cooked_bbq_thigh"] = {  
        label = "Cooked BBQ Chicken Thigh",  
        weight = 15,  
        client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate delicious food'
		},
    },
    ["cooked_turkey_drum"] = {  
        label = "Cooked Turkey Drumstick",  
        weight = 15,  
        client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate delicious food'
		}, 
    },
    ["cooked_corn_cob"] = {  
        label = "Cooked Corn on the Cob",  
        weight = 15,  
       client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate delicious food'
		}, 
    },
    ["cooked_kebab"] = {  
        label = "Cooked Kebab",  
        weight = 15,  
        client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate delicious food'
		}, 
    },
    ["cooked_bbq_wings"] = {  
        label = "Cooked BBQ Wings",  
        weight = 15,  
        client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate delicious food'
		},
    },

    -- drinks

        ["cup_cola"] = {   
        label = "Cup of Cola",   
        weight = 1,  
        client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with a sprunk'
		}
    },
    ["cup_lemonade"] = {   
        label = "Cup of Lemonade",   
        weight = 1,  
        client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with a sprunk'
		}
    },
    ["cup_tide"] = {   
        label = "Cup of Tide",   
        weight = 1,  
        client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with a sprunk'
		}  
    },
    ["empty_cup"] = {   
        label = "Empty Cup",   
        weight = 0.5,  
        stack = true,  
        close = true  
    },
    ["big_bottle_cola"] = {   
        label = "Big Bottle of Cola",   
        weight = 3,  
        stack = true,  
        close = true  
    },
    ["big_bottle_lemonade"] = {   
        label = "Big Bottle of Lemonade",   
        weight = 3,  
        stack = true,  
        close = true  
    },
    ["big_bottle_tide"] = {   
        label = "Big Bottle of Tide",   
        weight = 3,  
        stack = true,  
        close = true  
    },



	["weed_cookies"] = {
		label = "Cookies Nug",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "weed_cookies.png",
		}
	},

	["bbcake"] = {
		label = "Best Buds Cake",
		weight = 10,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "bbcake.png",
		}
	},

	["bbbrownie"] = {
		label = "Best Buds Brownie",
		weight = 10,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "bbbrownie.png",
		}
	},

	["bbgummie"] = {
		label = "Best Buds Gummie",
		weight = 10,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "bbgummie.png",
		}
	},

	['wheel_clamp'] = {
        label = 'Wheel Clamp',
        weight = 0,
    },


	-- JIM-BAHAMAMAMAS --
    cubasil = { label = "Cucumber Basil", weight = 200, stack = true, close = false, description = "Hand full of Cucumber and Basil",
        client = { image = "cubasil.png", event = "jim-bahamamamas:client:Consume", }
    },
    mintleaf = { label = "Mint", weight = 200, stack = true, close = false, description = "Fresh mint leaves",
        client = { image = "mint.png", event = "jim-bahamamamas:client:Consume", }
    },
    peach = { label = "Peach", weight = 200, stack = true, close = true, description = "A juicy peach",
        client = { image = "peach.png", event = "jim-bahamamamas:client:Consume", }
    },
    strawberry = { label = "Strawberries", weight = 200, stack = true, close = true, description = "Fresh strawberries",
        client = { image = "strawberry.png", event = "jim-bahamamamas:client:Consume", }
    },
    orange = { label = "Orange", weight = 200, stack = true, close = true, description = "A ripe orange",
        client = { image = "orange.png", event = "jim-bahamamamas:client:Consume", }
    },
    lime = { label = "Lime", weight = 200, stack = true, close = true, description = "A fresh lime",
        client = { image = "lime.png", event = "jim-bahamamamas:client:Consume", }
    },
    lemon = { label = "Lemon", weight = 200, stack = true, close = true, description = "A tangy lemon",
        client = { image = "lemon.png", event = "jim-bahamamamas:client:Consume", }
    },
    chocolate = { label = "Chocolate", weight = 200, stack = true, close = true, description = "A sweet chocolate bar",
        client = { image = "chocolate.png", event = "jim-bahamamamas:client:Consume", }
    },

    -- Juices & Mixers
    cranberry = { label = "Cranberry Juice", weight = 200, stack = true, close = true, description = "Tart cranberry juice",
        client = { image = "cranberry.png", event = "jim-bahamamamas:client:Consume", }
    },
    pinejuice = { label = "Pineapple Juice", weight = 200, stack = true, close = true, description = "Juicy pineapple goodness",
        client = { image = "pinejuice.png", event = "jim-bahamamamas:client:Consume", }
    },

    -- Liqueurs & Alcohol
    gin = { label = "Gin", weight = 200, stack = true, close = true, description = "A bottle of gin",
        client = { image = "gin.png", event = "jim-bahamamamas:client:Consume", }
    },
    rum = { label = "Rum", weight = 200, stack = true, close = true, description = "Dark or white rum",
        client = { image = "rum.png", event = "jim-bahamamamas:client:Consume", }
    },
    tequila = { label = "Tequila", weight = 200, stack = true, close = true, description = "A shot of tequila",
        client = { image = "tequila.png", event = "jim-bahamamamas:client:Consume", }
    },
    triplsec = { label = "Triple Sec", weight = 200, stack = true, close = true, description = "Citrusy liqueur",
        client = { image = "triplesec.png", event = "jim-bahamamamas:client:Consume", }
    },
    midori = { label = "Midori", weight = 200, stack = true, close = true, description = "Melon liqueur",
        client = { image = "midori.png", event = "jim-bahamamamas:client:Consume", }
    },
    prosecco = { label = "Prosecco", weight = 200, stack = true, close = true, description = "Sparkling prosecco",
        client = { image = "prosecco.png", event = "jim-bahamamamas:client:Consume", }
    },
    amaretto = { label = "Amaretto", weight = 200, stack = true, close = true, description = "Sweet almond liqueur",
        client = { image = "amaretto.png", event = "jim-bahamamamas:client:Consume", }
    },

    -- Cocktails
    amarettosour = { label = "Amaretto Sour", weight = 200, stack = true, close = true, description = "Sweet and sour cocktail",
        client = { image = "amarettosour.png", event = "jim-bahamamamas:client:Consume", }
    },
    bellini = { label = "Bellini", weight = 200, stack = true, close = true, description = "Peach & prosecco",
        client = { image = "bellini.png", event = "jim-bahamamamas:client:Consume", }
    },
    cosmopolitan = { label = "Cosmopolitan", weight = 200, stack = true, close = true, description = "Cranberry & vodka blend",
        client = { image = "cosmopolitan.png", event = "jim-bahamamamas:client:Consume", }
    },
    longisland = { label = "Long Island Ice tea", weight = 200, stack = true, close = true, description = "Strong cocktail mix",
        client = { image = "longisland.png", event = "jim-bahamamamas:client:Consume", }
    },
    margarita = { label = "Margarita", weight = 200, stack = true, close = true, description = "Classic lime margarita",
        client = { image = "margarita.png", event = "jim-bahamamamas:client:Consume", }
    },
    pinacolada = { label = "Pina Colada", weight = 200, stack = true, close = true, description = "Pineapple coconut delight",
        client = { image = "pinacolada.png", event = "jim-bahamamamas:client:Consume", }
    },
    sangria = { label = "Sangria", weight = 200, stack = true, close = true, description = "Fruity wine punch",
        client = { image = "sangria.png", event = "jim-bahamamamas:client:Consume", }
    },
    screwdriver = { label = "Screwdriver", weight = 200, stack = true, close = true, description = "Vodka and orange juice",
        client = { image = "screwdriver.png", event = "jim-bahamamamas:client:Consume", }
    },
    strawdaquiri = { label = "Strawberry Daquiri", weight = 200, stack = true, close = true, description = "Frozen strawberry cocktail",
        client = { image = "strawdaquiri.png", event = "jim-bahamamamas:client:Consume", }
    },
    strawmargarita = { label = "Strawberry Margarita", weight = 200, stack = true, close = true, description = "Strawberry twist on a margarita",
        client = { image = "strawmargarita.png", event = "jim-bahamamamas:client:Consume", }
    },

    -- Beers
    ambeer = { label = "AM Beer", weight = 100, stack = true, close = true, description = "A light beer",
        client = { image = "ambeer.png", event = "jim-bahamamamas:client:Consume", }
    },
    dusche = { label = "Dusche Gold", weight = 100, stack = true, close = true, description = "Premium lager",
        client = { image = "dusche.png", event = "jim-bahamamamas:client:Consume", }
    },
    logger = { label = "Logger Beer", weight = 100, stack = true, close = true, description = "Full-bodied beer",
        client = { image = "logger.png", event = "jim-bahamamamas:client:Consume", }
    },
    pisswasser = { label = "Pißwasser", weight = 100, stack = true, close = true, description = "Cheap lager",
        client = { image = "pisswaser1.png", event = "jim-bahamamamas:client:Consume", }
    },
    pisswasser2 = { label = "Pißwasser Stout", weight = 100, stack = true, close = true, description = "Dark and rich",
        client = { image = "pisswaser2.png", event = "jim-bahamamamas:client:Consume", }
    },
    pisswasser3 = { label = "Pißwasser Pale Ale", weight = 100, stack = true, close = true, description = "Crisp pale ale",
        client = { image = "pisswaser3.png", event = "jim-bahamamamas:client:Consume", }
    },

    -- Soft Drinks
    -- sprunk = { label = "Sprunk", weight = 100, stack = true, close = true, description = "Fizzy green soda",
    --     client = { image = "sprunk.png", event = "jim-bahamamamas:client:Consume", }
    -- },
    sprunklight = { label = "Sprunk Light", weight = 100, stack = true, close = true, description = "Diet version of Sprunk",
        client = { image = "sprunklight.png", event = "jim-bahamamamas:client:Consume", }
    },
    ecola = { label = "eCola", weight = 100, stack = true, close = true, description = "Cola beverage",
        client = { image = "ecola.png", event = "jim-bahamamamas:client:Consume", }
    },
    ecolalight = { label = "eCola Light", weight = 100, stack = true, close = true, description = "Light cola beverage",
        client = { image = "ecolalight.png", event = "jim-bahamamamas:client:Consume", }
    },

    -- Glass Soft Drinks
    sprunk_glass = { label = "Glass of Sprunk", weight = 100, stack = true, close = true, description = "Fizzy green soda",
        client = { image = "sprunk_glass.png", event = "jim-bahamamamas:client:Consume", }
    },
    sprunklight_glass = { label = "Glass of Sprunk Light", weight = 100, stack = true, close = true, description = "Diet version of Sprunk",
        client = { image = "sprunklight_glass.png", event = "jim-bahamamamas:client:Consume", }
    },
    ecola_glass = { label = "Glass of eCola", weight = 100, stack = true, close = true, description = "Cola beverage",
        client = { image = "ecola_glass.png", event = "jim-bahamamamas:client:Consume", }
    },
    ecolalight_glass = { label = "Glass of eCola Light", weight = 100, stack = true, close = true, description = "Light cola beverage",
        client = { image = "ecolalight_glass.png", event = "jim-bahamamamas:client:Consume", }
    },
    raine_glass = { label = "Glass of Raine", weight = 100, stack = true, close = true, description = "Refreshing Raine beverage",
        client = { image = "raine_glass.png", event = "jim-bahamamamas:client:Consume", }
    },
    junkdrink_glass = { label = "Glass of Junk", weight = 100, stack = true, close = true, description = "The Quick Fix",
        client = { image = "junkdrink_glass.png", event = "jim-bahamamamas:client:Consume", }
    },
    orangotang_glass = { label = "Glass of Orang-o-tang", weight = 100, stack = true, close = true, description = "Me Pongo, Pongo Thirsty",
        client = { image = "orangotang_glass.png", event = "jim-bahamamamas:client:Consume", }
    },

    -- Snacks & Sides
    crisps = { label = "Crisps", weight = 100, stack = true, close = true, description = "A bag of crisps",
        client = { image = "chips.png", event = "jim-bahamamamas:client:Consume", }
    },
    tots = { label = "Tits or Tots", weight = 200, stack = true, close = true, description = "Cheeky golden tots",
        client = { image = "tots.png", event = "jim-bahamamamas:client:Consume", }
    },

    -- Plates & Meals
    nplate = { label = "Nachos Plate", weight = 200, stack = true, close = true, description = "A plate of nachos and cheese",
        client = { image = "nplate.png", event = "jim-bahamamamas:client:Consume", }
    },
    vusliders = { label = "Sliders", weight = 200, stack = true, close = true, description = "Mini burger sliders",
        client = { image = "sliders.png", event = "jim-bahamamamas:client:Consume", }
    },
    vutacos = { label = "Tacos", weight = 200, stack = true, close = true, description = "Delicious tacos",
        client = { image = "tacos.png", event = "jim-bahamamamas:client:Consume", }
    },
    nachos = { label = "Nachos", weight = 200, stack = true, close = true, description = "Crunchy nacho chips",
        client = { image = "nachos.png", event = "jim-bahamamamas:client:Consume", }
    },

    -- Raw Ingredients
    meat = { label = "Meat", weight = 200, stack = true, close = true, description = "A slab of meat",
        client = { image = "meat.png", event = "jim-bahamamamas:client:Consume", }
    },
    lettuce = { label = "Lettuce", weight = 100, stack = true, close = false, description = "Fresh green lettuce",
        client = { image = "lettuce.png", event = "jim-bahamamamas:client:Consume", }
    },
    cheddar = { label = "Cheddar Slice", weight = 500, stack = true, close = false, description = "Slice of cheddar cheese",
        client = { image = "cheddar.png", event = "jim-bahamamamas:client:Consume", }
    },
    potato = { label = "Potatoes", weight = 500, stack = true, close = false, description = "Raw potatoes",
        client = { image = "potatoes.png", event = "jim-bahamamamas:client:Consume", }
    },

    -- -- QBCore Item Wrapper
    -- vodka = { label = "Vodka", eight = 500, stack = true, close = true, description = "For all the thirsty out there",
    --     client = { image = "vodka.png", }
    -- },



	["adrenalinepen"] = {
		label = "Adrenaline Pen",
		weight = 100,
		stack = true,
		close = true,
		description = "Boost",
		client = {
			image = "adrenalinepen.png",
		}
	},

	["weed_joint"] = {
		label = "Weed Joint",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "weed_joint.png",
		}
	},

	["adderall"] = {
		label = "Adderall",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "adderall.png",
		}
	},

	["angeldust"] = {
		label = "Angel Dust",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "angeldust.png",
		}
	},

	["ergot"] = {
		label = "Ergot",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "ergot.png",
		}
	},

	["jolly_candy"] = {
		label = "Jolly Candy",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "jolly_candy.png",
		}
	},

	["lofexidine"] = {
		label = "Lofexidine",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "lofexidine.png",
		}
	},

	["opium_joint"] = {
		label = "Opium Joint",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "opium_joint.png",
		}
	},

	["antidote"] = {
		label = "Antidote",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "antidote.png",
		}
	},

	["molly"] = {
		label = "Molly",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "molly.png",
		}
	},

	["molly_pouch"] = {
		label = "Molly Pouch",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "molly_pouch.png",
		}
	},

	["speedball"] = {
		label = "Speed Ball",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "speedball.png",
		}
	},

	["spice_leaf"] = {
		label = "Spice Leaf",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "spice_leaf.png",
		}
	},

	["syriange"] = {
		label = "Syriange",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "syriange.png",
		}
	},

	["flakka"] = {
		label = "Flakka",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "flakka.png",
		}
	},

	["shroom"] = {
		label = "Shroom",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "shroom.png",
		}
	},

	["shroom_pouch"] = {
		label = "Shroom Pouch",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "shroom_pouch.png",
		}
	},

	["xpills"] = {
		label = "X-Pills",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "xpills.png",
		}
	},

	["blacktar"] = {
		label = "Black Tar Heroin",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "blacktar.png",
		}
	},

	["poppy_tears"] = {
		label = "Poppy Tears",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "poppy_tears.png",
		}
	},

	["acid_paper"] = {
		label = "Acid Paper",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "acid_paper.png",
		}
	},

	["acamprosate"] = {
		label = "Acamprosate",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "acamprosate.png",
		}
	},

	["xpill"] = {
		label = "X-Pill",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "xpill.png",
		}
	},

	["opium"] = {
		label = "Opium",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "opium.png",
		}
	},

	["bathsalts"] = {
		label = "Bath Salts",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "bathsalts.png",
		}
	},

	["opium_pouch"] = {
		label = "Opium Pouch",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "opium_pouch.png",
		}
	},

	["heroin"] = {
		label = "Heroin",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "heroin.png",
		}
	},

	["molly_tablet"] = {
		label = "Molly Tablet",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "molly_tablet.png",
		}
	},

	["ketamine"] = {
		label = "Ketamine",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "ketamine.png",
		}
	},

	["spice_pouch"] = {
		label = "GDZ K2",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "spice_pouch.png",
		}
	},

	["spice_joint"] = {
		label = "Spice Joint",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "spice_joint.png",
		}
	},

	["steroids"] = {
		label = "Steroids",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "steroids.png",
		}
	},

	["dab"] = {
		label = "DAB",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "dab.png",
		}
	},

	["heroin_brick"] = {
		label = "Heroinbrick",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "heroin_brick.png",
		}
	},

	["shroom_cut"] = {
		label = "Shroom Cut",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "shroom_cut.png",
		}
	},

	["meth_shot"] = {
		label = "Meth Shot",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "meth_shot.png",
		}
	},

	["acid"] = {
		label = "Acid",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "acid.png",
		}
	},

	["bong"] = {
		label = "Bong",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "bong.png",
		}
	},

	["flakka_joint"] = {
		label = "Flakka Joint",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "flakka_joint.png",
		}
	},

	["heroin_shot"] = {
		label = "Heroin Shot",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "heroin_shot.png",
		}
	},

	["plastic_wrap"] = {
		label = "Plastic Wrap",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "plastic_wrap.png",
		}
	},

	["blacklightning"] = {
		label = "Black Lightning",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "blacklightning.png",
		}
	},

	["drugtestkit"] = {
		label = "Drug Testkit",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "drugtestkit.png",
		}
	},

	["styrofoamcup"] = {
		label = "Styrofoam Cup",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "styrofoamcup.png",
		}
	},

	["lychee"] = {
		label = "lychee",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "lychee.png",
		}
	},

	["coco_chocosyrup"] = {
		label = "choco syrup",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "coco_chocosyrup.png",
		}
	},

	["coco_chocholate"] = {
		label = "chocholate",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "coco_chocholate.png",
		}
	},

	["shoeleather"] = {
		label = "Leather",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "shoeleather.png",
		}
	},

	["shoelace"] = {
		label = "Shoe Lace",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "shoelace.png",
		}
	},

	["shoes"] = {
		label = "Shoes",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "shoes.png",
		}
	},

	["shoesole"] = {
		label = "Shoe Sole",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "shoesole.png",
		}
	},

	["stingray"] = {
		label = "Stingray",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "stingray.png",
		}
	},

	["salmon"] = {
		label = "Salmon",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "salmon.png",
		}
	},

	["fishingrod"] = {
		label = "Fishingrod",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "fishingrod.png",
		}
	},

	["seed_potato"] = {
		label = "Seed Potato",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "seed_potato.png",
		}
	},

	["largemouthbass"] = {
		label = "Largemouth Bass",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "largemouthbass.png",
		}
	},

	["greatwhiteshark"] = {
		label = "Great White Shark",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "greatwhiteshark.png",
		}
	},

	["fishingbait"] = {
		label = "Fishing Bait",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "fishingbait.png",
		}
	},

	["seed_brinjal"] = {
		label = "Seed Brinjal",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "seed_brinjal.png",
		}
	},

	["reinforcedrod"] = {
		label = "Reinforced Rod",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "reinforcedrod.png",
		}
	},

	["tomatoo"] = {
		label = "Tomatoo",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "tomatoo.png",
		}
	},

	["magicbait"] = {
		label = "Magic Bait",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "magicbait.png",
		}
	},

	["cucumber"] = {
		label = "Cucumber",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "cucumber.png",
		}
	},

	["brinjal"] = {
		label = "Brinjal",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "brinjal.png",
		}
	},

	["redfish"] = {
		label = "Redfish",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "redfish.png",
		}
	},

	["seed_cucumber"] = {
		label = "Seed Cucumber",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "seed_cucumber.png",
		}
	},

	["glowworms"] = {
		label = "Glow Worms",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "glowworms.png",
		}
	},

	["rice"] = {
		label = "Rice",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "rice.png",
		}
	},

	["goldfish"] = {
		label = "Goldfish",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "goldfish.png",
		}
	},

	["marlin"] = {
		label = "Marlin",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "marlin.png",
		}
	},

	["catfish"] = {
		label = "Catfish",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "catfish.png",
		}
	},

	["seed_rice"] = {
		label = "Seed Rice",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "seed_rice.png",
		}
	},

	["anglerfish"] = {
		label = "Angler Fish",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "anglerfish.png",
		}
	},

	["seed_tomatoo"] = {
		label = "Seed Tomatoo",
		weight = 100,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "seed_tomatoo.png",
		}
	},

	["stripedbass"] = {
		label = "Striped Bass",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "stripedbass.png",
		}
	},

	["octopus"] = {
		label = "Octopus",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "octopus.png",
		}
	},

	["coelacanth"] = {
		label = "Coelacanth",
		weight = 500,
		stack = true,
		close = false,
		description = "Your description here",
		client = {
			image = "coelacanth.png",
		}
	},

	["boostingtab"] = {
		label = "Boosting Tablet",
		weight = 800.0,
		stack = true,
		close = true,
		client = {
			image = "boostingtab.png",
		}
	},

	["arm2"] = {
		label = "Armor Lvl. 2",
		weight = 1000.0,
		stack = true,
		close = true,
		client = {
			image = "arm2.png",
		}
	},

	["xenonsbleu"] = {
		label = "Blue Xenons",
		weight = 100.0,
		stack = true,
		close = true,
		client = {
			image = "xenonsbleu.png",
		}
	},

	["susp3"] = {
		label = "Suspension Lvl. 3",
		weight = 1000.0,
		stack = true,
		close = true,
		client = {
			image = "susp3.png",
		}
	},

	["susp1"] = {
		label = "Suspension Lvl. 1",
		weight = 1000.0,
		stack = true,
		close = true,
		client = {
			image = "susp1.png",
		}
	},

	["engine2"] = {
		label = "Engine Lvl. 2",
		weight = 1000.0,
		stack = true,
		close = true,
		client = {
			image = "engine2.png",
		}
	},

	["engine3"] = {
		label = "Engine Lvl. 3",
		weight = 1000.0,
		stack = true,
		close = true,
		client = {
			image = "engine3.png",
		}
	},

	["arm4"] = {
		label = "Armor Lvl. 4",
		weight = 1000.0,
		stack = true,
		close = true,
		client = {
			image = "arm4.png",
		}
	},

	["xenonsjaune"] = {
		label = "Yellow Xenons",
		weight = 100.0,
		stack = true,
		close = true,
		client = {
			image = "xenonsjaune.png",
		}
	},

	["turbo"] = {
		label = "Turbo Kit",
		weight = 1000.0,
		stack = true,
		close = true,
		client = {
			image = "turbo.png",
		}
	},

	["susp2"] = {
		label = "Suspension Lvl. 2",
		weight = 1000.0,
		stack = true,
		close = true,
		client = {
			image = "susp2.png",
		}
	},

	["xenonsvert"] = {
		label = "Green Xenons",
		weight = 100.0,
		stack = true,
		close = true,
		client = {
			image = "xenonsvert.png",
		}
	},

	["brakes1"] = {
		label = "Brakes Lvl. 1",
		weight = 1000.0,
		stack = true,
		close = true,
		client = {
			image = "brakes1.png",
		}
	},

	["hackingtab"] = {
		label = "Hacking Tablet",
		weight = 800.0,
		stack = true,
		close = true,
		client = {
			image = "hackingtab.png",
		}
	},

	["xenonsorange"] = {
		label = "Orange Xenons",
		weight = 100.0,
		stack = true,
		close = true,
		client = {
			image = "xenonsorange.png",
		}
	},

	["engine1"] = {
		label = "Engine Lvl. 1",
		weight = 1000.0,
		stack = true,
		close = true,
		client = {
			image = "engine1.png",
		}
	},

	["xenonsmauve"] = {
		label = "Purple Xenone",
		weight = 100.0,
		stack = true,
		close = true,
		client = {
			image = "xenonsmauve.png",
		}
	},

	["brakes3"] = {
		label = "Brakes Lvl. 3",
		weight = 1000.0,
		stack = true,
		close = true,
		client = {
			image = "brakes3.png",
		}
	},

	["brakes2"] = {
		label = "Brakes Lvl. 2",
		weight = 1000.0,
		stack = true,
		close = true,
		client = {
			image = "brakes2.png",
		}
	},

	["xenonsbleuelect"] = {
		label = "Electric Blue Xenons",
		weight = 100.0,
		stack = true,
		close = true,
		client = {
			image = "xenonsbleuelect.png",
		}
	},

	["engine4"] = {
		label = "Engine Lvl. 4",
		weight = 1000.0,
		stack = true,
		close = true,
		client = {
			image = "engine4.png",
		}
	},

	["trans1"] = {
		label = "Transmission Lvl. 1",
		weight = 1000.0,
		stack = true,
		close = true,
		client = {
			image = "trans1.png",
		}
	},

	["win3"] = {
		label = "Limo Window Tint",
		weight = 100.0,
		stack = true,
		close = true,
		client = {
			image = "win3.png",
		}
	},

	["arm1"] = {
		label = "Armor Lvl. 1",
		weight = 1000.0,
		stack = true,
		close = true,
		client = {
			image = "arm1.png",
		}
	},

	["xenonsblacklight"] = {
		label = "Blacklight Xenons",
		weight = 100.0,
		stack = true,
		close = true,
		client = {
			image = "xenonsblacklight.png",
		}
	},

	["xenonsmenthe"] = {
		label = "Mint Xenons",
		weight = 100.0,
		stack = true,
		close = true,
		client = {
			image = "xenonsmenthe.png",
		}
	},

	["xenonsrose"] = {
		label = "Pink Xenons",
		weight = 100.0,
		stack = true,
		close = true,
		client = {
			image = "xenonsrose.png",
		}
	},

	["susp4"] = {
		label = "Suspension Lvl. 4",
		weight = 1000.0,
		stack = true,
		close = true,
		client = {
			image = "susp4.png",
		}
	},

	["arm3"] = {
		label = "Armor Lvl. 3",
		weight = 1000.0,
		stack = true,
		close = true,
		client = {
			image = "arm3.png",
		}
	},

	["xenonsdefault"] = {
		label = "White Xenons",
		weight = 100.0,
		stack = true,
		close = true,
		client = {
			image = "xenonsdefault.png",
		}
	},

	["xenonsrose2"] = {
		label = "Hot Pink Xenons",
		weight = 100.0,
		stack = true,
		close = true,
		client = {
			image = "xenonsrose2.png",
		}
	},

	["xenonsgold"] = {
		label = "Gold Xenons",
		weight = 100.0,
		stack = true,
		close = true,
		client = {
			image = "xenonsgold.png",
		}
	},

	["trans3"] = {
		label = "Transmission Lvl. 3",
		weight = 1000.0,
		stack = true,
		close = true,
		client = {
			image = "trans3.png",
		}
	},

	["win2"] = {
		label = "Dark Smoke Window Tint",
		weight = 100.0,
		stack = true,
		close = true,
		client = {
			image = "win2.png",
		}
	},

	["xenonsrouge"] = {
		label = "Red Xenons",
		weight = 100.0,
		stack = true,
		close = true,
		client = {
			image = "xenonsrouge.png",
		}
	},

	["trans2"] = {
		label = "Transmission Lvl. 2",
		weight = 1000.0,
		stack = true,
		close = true,
		client = {
			image = "trans2.png",
		}
	},

	["arm5"] = {
		label = "Armor Lvl. 5",
		weight = 1000.0,
		stack = true,
		close = true,
		client = {
			image = "arm5.png",
		}
	},

	["win1"] = {
		label = "Light Smoke Window Tint",
		weight = 100.0,
		stack = true,
		close = true,
		client = {
			image = "win1.png",
		}
	},

	["crutch"] = {
		label = "Crutch",
		weight = 650,
		stack = true,
		close = true,
		description = "A device used to assist with walking.",
		client = {
			image = "crutch.png",
		}
	},

	["wheelchair"] = {
		label = "Wheelchair",
		weight = 850,
		stack = true,
		close = true,
		description = "A device used to assist with mobility.",
		client = {
			image = "wheelchair.png",
		}
	},

	["slimjim"] = {
		label = "Slim Jim",
		weight = 100.0,
		stack = true,
		close = true,
		client = {
			image = "slimjim.png",
		}
	},

	['rentalpapers'] = {
    label = "Rental Papers",
    weight = 0,
    stack = false,
    close = false,
    description = "Rental Papers",
    client = {
        image = "rentalpapers.png",
    },
	},
}