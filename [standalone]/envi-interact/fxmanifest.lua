shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'

author 'Envi-Scripts'
description 'Interaction Library'
version '1.2.6'

game 'gta5'
lua54 'yes'
 
client_scripts {
	'client/pedPersonality.lua',
	'client/client.lua',
}
 
shared_scripts {
	'config.lua',
	'@ox_lib/init.lua'
}

files {
    'ui/**'
}

ui_page 'ui/index.html'