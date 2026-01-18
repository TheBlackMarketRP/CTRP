Config.Shop['mcdoodies'] = { -- job name
	blip = {enable = true, name = 'McDoodies', sprite = 124, color = 5, size = 0.6, radius = 0.0, radius_color = 4},
	boss_action = vector3(95.436, 291.511, 110.213),
	management = vector3(86.965, 287.697, 110.209),
	managementRankFor = {
		price = 2,
		stock = 2,
	},
	autoStock = {         		 -- auto refill shop items
	    enable = true,
	    slots = 500,             -- container size
	    regeneration = 10,       -- regenerate item every 10 minutes
	    add = 10,                -- add 1 item to the stock
	},
	crafting = {
		menu = vector3(89.949, 284.699, 110.209),
		data = {
			double_stack_deluxe = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					--{item = 'water', quantity = 1, willremove = false, damageChance = 10}, 
					--{item = 'bread', quantity = 2, willremove = true},
				},
				steps = {
					{pos = vector4(91.315, 285.190, 110.209, 251.167),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(90.751, 283.621, 110.209, 247.596),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(90.612, 286.427, 110.209, 71.408),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			crispy_chicken_sandwich = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.315, 285.190, 110.209, 251.167),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(90.751, 283.621, 110.209, 247.596),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(90.612, 286.427, 110.209, 71.408),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			double_beef_supreme = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.315, 285.190, 110.209, 251.167),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(90.751, 283.621, 110.209, 247.596),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(90.612, 286.427, 110.209, 71.408),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			sunrise_muffin = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.315, 285.190, 110.209, 251.167),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(90.751, 283.621, 110.209, 247.596),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(90.612, 286.427, 110.209, 71.408),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			quarter_beef_burger = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.315, 285.190, 110.209, 251.167),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(90.751, 283.621, 110.209, 247.596),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(90.612, 286.427, 110.209, 71.408),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			quarter_beef_burger_cheese = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.315, 285.190, 110.209, 251.167),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(90.751, 283.621, 110.209, 247.596),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(90.612, 286.427, 110.209, 71.408),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			sausage_biscuit = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.315, 285.190, 110.209, 251.167),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(90.751, 283.621, 110.209, 247.596),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(90.612, 286.427, 110.209, 71.408),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			sausage_burrito = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.315, 285.190, 110.209, 251.167),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(90.751, 283.621, 110.209, 247.596),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(90.612, 286.427, 110.209, 71.408),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			spicy_crispy_chicken_sandwich = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.315, 285.190, 110.209, 251.167),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(90.751, 283.621, 110.209, 247.596),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(90.612, 286.427, 110.209, 71.408),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			fiery_premium_sandwich = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.315, 285.190, 110.209, 251.167),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(90.751, 283.621, 110.209, 247.596),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(90.612, 286.427, 110.209, 71.408),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			

			hot_fudge_sundae = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.727, 287.192, 110.209, 252.629),  delay = 5, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			mc_cappuccino = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.727, 287.192, 110.209, 252.629),  delay = 5, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			classic_cola = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.727, 287.192, 110.209, 252.629),  delay = 5, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			light_cola = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.727, 287.192, 110.209, 252.629),  delay = 5, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			pepper_twist_cola = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.727, 287.192, 110.209, 252.629),  delay = 5, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			citrus_burst_soda = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.727, 287.192, 110.209, 252.629),  delay = 5, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			citrus_burst_soda = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.727, 287.192, 110.209, 252.629),  delay = 5, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			mc_flurry_candies = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.727, 287.192, 110.209, 252.629),  delay = 5, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			mc_flurry_cookies = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.727, 287.192, 110.209, 252.629),  delay = 5, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			mc_fruit_punch = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.727, 287.192, 110.209, 252.629),  delay = 5, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			mc_hot_chocolate = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.727, 287.192, 110.209, 252.629),  delay = 5, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			mc_iced_coffee = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.727, 287.192, 110.209, 252.629),  delay = 5, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			mc_iced_tea = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.727, 287.192, 110.209, 252.629),  delay = 5, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			citrus_spark = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.727, 287.192, 110.209, 252.629),  delay = 5, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			mc_strawberry_shake = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.727, 287.192, 110.209, 252.629),  delay = 5, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			mc_vanilla_shake = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.727, 287.192, 110.209, 252.629),  delay = 5, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			orange_juice = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.727, 287.192, 110.209, 252.629),  delay = 5, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			strawberry_watermelon_slushie = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.727, 287.192, 110.209, 252.629),  delay = 5, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			tropical_mango_slushie = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(91.727, 287.192, 110.209, 252.629),  delay = 5, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},

			double_stack_deluxe_combo = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'double_stack_deluxe', quantity = 1, willremove = true},
					{item = 'golden_crispy_fries', quantity = 1, willremove = true},
					{item = 'classic_cola', quantity = 1, willremove = true},
				},
				steps = {

				}
			},
			cheesy_burger_feast = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'quarter_beef_burger', quantity = 2, willremove = true},
					{item = 'golden_crispy_fries', quantity = 1, willremove = true},
					{item = 'classic_cola', quantity = 1, willremove = true},
				},
				steps = {
					
				}
			},
			deluxe_crispy_sandwich_combo = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'fiery_premium_sandwich', quantity = 1, willremove = true},
					{item = 'golden_crispy_fries', quantity = 1, willremove = true},
					{item = 'citrus_spark', quantity = 1, willremove = true},
				},
				steps = {
					
				}
			},
			double_quarter_combo = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'double_beef_supreme', quantity = 1, willremove = true},
					{item = 'golden_crispy_fries', quantity = 1, willremove = true},
					{item = 'pepper_twist_cola', quantity = 1, willremove = true},
				},
				steps = {
					
				}
			},
			egg_cheese_biscuit = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'sausage_biscuit', quantity = 1, willremove = true},
					{item = 'mc_cappuccino', quantity = 1, willremove = true},
					{item = 'crispy_chicken_bites', quantity = 1, willremove = true},
				},
				steps = {
					
				}
			},
			mc_combo_chicken = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'classic_cola', quantity = 1, willremove = true},
					{item = 'golden_crispy_fries', quantity = 1, willremove = true},
					{item = 'crispy_chicken_bites', quantity = 1, willremove = true},
				},
				steps = {
					
				}
			},
			spicy_chicken_sandwich_combo = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'spicy_crispy_chicken_sandwich', quantity = 1, willremove = true},
					{item = 'golden_crispy_fries', quantity = 1, willremove = true},
					{item = 'mc_iced_tea', quantity = 1, willremove = true},
				},
				steps = {
					
				}
			},
			


		}
	},
	storage = {
		pos = vector4(90.329, 279.109, 110.209, 0.0), 		-- x, y, z, heading
		prop = nil,
		items = {
			golden_crispy_fries = {
                name = 'Golden Crispy Fries',                        	-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            crispy_chicken_bites = {
                name = 'Crispy Chicken Bites',                        	-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            
		}
	},
	sell_coords = {											-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
		vector3(85.896, 289.876, 110.209),
		vector3(85.258, 288.189, 110.209),
		vector3(84.571, 286.485, 110.209),
		vector3(83.861, 284.295, 110.209),
		vector3(84.482, 281.936, 110.209),
		vector3(85.779, 280.207, 110.209),

	},
	data = {
		market_items = {					-- Here you configure the items definitions
			double_stack_deluxe = {				-- The item ID
				name = "Double Stack Deluxe",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			crispy_chicken_sandwich = {				-- The item ID
				name = "Cispy Chicken Sandwich",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			double_beef_supreme = {				-- The item ID
				name = "Double Beef Supreme",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			sunrise_muffin = {				-- The item ID
				name = "Sunrise Muffin",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			quarter_beef_burger = {				-- The item ID
				name = "Quarter Beef Burger",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			quarter_beef_burger_cheese = {				-- The item ID
				name = "Quarter Beef Burger Cheese",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			sausage_biscuit = {				-- The item ID
				name = "Sausage Biscuit",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			sausage_burrito = {				-- The item ID
				name = "Sausage Burrito",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			spicy_crispy_chicken_sandwich = {				-- The item ID
				name = "Spicy Crispy Chicken Sandwich",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			fiery_premium_sandwich = {				-- The item ID
				name = "Fiery Premium Sandwich",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			crispy_chicken_bites = {				-- The item ID
				name = "Crispy Chicken Bites",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = false
			},
			golden_crispy_fries = {				-- The item ID
				name = "Golden Crispy Fries",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = false
			},
			
			double_stack_deluxe_combo = {				-- The item ID
				name = "Double Stack Deluxe Combo",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			cheesy_burger_feast = {				-- The item ID
				name = "Cheesy Burger Feast",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			deluxe_crispy_sandwich_combo = {				-- The item ID
				name = "Deluxe Crispy Sandwich Combo",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			double_quarter_combo = {				-- The item ID
				name = "Double Quarter Combo",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			egg_cheese_biscuit = {				-- The item ID
				name = "Egg Cheese Biscuit",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			mc_combo_chicken = {				-- The item ID
				name = "Combo Chicken",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			nugget_kids = {				-- The item ID
				name = "Nugget Kids",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			spicy_chicken_sandwich_combo = {				-- The item ID
				name = "Spicy Chicken Sandwich Combo",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			
			hot_fudge_sundae = {				-- The item ID
				name = "Hot Fudge Sundae",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			mc_flurry_candies = {				-- The item ID
				name = "Flurry Candies",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			mc_flurry_cookies = {				-- The item ID
				name = "Flurry Cookies",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			mc_cappuccino = {				-- The item ID
				name = "Cappuccino",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			mc_hot_chocolate = {				-- The item ID
				name = "Hot Chocolate",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			mc_strawberry_shake = {				-- The item ID
				name = "Strawberry Shake",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			mc_vanilla_shake = {				-- The item ID
				name = "Vanilla Shake",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			
			mc_iced_coffee = {				-- The item ID
				name = "Iced Coffee",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			classic_cola = {				-- The item ID
				name = "Classic Cola",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			light_cola = {				-- The item ID
				name = "Light Cola",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			pepper_twist_cola = {				-- The item ID
				name = "Pepper Twist Cola",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			citrus_burst_soda = {				-- The item ID
				name = "Citrus Burst Soda",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			mc_fruit_punch = {				-- The item ID
				name = "Fruit Punch",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			mc_iced_tea = {				-- The item ID
				name = "Iced Tea",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			citrus_spark = {				-- The item ID
				name = "Citrus Spark",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			orange_juice = {				-- The item ID
				name = "Orange Juice",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			strawberry_watermelon_slushie = {				-- The item ID
				name = "Strawberry Watermelon Slushie",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			tropical_mango_slushie = {				-- The item ID
				name = "Tropical Mango Slushie",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			
		},
		pagination = {						-- Create pages to your market items (max 10 pages)
			[0] = {name = "Burger", icon = 'fa-link'},
			[1] = {name = "Combo", icon = 'fa-link'},
			[2] = {name = "Shakes", icon = 'fa-link'},
			[3] = {name = "Drinks", icon = 'fa-link'},
		},
	},
}