fx_version 'adamant'
game 'gta5'
description "QB Advanced Farming"
author "MenanAk47"
version "1.1"
lua54 'yes'

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua',
	'locales/locale.lua',
	'locales/en.lua',
}

server_scripts {
	"framework/server/*.lua",
	'server/main.lua',
	'server/dealer.lua',
	'server/shop.lua',

	'locales/locale.lua',
	'locales/en.lua',
}

client_scripts {
	'@PolyZone/client.lua',
	"framework/client/*.lua",
	"customizable/client/*.lua",
	'client/main.lua',
	'client/dealer.lua',
	'client/shop.lua',
}

escrow_ignore {
	"INSTALL ME FIRST/**/*",
	"customizable/**/*",
	"framework/**/*",
    'locales/*.lua',
    'config.lua',
}

dependencies {
	'qb-core',
	'PolyZone',
	'ox_lib',
}
dependency '/assetpacks'