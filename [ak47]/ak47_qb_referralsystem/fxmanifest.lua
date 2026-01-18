shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'adamant'
game 'gta5'
description "Advanced Referral System"
author "MenanAk47"
version "1.0"

ui_page 'web/index.html'

files {
    'web/**/*'
}

shared_scripts {
	"@ox_lib/init.lua",
	'config.lua',
    'locales/locale.lua',
    'locales/en.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	"framework/server/*.lua",
	'server/server.lua',
	'webhook.lua',
}

client_scripts {
	'config.lua',
	"framework/client/*.lua",
	'client/client.lua',
}

escrow_ignore {
	'INSTALL ME FIRST/**/*',
    'locales/*',
    'config.lua',
    "framework/**/*",
}

dependencies {
	'qb-core',
	'ox_lib',
}

lua54 'yes'

dependency '/assetpacks'