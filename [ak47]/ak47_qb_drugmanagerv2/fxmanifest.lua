shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'adamant'
game 'gta5'
description 'Ak47 Drug Manager V2'
version '2.4'

ui_page 'nui/index.html'

files {
    'nui/**/*'
}

shared_scripts {
	"@ox_lib/init.lua",
	'config.lua',
	"modules/**/config.lua",
	'locales/locale.lua',
    'locales/en.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
    "framework/server/*.lua",
    "modules/**/server/*.lua",
    "webhooks.lua",
}

client_scripts {	
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    
    "framework/client/*.lua",
	"modules/**/client/*.lua",
    "customizable/client.lua",
}

dependencies {
    'qb-core',
    'PolyZone',
    'ox_lib',
    'qb-target',
}

escrow_ignore {
	"INSTALL ME FIRST/**/*",
    "config.lua",
    "framework/**/*",
    "modules/**/config.lua",
    "customizable/*",
    "locales/*.lua",
    "webhooks.lua",
}

lua54 'yes'
dependency '/assetpacks'