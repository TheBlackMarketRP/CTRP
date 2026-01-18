shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'

game 'gta5'

author 'okok#3488'
description 'okokNotify'

ui_page 'web/ui.html'

files {
	'web/*.*'
}

client_scripts {
	'config.lua',
	'client.lua'
}

lua54 'yes'

escrow_ignore {
	'config.lua',
}
dependency '/assetpacks'