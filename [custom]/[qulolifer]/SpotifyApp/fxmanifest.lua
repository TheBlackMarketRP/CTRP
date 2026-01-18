shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'discord.gg/svdden'

version '1.0.0'

shared_scripts {
	'config.lua'
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/*.lua'
}

ui_page 'html/index.html'

files {
	'html/*',
	'icon/*'
}

escrow_ignore {
	'config.lua',
	'client/db.lua',
	'server/db.lua',
}
dependency '/assetpacks'