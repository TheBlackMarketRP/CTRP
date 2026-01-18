Config, Locales = {}, {}

Config.Locale = 'en' -- en / pt / es / fr / de

Config.Debug = false -- true = debug | false = no debug

Config.DevMode = true -- true = Can restart the script in game that everything works | false = You can't restart the script in game otherwise it stops working

Config.UseOkokNotify = true -- true = okokNotify | false = qb-notify ( You can change the notification system on cl_utils.lua )

Config.UseOkokTextUI = false -- true = okokTextUI | false = qb-drawtext 

Config.UseOkokRequests = false -- true = okokRequests | false = Hire right away

Config.UseOkokBanking = true -- true = The transactions will be registered on okokBanking

Config.UseOkokGasStation = false -- true = The fuel will be handled by okokGasStation

Config.UseTarget = false -- true = target system | false = draw text

Config.TargetSystem = 'qb-target' -- qb-target | ox-target

Config.Currency = '$' -- The currency used on the script

Config.CurrencyonLeft = false -- true = The currency symbol will be in the left side | false = On the right side on UI

Config.Key = 38 -- [E] Key to open the interaction, check here the keys ID: https://docs.fivem.net/docs/game-references/controls/#controls

Config.EventPrefix = "okokShop" -- This will change the prefix of the events name so if Config.EventPrefix = "example" the events will be "example:event"

Config.MaxShopsPerPlayer = 5 -- How many shops a player can own

Config.MaxEmployeesPerShop = 10 -- How many employees a shop can have

Config.HireDistance = 3 -- How close a player needs to be to be in the hiring range

Config.SellBusinessReceivePercentage = 50 -- How much % a player will receive for selling his business (in percentage, 50 = 50%)

Config.RewardPercentageOnOrder = 25 -- The percentage that the employee will get when doing an order depending on the capacity price ( price is 100, reward will be 25 on 25%)

Config.BuyPercentageForBusiness = 15 -- How much % a item will cost for store owners to buy from the suplier ( 4.00 = 0.60)

Config.DefaultMaxStock = 500 -- The Default max stock available after purchasing the store

Config.TotalMaxStock = 5000 -- The Max Stock available on total to upgrade the store

Config.TruckBlip = { blipId = 67, blipColor = 2, blipScale = 0.8, blipText = "Mission Truck" } -- Blip of the truck when someone accepts an order

Config.OrderBlip = { blipId = 8, blipColor = 2, blipScale = 0.8, blipText = "Shop Order", blipFinish = "Finish Order" }  -- Blip of the suplier location when someone accepts an order

