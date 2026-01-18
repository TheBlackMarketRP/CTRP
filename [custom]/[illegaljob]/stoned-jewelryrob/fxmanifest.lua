shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'

author 'Loureiro#0111'

description 'Jewelry Robbery - Stoned Scripts'

version '2.7'

shared_scripts {
	'config/clconfig.lua',
    'config/config.lua',
	'locales/locale.lua',
    'locales/translations/*.lua'

}

server_scripts {
	'config/svconfig.lua',
	'server/server.lua',

}

client_scripts {
	'config/clconfig.lua',
	'client/client.lua'
}

escrow_ignore {
    'config/config.lua',
	'config/clconfig.lua',
	'config/svconfig.lua',
    'locales/translations/*.lua'
}

lua54 'yes'
dependency '/assetpacks'