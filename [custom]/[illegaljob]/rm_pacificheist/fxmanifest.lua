shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_scripts {
    'config.lua'
}

server_scripts {
	'server.lua'
}

client_scripts {
	'client.lua',
    'drilling.lua',
    'laptop.lua',
    'editable_client.lua',
}

escrow_ignore {
    '[items]',
    'client.lua',
    'drilling.lua',
    'laptop.lua',
    'config.lua',
    'editable_client.lua',
    'server.lua',
}
dependency '/assetpacks'