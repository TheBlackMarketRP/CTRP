shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
author "MenanAk47"
version "1.0"

client_scripts {
	'config.lua',
	'client/main.lua',
}

server_script 'server/main.lua'

escrow_ignore {
    'config.lua',
}

lua54 'yes'
dependency '/assetpacks'