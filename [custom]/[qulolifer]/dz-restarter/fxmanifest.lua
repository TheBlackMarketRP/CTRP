shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'

fx_version "cerulean"
game "gta5"

author 'Danzo'
description 'Special Server Restarter | Live Countdown Timer | txAdmin support - Made by Danzo - Discord: https://discord.gg/8nFqCR4xVC'
version '1.0.7'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/main.lua',
}

server_scripts {
	'server/main.lua',
	'server/commands.lua',
}

ui_page 'html/index.html'

files {
	'html/**/**',
}

escrow_ignore {
	'config.lua',
	'server/commands.lua',
}

lua54 'yes'
dependency '/assetpacks'