Config.Marker = { id = 21, size = { x = 0.5, y = 0.5, z = 0.5 }, color = { r = 94, g = 255, b = 155 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 } -- The marker to tow a vehicle when someone accepts an order

Config.OrdersVehicle = "boxville4" -- The vehicle that will be used to deliver the orders

Config.OrderLimit = 20 -- How many items you can order at a time for order

Config.TimesToStock = 3 -- How many times a player needs to take a box to stock the truck to complete the order

Config.MaxPercentageOnPriceChange = 100 -- The max percentage that the price of the item can change from the original price ( on Config.AvailableItems ) so 100% means double the price

Config.BackDoors = true -- true = It will check 2 back doors | false will check only the trunk door

Config.TrunkOpenToGetBox = true -- true = The trunk needs to be opened in order to fill the truck

Config.BoxFrontAndBack = 2.0 -- This is to fix the X box position on the truck

Config.BoxUpAndDown = -0.1 -- This is to fix the Z box position on the truck

Config.TrunkPositionFix = -5.0 -- This is to fix the trunk position of the vehicle

Config.ShowBlips = false -- Activate/Deactivate all blips

Config.ShowOwnerBlip = true -- Activate/Deactivate owner blips

Config.ShowBuyShopBlip = true -- Activate/Deactivate buy store blip

Config.UseRoadNamesToShop = false -- true = The shop will be named after the road name

Config.DaysToRemoveShop = 15 -- How many days it will take for a shopt o be removed when no stock of all items

Config.SubOwnerRank = 4 -- ID of the rank that will work as a secondary owner ( check the Config.Ranks )

Config.Inventory = 'ox_inventory/web/images' -- Inventory directory for the images

Config.MinimumAmountForAlert = 10 -- Minimum amount of items to show that the item needs restock

Config.SalesHistoryLimit = 25 -- Records for each shop that will be saved on the sale history table

Config.SalesDateFormat = "%d/%m - %H:%M" -- The Date that will be shown on Sales History

Config.ClearOnlySourceCart = false -- true = Only the source cart will be cleared | false = All carts will be cleared

Config.Ranks = {  -- These are the ranks available on the shops, you can add or remove as many as you want but leave at least 1
	{ rank = 1, label = "Newbie" },
	{ rank = 2, label = "Experienced" },
	{ rank = 3, label = "Expert" },
	{ rank = 4, label = "Sub-Owner" },
}

Config.Capacities = {  -- The list of capacities available to update the max stock
	{ capacity = 100,  price = 1200 },
	{ capacity = 200,  price = 2000 },
	{ capacity = 500,  price = 3500 },
	{ capacity = 100000, price = 5000 },
}

Config.AvailableItems = { -- The list of items available to sell on the shop and the inicial price / amount
	{ name = 'radio',           label = 'Radio',          price = 5000.00,   amount = 1000, type = 'electronic' },
	{ name = 'phone',           label = 'Classic Phone',          price = 5000.00,   amount = 1000, type = 'electronic' },
	{ name = 'cleaningkit',     label = 'Cleaning Kit',   price = 35.00,  amount = 1000, type = 'global'     },
	{ name = 'contract',     label = 'Contract',   price = 100000.00,  amount = 1000, type = 'global'     },
	{ name = 'smalloutfitbag',     label = 'Small Outfit Bag',   price = 100000.00,  amount = 1000, type = 'global'     },
	{ name = 'largeoutfitbag',     label = 'Large Outfit Bag',   price = 150000.00,  amount = 1000, type = 'global'     },
	{ name = 'sprunk',      label = 'Sprunk',    price = 1500.00,   amount = 1000, type = 'global'     },
	{ name = 'pooch_bag',       label = 'Pooch Bag',       price = 2.00,   amount = 1000, type = 'global'     },
	{ name = 'burger',        label = 'Burger',       price = 1500.00,   amount = 1000, type = 'global'     },
	{ name = 'lighter',         label = 'Lighter',        price = 5000.00,   amount = 1000, type = 'global'     },
	{ name = 'spraycan',         label = 'Spray Can',        price = 10000.00,   amount = 1000, type = 'global'     },
	{ name = 'paintremover',         label = 'Paint Remover',        price = 10000.00,   amount = 1000, type = 'global'     },
	{ name = 'backroots_grape',          label = 'Backroots Grape',         price = 1500.00,   amount = 1000, type = 'global'     },
	{ name = 'backroots_creamy_blend',    label = 'backroots Creamy Blend',  	      price = 1500.00,   amount = 1000, type = 'global'     },
	{ name = 'banana_backroots',    label = 'Banana Backroots',  	      price = 1500.00,   amount = 1000, type = 'global'     },
	{ name = 'backroots_honey',    label = 'Backroots Honey',  	      price = 1500.00,   amount = 1000, type = 'global'     },
	{ name = 'graba_wrap',    label = 'Graba Wrap',  	      price = 1500.00,   amount = 1000, type = 'global'     },
	{ name = 'bakingsoda',    label = 'Baking Soda',  	      price = 50.00,   amount = 1000, type = 'global'     },
	{ name = 'styrofoamcup',    label = 'Styrofoam Cup',  	      price = 2.00,   amount = 1000, type = 'global'     },
	{ name = 'pyrex',         label = 'Pyrex',        price = 2.00,   amount = 1000, type = 'global'     },
	{ name = 'bandage',         label = 'Bandage',        price = 500.00,   amount = 1000, type = 'global'     },
	{ name = 'lighter',         label = 'Lighter',        price = 5000.00,   amount = 1000, type = 'smoke'     },
	-- { name = 'vape',         label = 'Vape',        price = 10000.00,   amount = 1000, type = 'smoke'     },
	{ name = 'pooch_bag',         label = 'pooch_bag',        price = 2.00,   amount = 1000, type = 'smoke'     },
	{ name = 'pillbottle',         label = 'Pill Bottle',        price = 2.00,   amount = 1000, type = 'pill'     },
	{ name = 'pillpress',         label = 'Pill Press',        price = 150000.00,   amount = 1000, type = 'pill'     },
	{ name = 'backroots_grape',          label = 'Backroots Grape',         price = 1500.00,   amount = 1000, type = 'smoke'     },
	{ name = 'backroots_grape',          label = 'Backroots Grape',         price = 1500.00,   amount = 1000, type = 'bb'     },
	{ name = 'backroots_creamy_blend',    label = 'backroots Creamy Blend',  	      price = 1500.00,   amount = 1000, type = 'smoke'     },
	{ name = 'backroots_creamy_blend',    label = 'backroots Creamy Blend',  	      price = 1500.00,   amount = 1000, type = 'bb'     },
	{ name = 'banana_backroots',    label = 'Banana Backroots',  	      price = 1500.00,   amount = 1000, type = 'smoke'     },
	{ name = 'banana_backroots',    label = 'Banana Backroots',  	      price = 1500.00,   amount = 1000, type = 'bb'     },
	{ name = 'backroots_honey',    label = 'Backroots Honey',  	      price = 1500.00,   amount = 1000, type = 'smoke'     },
	{ name = 'backroots_honey',    label = 'Backroots Honey',  	      price = 1500.00,   amount = 1000, type = 'bb'     },
	{ name = 'graba_wrap',    label = 'Graba Wrap',  	      price = 1500.00,   amount = 1000, type = 'smoke'     },
	{ name = 'graba_wrap',    label = 'Graba Wrap',  	      price = 1500.00,   amount = 1000, type = 'bb'     },
	-- { name = 'berry_swirl',    label = 'Berry Swirl',  	      price = 5000.00,   amount = 1000, type = 'smoke'     },
	-- { name = 'golden_crumble',    label = 'Golden Crumble',  	      price = 5000.00,   amount = 1000, type = 'smoke'     },
	-- { name = 'biscuit_bliss',    label = 'Biscuit Bliss',  	      price = 5000.00,   amount = 1000, type = 'smoke'     },
	{ name = 'glacatti',    label = 'Glacatti',  	      price = 5000.00,   amount = 1000, type = 'bb'     },
	{ name = 'hary_payton',    label = 'Hary Payton',  	      price = 5000.00,   amount = 1000, type = 'bb'     },
	{ name = 'grain_cream',    label = 'Grain Cream',  	      price = 5000.00,   amount = 1000, type = 'bb'     },
	{ name = 'wild_feline',    label = 'Wild Feline',  	      price = 5000.00,   amount = 1000, type = 'bb'     },
	{ name = 'frosty_phantom',    label = 'Frosty Phantom',  	      price = 5000.00,   amount = 1000, type = 'bb'     },
	{ name = 'peach_cobbler',    label = 'Peach Cobbler',  	      price = 5000.00,   amount = 1000, type = 'bb'     },
	{ name = 'boss_blend',    label = 'Boss Blend',  	      price = 5000.00,   amount = 1000, type = 'bb'     },
	{ name = 'pastry_blend',    label = 'Pastry Blend',  	      price = 5000.00,   amount = 1000, type = 'bb'     },
	{ name = 'pure_runs',    label = 'Pure Runs',  	      price = 5000.00,   amount = 1000, type = 'bb'     },
	{ name = 'snowberry_gelato',    label = 'Snowberry Gelato',  	      price = 5000.00,   amount = 1000, type = 'bb'     },
	{ name = 'berry_muffin',    label = 'Berry Muffin',  	      price = 5000.00,   amount = 1000, type = 'bb'     },
	{ name = 'elegant_porcelain',    label = 'Elegant Porcelain',  	      price = 5000.00,   amount = 1000, type = 'bb'     },
	{ name = 'rosy_dunes',    label = 'Rosy Dunes',  	      price = 5000.00,   amount = 1000, type = 'bb'     },
	{ name = 'zen_blend',    label = 'Zen Blend',  	      price = 5000.00,   amount = 1000, type = 'bb'     },
	{ name = 'crisp_gelato',    label = 'Crisp Gelato',  	      price = 5000.00,   amount = 1000, type = 'bb'     },
	{ name = 'ammo-9',  label = '9mm',       price = 1500.00,   amount = 1000, type = 'ammo'      },
	{ name = 'ammo-45',      label = '45 acp',     price = 1750.00,   amount = 1000, type = 'ammo'      },
	{ name = 'ammo-rifle',      label = '556',     price = 2000.00,   amount = 1000, type = 'ammo'      },
	{ name = 'ammo-rifle2',      label = '762',     price = 2250.00,   amount = 1000, type = 'ammo'      },
	{ name = 'ammo-shotgun',      label = '7mm',     price = 2500.00,   amount = 1000, type = 'ammo'      },
	{ name = 'ammo-sniper',      label = '762x51',     price = 2500.00,   amount = 1000, type = 'ammo'      },
	{ name = 'ammo-heavysniper',      label = '50 BMG',     price = 2500.00,   amount = 1000, type = 'ammo'      },
	{ name = 'at_clip_clear',      label = '30 mag',     price = 10000.00,   amount = 1000, type = 'ammo'      },
	{ name = 'at_clip_drum_pistol',      label = '50 Drum',     price = 30000.00,   amount = 1000, type = 'ammo'      },
	{ name = 'at_clip_100_pistol',      label = '100 Drum',     price = 50000.00,   amount = 1000, type = 'ammo'      },
	{ name = 'heavyarmor',      label = 'Armor',     price = 10000.00,   amount = 1000, type = 'ammo'      },
	{ name = 'WEAPON_BAT',      label = 'Bat',     price = 2500.00,   amount = 1000, type = 'ammo'      },
	{ name = 'WEAPON_KNIFE',      label = 'Knife',     price = 5000.00,   amount = 1000, type = 'ammo'      },
	{ name = 'WEAPON_HIPOINT',      label = 'HiPoint',     price = 50000.00,   amount = 1000, type = 'ammo'      },
	{ name = 'WEAPON_G19G4',      label = 'G19 G4',     price = 75000.00,   amount = 1000, type = 'ammo'      },
	{ name = 'WEAPON_BLUETITANS',      label = 'G19 Switch',     price = 500000.00,   amount = 1000, type = 'ammo'      },
	{ name = 'WEAPON_TUZI',      label = 'Uzi',     price = 1000000.00,   amount = 1000, type = 'ammo'      },
	{ name = 'laundrycard',      label = 'Laundry Card',     price = 15000.00,   amount = 1000, type = 'laundry'      },
	{ name = 'bag',      label = 'Bag',     price = 15000.00,   amount = 1000, type = 'black'      },
	{ name = 'drill',      label = 'Drill',     price = 15000.00,   amount = 1000, type = 'black'      },
	{ name = 'big_drill',      label = 'Big Drill',     price = 15000.00,   amount = 1000, type = 'black'      },
	{ name = 'thermite',      label = 'Thermite',     price = 15000.00,   amount = 1000, type = 'black'      },
	{ name = 'hack_usb',      label = 'Hack Usb',     price = 15000.00,   amount = 1000, type = 'black'      },
	{ name = 'cutter',      label = 'Cutter',     price = 15000.00,   amount = 1000, type = 'black'      },
	{ name = 'c4_bomb',      label = 'c4 Bomb',     price = 15000.00,   amount = 1000, type = 'black'      },
	{ name = 'thermite_bomb',      label = 'Thermite Bomb',     price = 15000.00,   amount = 1000, type = 'black'      },
	{ name = 'laptop',      label = 'Laptop',     price = 15000.00,   amount = 1000, type = 'black'      },
	{ name = 'fraudprinter',      label = 'Fraud Printer',     price = 15000.00,   amount = 1000, type = 'black'      },
	{ name = 'fraudscaner',      label = 'Fraud Scanner',     price = 15000.00,   amount = 1000, type = 'black'      },
	{ name = 'fraudgnei',      label = 'Fraud Geni',     price = 15000.00,   amount = 1000, type = 'black'      },
	{ name = 'fraudlaptop',      label = 'Fraud Laptop',     price = 15000.00,   amount = 1000, type = 'black'      },
	{ name = 'emptycard',      label = 'Empty Card',     price = 500.00,   amount = 1000, type = 'black'      },
	{ name = 'emptychip',      label = 'Empty Chip',     price = 500.00,   amount = 1000, type = 'black'      },
	{ name = 'emptyslip',      label = 'Empty Slip',     price = 500.00,   amount = 1000, type = 'black'      },
	{ name = 'WEAPON_TARP',      label = 'Tan Arp',     price = 2000000.00,   amount = 1000, type = 'black'      },
	{ name = 'WEAPON_BLACKTOMMY',      label = 'Black Tommy',     price = 2500000.00,   amount = 1000, type = 'black'      },
	{ name = 'WEAPON_AUGA1',      label = 'Aug A1',     price = 3000000.00,   amount = 1000, type = 'black'      },
	{ name = 'djs_box_beefpatties',      label = 'Box of Beef Patties',     price = 500.00,   amount = 1000, type = 'jerk'      },
	{ name = 'djs_box_goatcurryandrice',      label = 'Box of Goat Curry',     price = 500.00,   amount = 1000, type = 'jerk'      },
	{ name = 'djs_box_grizzadatarts',      label = 'Box of Grizzada Tarts',     price = 500.00,   amount = 1000, type = 'jerk'      },
	{ name = 'djs_box_jamicanshortribs',      label = 'Box of Short Ribs',     price = 500.00,   amount = 1000, type = 'jerk'      },
	{ name = 'djs_box_jerkchicken',      label = 'Box of Jerk Chicken',     price = 500.00,   amount = 1000, type = 'jerk'      },
	{ name = 'djs_box_jerkpork',      label = 'Box of Jerk Pork',     price = 500.00,   amount = 1000, type = 'jerk'      },
	{ name = 'djs_box_oxtailmac',      label = 'Box of Ox Tail Mac',     price = 500.00,   amount = 1000, type = 'jerk'      },
	{ name = 'djs_box_oxtailrice',      label = 'Box of Ox Tail and Rice',     price = 500.00,   amount = 1000, type = 'jerk'      },
	{ name = 'djs_box_rastapasta',      label = 'Box of Rasta Pasta',     price = 500.00,   amount = 1000, type = 'jerk'      },
	{ name = 'djs_box_seafoodgumbo',      label = 'Box of Sea Food Gumbo',     price = 500.00,   amount = 1000, type = 'jerk'      },
	{ name = 'djs_box_steaknshrimp',      label = 'Box of Steak and Shrimp',     price = 500.00,   amount = 1000, type = 'jerk'      },
	{ name = 'djs_plate_jerkchicken',      label = 'Plate of jerk Chicken',     price = 500.00,   amount = 1000, type = 'jerk'      },
	{ name = 'djs_plate_oxtail',      label = 'Plate of Ox tail',     price = 500.00,   amount = 1000, type = 'jerk'      },
	{ name = 'djs_prop_coconutdrink',      label = 'Coconut Drink',     price = 500.00,   amount = 1000, type = 'jerk'      },
	{ name = 'djs_prop_pineapple',      label = 'Pineapple Drink',     price = 500.00,   amount = 1000, type = 'jerk'      },
	{ name = 'djs_vuburritos',      label = 'Burritos',     price = 500.00,   amount = 1000, type = 'luxxx'      },
	{ name = 'djs_vutacos',      label = 'Tacos',     price = 500.00,   amount = 1000, type = 'luxxx'      },
	{ name = 'djs_empanadas',      label = 'Empanadas',     price = 500.00,   amount = 1000, type = 'luxxx'      },
	{ name = 'djs_strawberry_margarita',      label = 'Strawberry Margarita',     price = 500.00,   amount = 1000, type = 'luxxx'      },
	{ name = 'djs_raspberry_martini',      label = 'Raspberry Martini',     price = 500.00,   amount = 1000, type = 'luxxx'      },
	{ name = 'djs_prop_pineappleshortcake_jelloshot',      label = 'Pineapple Shortcake Jelloshot',     price = 500.00,   amount = 1000, type = 'luxxx'      },
	{ name = 'djs_prop_orangecream_jelloshot',      label = 'Orange Cream Jelloshot',     price = 500.00,   amount = 1000, type = 'luxxx'      },
	{ name = 'djs_prop_keylimepie_jelloshot',      label = 'Key Lime Pie Jelloshot',     price = 500.00,   amount = 1000, type = 'luxxx'      },
	{ name = 'djs_prop_cherrypie_jelloshot',      label = 'Cherry Pie Jelloshot',     price = 500.00,   amount = 1000, type = 'luxxx'      },
	{ name = 'djs_prop_cherrylimepie_jelloshot',      label = 'Cherry Lime Pie Jelloshot',     price = 500.00,   amount = 1000, type = 'luxxx'      },
	{ name = 'djs_prop_blueberrypie_jelloshot',      label = 'Blueberry Pie Jelloshot',     price = 500.00,   amount = 1000, type = 'luxxx'      },
	{ name = 'djs_grapefruit_martini',      label = 'Grapefruit Martini',     price = 500.00,   amount = 1000, type = 'luxxx'      },
	{ name = 'djs_ginandtonic',      label = 'Gin and Tonic',     price = 500.00,   amount = 1000, type = 'luxxx'      },
	{ name = 'djs_cherrypineapple_margarita',      label = 'Cherry Pineapple Margarita',     price = 500.00,   amount = 1000, type = 'luxxx'      },
	{ name = 'djs_cherryhibiscus_margarita',      label = 'Cherry Hibiscus Margarita',     price = 500.00,   amount = 1000, type = 'luxxx'      },
	{ name = 'djs_carambolaandmint_margarita',      label = 'Carambola and Mint Margarita',     price = 500.00,   amount = 1000, type = 'luxxx'      },
	{ name = 'djs_bloodorange_margarita',      label = 'Blood Orange Margarita',     price = 500.00,   amount = 1000, type = 'luxxx'      },
	{ name = 'djs_blackberry_martini',      label = 'BlackBerry Martini',     price = 500.00,   amount = 1000, type = 'luxxx'      },
	{ name = 'djs_berryflower_martini',      label = 'Berry Flower Martini',     price = 500.00,   amount = 1000, type = 'luxxx'      },
	{ name = 'lychee',      label = 'Lychee',     price = 500.00,   amount = 1000, type = 'bbb'      },
	{ name = 'coco_chocosyrup',      label = 'Chocholate Syrup',     price = 1000.00,   amount = 1000, type = 'bbb'      },
	{ name = 'coco_chocholate',      label = 'Chocholate',     price = 1500.00,   amount = 1000, type = 'bbb'      },
	{ name = 'lofexidine',      label = 'Lofexidine',     price = 15000.00,   amount = 1000, type = 'pill'      },
	{ name = 'acamprosate',      label = 'Acamprosate',     price = 5000.00,   amount = 1000, type = 'pill'      },
	{ name = 'spicy_crispy_chicken_sandwich',      label = 'Spicy Crispy Chicken Sandwich',     price = 1000.00,   amount = 1000, type = 'burger'      },
	{ name = 'double_stack_deluxe',      label = 'Double Stack Deluxe',     price = 1000.00,   amount = 1000, type = 'burger'      },
	{ name = 'crispy_chicken_bites',      label = 'Chicken Nuggets',     price = 1000.00,   amount = 1000, type = 'burger'      },
	{ name = 'golden_crispy_fries',      label = 'Golden Crispy Fries',     price = 1000.00,   amount = 1000, type = 'burger'      },
	{ name = 'quarter_beef_burger',      label = 'Quarter Beef Burger',     price = 1000.00,   amount = 1000, type = 'burger'      },
	{ name = 'classic_cola',      label = 'Classic Cola',     price = 1000.00,   amount = 1000, type = 'burger'      },
	{ name = 'pepper_twist_cola',      label = 'Pepper Twist Cola',     price = 1000.00,   amount = 1000, type = 'burger'      },
	{ name = 'citrus_burst_soda',      label = 'Citrus Burst Soda',     price = 1000.00,   amount = 1000, type = 'burger'      },
	{ name = 'mc_iced_tea',      label = 'Iced Tea',     price = 1000.00,   amount = 1000, type = 'burger'      },
	{ name = 'boostingtab',      label = 'Boosting Tab',     price = 5000000.00,   amount = 1000, type = 'dono'      },
	{ name = '1backpack1',      label = 'Backpack',     price = 10000000.00,   amount = 1000, type = 'dono'      },
	{ name = 'bgasbottleb',      label = 'Galaxy Gas',     price = 15000000.00,   amount = 1000, type = 'dono'      },
}

Config.Stores = { 
    { 
		name = "24/7", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "mp_m_shopkeep_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(25.97, -1346.73, 29.5), -- Marker/Shop position for clients
		targetCoords = vector4(24.3, -1346.9, 29.5, 270.89), -- Coords for the ped to use target
		ownerCoords = vector3(29.67, -1339.57, 29.5), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(15.1, -1346.73, 29.19, 179.25), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 59, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 59, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 59, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		restockMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "global", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop1", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "24/7", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "mp_m_shopkeep_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(-48.05, -1757.15, 29.42), -- Marker/Shop position for clients
		targetCoords = vector4(-46.33, -1758.07, 29.42, 55.81), -- Coords for the ped to use target
		ownerCoords = vector3(-44.13, -1749.44, 29.42), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(-43.25, -1738.69, 28.8, 49.48), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 59, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 59, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 59, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "global", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop2", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "24/7", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "mp_m_shopkeep_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(-707.53, -913.82, 19.22), -- Marker/Shop position for clients
		targetCoords = vector4(-705.62, -913.4, 19.22, 91.3), -- Coords for the ped to use target
		ownerCoords = vector3(-709.57, -905.39, 19.22), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(-700.07, -919.53, 18.59, 90.93), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 59, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 59, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 59, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "global", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop3", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "24/7", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "mp_m_shopkeep_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(-1487.68, -378.9, 40.16), -- Marker/Shop position for clients
		targetCoords = vector4(-1486.16, -377.8, 40.16, 141.38), -- Coords for the ped to use target
		ownerCoords = vector3(-1483.41, -375.65, 40.16), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(-1506.13, -383.92, 40.31, 47.13), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 59, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 59, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 59, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "global", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop4", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "24/7", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "mp_m_shopkeep_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(374.27, 326.8, 103.57), -- Marker/Shop position for clients
		targetCoords = vector4(372.61, 327.15, 103.57, 249.94), -- Coords for the ped to use target
		ownerCoords = vector3(379.2, 332.45, 103.57), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(365.74, 329.71, 103.16, 165.0), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 59, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 59, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 59, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "global", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop5", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "24/7", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "mp_m_shopkeep_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(1136.04, -982.58, 46.42), -- Marker/Shop position for clients
		targetCoords = vector4(1133.87, -982.43, 46.42, 276.73), -- Coords for the ped to use target
		ownerCoords = vector3(1130.55, -982.31, 46.42), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(1138.32, -973.62, 46.2, 275.4), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 59, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 59, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 59, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "global", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop6", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "24/7", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "mp_m_shopkeep_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(1163.17, -323.28, 69.21), -- Marker/Shop position for clients
		targetCoords = vector4(1165.03, -322.67, 69.21, 99.48), -- Coords for the ped to use target
		ownerCoords = vector3(1160.12, -315.2, 69.21), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(1163.89, -331.39, 68.82, 190.01), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 59, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 59, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 59, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "global", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop7", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "24/7", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "mp_m_shopkeep_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(-1222.74, -906.59, 12.33), -- Marker/Shop position for clients
		targetCoords = vector4(-1221.73, -908.61, 12.33, 34.23), -- Coords for the ped to use target
		ownerCoords = vector3(-1220.41, -911.54, 12.33), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(-1229.65, -896.05, 11.75, 306.23), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 59, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 59, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 59, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "global", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop8", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "24/7", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "mp_m_shopkeep_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(2556.51, 382.39, 108.62), -- Marker/Shop position for clients
		targetCoords = vector4(2556.41, 380.52, 108.62, 353.12), -- Coords for the ped to use target
		ownerCoords = vector3(2549.66, 386.19, 108.62), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(2565.79, 384.65, 108.04, 357.62), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 59, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 59, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 59, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "global", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop9", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "24/7", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "mp_m_shopkeep_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(-2968.16, 391.53, 15.04), -- Marker/Shop position for clients
		targetCoords = vector4(-2966.11, 390.8, 15.04, 86.32), -- Coords for the ped to use target
		ownerCoords = vector3(-2962.92, 390.31, 15.04), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(-2969.68, 401.08, 14.67, 82.93), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 59, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 59, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 59, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "global", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop10", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "24/7", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "mp_m_shopkeep_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(-3040.16, 585.76, 7.91), -- Marker/Shop position for clients
		targetCoords = vector4(-3039.7, 584.04, 7.91, 21.28), -- Coords for the ped to use target
		ownerCoords = vector3(-3047.79, 586.93, 7.91), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(-3039.09, 599.64, 7.21, 290.48), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 59, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 59, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 59, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "global", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop11", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "24/7", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "mp_m_shopkeep_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(-3242.92, 1001.62, 12.83), -- Marker/Shop position for clients
		targetCoords = vector4(-3243.0, 999.65, 12.83, 356.01), -- Coords for the ped to use target
		ownerCoords = vector3(-3249.49, 1005.61, 12.83), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(-3239.53, 994.46, 12.01, 267.52), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 59, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 59, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 59, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "global", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop12", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "24/7", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "mp_m_shopkeep_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(547.57, 2670.41, 42.16), -- Marker/Shop position for clients
		targetCoords = vector4(549.39, 2670.66, 42.16, 100.66), -- Coords for the ped to use target
		ownerCoords = vector3(545.17, 2663.07, 42.16), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(547.9, 2678.0, 41.72, 275.53), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 59, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 59, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 59, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "global", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop13", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "24/7", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "mp_m_shopkeep_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(1165.38, 2709.21, 38.16), -- Marker/Shop position for clients
		targetCoords = vector4(1166.01, 2711.21, 38.16, 180.47), -- Coords for the ped to use target
		ownerCoords = vector3(1166.05, 2714.43, 38.16), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(1161.21, 2696.02, 37.51, 182.78), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 59, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 59, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 59, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "global", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop14", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "24/7", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "mp_m_shopkeep_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(1961.1, 3741.36, 32.34), -- Marker/Shop position for clients
		targetCoords = vector4(1959.42, 3740.42, 32.34, 301.52), -- Coords for the ped to use target
		ownerCoords = vector3(1960.57, 3749.11, 32.34), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(1973.02, 3745.93, 31.85, 211.15), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 59, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 59, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 59, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "global", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop15", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "24/7", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "mp_m_shopkeep_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(2678.08, 3281.05, 55.24), -- Marker/Shop position for clients
		targetCoords = vector4(2677.27, 3279.35, 55.24, 326.56), -- Coords for the ped to use target
		ownerCoords = vector3(2673.8, 3287.57, 55.24), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(2685.01, 3292.36, 55.14, 241.23), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 59, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 59, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 59, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "global", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop16", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "24/7", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "mp_m_shopkeep_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(1698.72, 4924.28, 42.06), -- Marker/Shop position for clients
		targetCoords = vector4(1697.96, 4922.68, 42.06, 325.46), -- Coords for the ped to use target
		ownerCoords = vector3(1706.72, 4920.81, 42.06), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(1711.42, 4941.71, 42.03, 56.02), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 59, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 59, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 59, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "global", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop17", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "24/7", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "mp_m_shopkeep_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(1729.52, 6415.13, 35.04), -- Marker/Shop position for clients
		targetCoords = vector4(1727.85, 6416.03, 35.04, 242.24), -- Coords for the ped to use target
		ownerCoords = vector3(1735.75, 6419.96, 35.04), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(1734.86, 6401.21, 34.76, 154.55), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 59, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 59, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 59, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "global", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop18", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "Ammunation", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "s_m_y_robber_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(21.89, -1106.68, 29.8), -- Marker/Shop position for clients
		targetCoords = vector4(21.81, -1105.25, 29.8, 159.45), -- Coords for the ped to use target
		ownerCoords = vector3(14.86, -1106.6, 29.8), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(-1099.63, -258.39, 37.58, 135.34), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 521, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 521, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 521, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "ammo", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop19", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "Ammunation", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "s_m_y_xmech_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(252.74, -49.62, 69.94), -- Marker/Shop position for clients
		targetCoords = vector4(252.74, -48.63, 69.93, 154.91), -- Coords for the ped to use target
		ownerCoords = vector3(251.74, -49.62, 69.94), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(55.73, -1722.11, 29.2, 52.01), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 566, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 566, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 566, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "ammo", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop20", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "Ammunation", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "s_m_y_xmech_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(1693.11, 3759.99, 34.71), -- Marker/Shop position for clients
		targetCoords = vector4(1691.11, 3759.99, 34.7, 154.91), -- Coords for the ped to use target
		ownerCoords = vector3(1692.11, 3759.99, 34.71), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(55.73, -1722.11, 29.2, 52.01), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 566, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 566, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 566, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "ammo", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop21", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "Ammunation", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "s_m_y_xmech_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(-331.0, 6083.67, 31.45), -- Marker/Shop position for clients
		targetCoords = vector4(-332.0, 6083.67, 31.45, 154.91), -- Coords for the ped to use target
		ownerCoords = vector3(-333.0, 6083.67, 31.45), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(55.73, -1722.11, 29.2, 52.01), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 566, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 566, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 566, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "ammo", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop22", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	-- { 
	-- 	name = "Ammunation", -- Name of the shop
	-- 	currency = "bank", -- Used to buy/sell the business
	-- 	targetNpc = "s_m_y_xmech_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
	-- 	hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
	-- 	coords = vector3(810.27, -2157.72, 29.62), -- Marker/Shop position for clients
	-- 	targetCoords = vector4(811.27, -2157.72, 29.61, 154.91), -- Coords for the ped to use target
	-- 	ownerCoords = vector3(812.27, -2157.72, 29.62), -- Marker/Shop position for owner/employees
	-- 	spawnMissionVehicle = vector4(55.73, -1722.11, 29.2, 52.01), -- Where the vehicles are spawned for the missions
    --     missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
	-- 		vector3(978.86, -1565.49, 30.78),
	-- 		vector3(-104.00, 37.50, 71.48),
	-- 		vector3(-2034.87, -274.73, 23.39)
	-- 	},
	-- 	radius = 1, -- Interaction radius for the markers
	-- 	price = 20000, -- Price of the Shop
	-- 	blip = { blipId = 566, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
	-- 	ownerBlip = { blipId = 566, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
	-- 	buyBlip = { blipId = 566, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
	-- 	marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
	-- 	ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
	-- 	type = "ammo", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
	-- 	id = "shop23", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	-- },
	{ 
		name = "Ammunation", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "s_m_y_xmech_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(-662.38, -934.93, 21.83), -- Marker/Shop position for clients
		targetCoords = vector4(-663.38, -934.94, 21.82, 154.91), -- Coords for the ped to use target
		ownerCoords = vector3(-664.38, -934.93, 21.83), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(55.73, -1722.11, 29.2, 52.01), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 566, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 566, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 566, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "ammo", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop23", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "Smoke Shop", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "s_m_y_xmech_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(-1552.94, -430.66, 35.89), -- Marker/Shop position for clients
		targetCoords = vector4(-1553.94, -430.67, 35.88, 154.91), -- Coords for the ped to use target
		ownerCoords = vector3(-1554.94, -430.66, 35.89), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(55.73, -1722.11, 29.2, 52.01), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 566, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 566, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 566, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "smoke", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop24", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "Smoke Shop", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "s_m_y_xmech_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(-535.6, 41.0, 44.58), -- Marker/Shop position for clients
		targetCoords = vector4(-533.6, 40.99, 44.57, 154.91), -- Coords for the ped to use target
		ownerCoords = vector3(-532.6, 41.0, 44.58), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(55.73, -1722.11, 29.2, 52.01), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 566, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 566, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 566, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "smoke", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop25", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "Smoke Shop", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "s_m_y_xmech_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(191.76, -253.93, 53.97), -- Marker/Shop position for clients
		targetCoords = vector4(192.83, -253.93, 53.97, 154.91), -- Coords for the ped to use target
		ownerCoords = vector3(193.76, -253.93, 53.97), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(55.73, -1722.11, 29.2, 52.01), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 566, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 566, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 566, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "smoke", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop26", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "Phone Shop", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "s_m_y_xmech_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(-21.07, 6478.33, 31.49), -- Marker/Shop position for clients
		targetCoords = vector4(-21.07, 6478.33, 32.49, 230.35), -- Coords for the ped to use target
		ownerCoords = vector3(-21.07, 6478.33, 30.49), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(55.73, -1722.11, 29.2, 52.01), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 566, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 566, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 566, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "electronic", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop27", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "Laundry Card", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "s_m_y_xmech_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(1649.87, 3658.6, 35.02), -- Marker/Shop position for clients
		targetCoords = vector4(1649.87, 3658.6, 33.02, 227.08), -- Coords for the ped to use target
		ownerCoords = vector3(1649.87, 3658.6, 34.02), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(55.73, -1722.11, 29.2, 52.01), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 566, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 566, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 566, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "laundry", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop28", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "Smoke Shop", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "s_m_y_xmech_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(377.87, -828.17, 29.3), -- Marker/Shop position for clients
		targetCoords = vector4(375.32, -826.72, 29.3, 197.06), -- Coords for the ped to use target
		ownerCoords = vector3(380.21, -826.74, 29.3), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(55.73, -1722.11, 29.2, 52.01), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 566, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 566, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 566, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "bb", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop29", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "Black Market", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "s_m_m_highsec_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(591.68, -3276.93, 6.07), -- Marker/Shop position for clients
		targetCoords = vector4(589.8, -3280.79, 6.07, 5.7), -- Coords for the ped to use target
		ownerCoords = vector3(592.53, -3278.85, 6.07), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(55.73, -1722.11, 29.2, 52.01), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 566, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 566, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 566, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "black", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop30", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "Jerk 49", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "s_m_m_highsec_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(467.83, -1681.72, 29.45), -- Marker/Shop position for clients
		targetCoords = vector4(468.95, -1682.64, 29.45, 49.89), -- Coords for the ped to use target
		ownerCoords = vector3(467.38, -1684.46, 29.45), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(452.94, -1670.87, 29.21, 316.33), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 566, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 566, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 566, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "jerk", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop31", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "Luxxx Club", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "s_m_m_highsec_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(-43.5, -1289.86, 20.19), -- Marker/Shop position for clients
		targetCoords = vector4(-43.61, -1291.27, 20.19, 359.71), -- Coords for the ped to use target
		ownerCoords = vector3(-45.78, -1293.47, 20.19), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(452.94, -1670.87, 29.21, 316.33), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 566, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 566, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 566, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "luxxx", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop32", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "Frans House", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "s_m_m_highsec_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(-2731.86, 1274.21, 163.39), -- Marker/Shop position for clients
		targetCoords = vector4(-2733.36, 1276.85, 163.39, 267.28), -- Coords for the ped to use target
		ownerCoords = vector3(-2734.54, 1280.03, 163.39), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(452.94, -1670.87, 29.21, 316.33), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 566, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 566, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 566, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "luxxx", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop33", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "Best Buds", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "s_m_m_highsec_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(374.71, -816.8, 29.3), -- Marker/Shop position for clients
		targetCoords = vector4(374.71, -816.8, 29.3, 267.28), -- Coords for the ped to use target
		ownerCoords = vector3(374.71, -816.8, 30.3), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(452.94, -1670.87, 29.21, 316.33), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 566, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 566, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 566, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "bbb", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop34", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "Pops Pills", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "s_m_m_highsec_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(109.48, 3.85, 67.8), -- Marker/Shop position for clients
		targetCoords = vector4(107.82, 5.39, 67.8, 283.26), -- Coords for the ped to use target
		ownerCoords = vector3(109.48, 3.85, 65.8), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(452.94, -1670.87, 29.21, 316.33), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 566, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 566, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 566, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "pill", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop35", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "Burger Corner", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "s_m_m_highsec_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(1586.25, -2814.13, 36.95), -- Marker/Shop position for clients
		targetCoords = vector4(1585.21, -2813.94, 36.93, 255.19), -- Coords for the ped to use target
		ownerCoords = vector3(1584.43, -2810.67, 36.88), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(452.94, -1670.87, 29.21, 316.33), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 566, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 566, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 566, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "burger", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop36", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "Bridge  24/7", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "s_m_m_highsec_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(2488.67, -3283.9, 49.42), -- Marker/Shop position for clients
		targetCoords = vector4(2487.5, -3283.64, 49.42, 255.72), -- Coords for the ped to use target
		ownerCoords = vector3(2493.49, -3277.59, 49.42), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(452.94, -1670.87, 29.21, 316.33), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 566, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 566, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 566, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "global", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop37", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "Bridge  ammo", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "s_m_m_highsec_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(2523.9, -3293.04, 49.19), -- Marker/Shop position for clients
		targetCoords = vector4(2525.92, -3292.91, 49.19, 133.14), -- Coords for the ped to use target
		ownerCoords = vector3(2519.16, -3293.22, 49.19), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(452.94, -1670.87, 29.21, 316.33), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 566, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 566, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 566, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "ammo", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop38", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{ 
		name = "Dono Store", -- Name of the shop
		currency = "bank", -- Used to buy/sell the business
		targetNpc = "s_m_m_highsec_01", -- The target NPC that will be used to interact with the shop (https://docs.fivem.net/docs/game-references/ped-models/)
		hasOwner = false, -- true = this shop can have a owner and will need maintenance to have stock
		coords = vector3(-13.22, 6484.32, 31.57), -- Marker/Shop position for clients
		targetCoords = vector4(-13.98, 6481.74, 31.57, 40.59), -- Coords for the ped to use target
		ownerCoords = vector3(-12.25, 6487.02, 31.57), -- Marker/Shop position for owner/employees
		spawnMissionVehicle = vector4(452.94, -1670.87, 29.21, 316.33), -- Where the vehicles are spawned for the missions
        missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			vector3(978.86, -1565.49, 30.78),
			vector3(-104.00, 37.50, 71.48),
			vector3(-2034.87, -274.73, 23.39)
		},
		radius = 1, -- Interaction radius for the markers
		price = 20000, -- Price of the Shop
		blip = { blipId = 566, blipColor = 3, blipScale = 0.8, blipText = "24/7" }, -- Blip informations for shop blip
		ownerBlip = { blipId = 566, blipColor = 2, blipScale = 0.8, blipText = "Shop Panel" }, -- Blip informations for shops you own
		buyBlip = { blipId = 566, blipColor = 1, blipScale = 0.8, blipText = "Purchasable Shop" }, -- Blip informations for shop on sale
		marker = { id = 20, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the shop
		ownerMarker = { id = 21, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.5, y = 0.5, z = 0.5 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 }, -- Marker informations for the owning menu
		type = "dono", -- Type of the shop used on the Config.AvailableItems ( must exist on the list )
		id = "shop39", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
}


-------------------------- DISCORD LOGS

Config.BotName = 'ServerName' -- Write the desired bot name

Config.ServerName = 'ServerName' -- Write your server's name

Config.IconURL = '' -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html


Config.BuyBusinessWebhook = true
Config.BuyBusinessWebhookColor = '65280'

Config.SellBusinessWebhook = true
Config.SellBusinessWebhookColor = '16711680'

Config.DepositWebhook = true
Config.DepositWebhookColor = '65280'

Config.WithdrawWebhook = true
Config.WithdrawWebhookColor = '16711680'

Config.HireWebhook = true
Config.HireWebhookColor = '65280'

Config.FireWebhook = true
Config.FireWebhookColor = '16711680'

Config.FireYourselfWebhook = true
Config.FireYourselfWebhookColor = '16711680'

Config.EditEmployeeRankWebhook = true
Config.EditEmployeeRankWebhookColor = '65280'

Config.NewOrderWebhook = true
Config.NewOrderWebhookColor = '65280'

Config.OrderAcceptedWebhook = true
Config.OrderAcceptedWebhookColor = '65280'

Config.OrderCanceledWebhook = true
Config.OrderCanceledWebhookColor = '16711680'

Config.BuyItemWebhook = true
Config.BuyItemWebhookColor = '65280'

Config.ExploitsWebhook = true
Config.ExploitsWebhookColor = '16711680'

-------------------------- LOCALES (DON'T TOUCH)
	
function _okok(id)
	if Locales[Config.Locale][id] then
		return Locales[Config.Locale][id]
	else
		print("The locale '"..id.."' doesn't exist!")
	end
end