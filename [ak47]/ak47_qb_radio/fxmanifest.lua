shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'adamant'
game 'gta5'
description "Advanced Radio"
author "MenanAk47"
version "1.0"
lua54 'yes'

shared_scripts {
    'locales/locale.lua',
    'locales/en.lua',
    'config.lua'
}

client_scripts {
	'framework/client/*',
	'customizable/client/*',
	'client/client.lua'
} 

server_scripts {
	'framework/server/*',
	'server/server.lua'
} 

ui_page 'web/index.html'

files {
    'web/**/*',
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
	'pma-voice',
}
dependency '/assetpacks'