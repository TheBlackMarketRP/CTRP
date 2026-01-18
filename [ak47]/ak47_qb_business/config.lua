Config = {}
Config.Locale = "en"									
Config.CheckCanCarryItem = false
Config.SocietyInManagement = false --enable if your society is inside qb-management
Config.UseBossMarker = true

Config.format = {
	currency = 'USD',								-- This is the format of the currency, so that your currency sign appears correctly
	location = 'en-US'								-- This is the location of your country, to format the decimal places according to your standard
}

Config.Default = {
	stock = 300,
	price = 500
}

Config.Shop = {} -- Don't touch. Add new shop inside ak47_qb_business/shops

Config.Marker = {
	shop = {
		showmarker = true,
		show3Dtext = true,
		id = 21,
		size = vector3(0.4, 0.4, 0.3),
		color = {r = 255, g = 0, b = 0, a = 100},
	},
	manage = {
		showmarker = true,
		show3Dtext = true,
		id = 22,
		size = vector3(0.4, 0.4, 0.3),
		color = {r = 0, g = 255, b = 0, a = 100},
	},
	stock = {
		showmarker = true,
		show3Dtext = true,
		id = 20,
		size = vector3(0.3, 0.3, 0.2),
		color = {r = 255, g = 255, b = 0, a = 100},
	},
	process = {
		showmarker = true,
		show3Dtext = true,
		id = 24,
		size = vector3(0.3, 0.3, 0.3),
		color = {r = 255, g = 155, b = 0, a = 200},
	},
	work = {
		showmarker = true,
		show3Dtext = true,
		id = 20,
		size = vector3(0.3, 0.3, 0.2),
		color = {r = 255, g = 155, b = 0, a = 200},
	},
	boss = {
		showmarker = true,
		show3Dtext = true,
		id = 22,
		size = vector3(0.4, 0.4, 0.3),
		color = {r = 40, g = 125, b = 181, a = 100},
	}
	
}