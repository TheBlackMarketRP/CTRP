shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
games { 'gta5' }

author 'Eviate'
description 'Wheel Clamp Script'
version '1.0.1'

lua54 'yes'

shared_scripts {
	'config.lua',
}

client_scripts {
	'bridge/cl_bridge.lua',
	'client/cl_main.lua',
}

server_scripts {
	'bridge/sv_bridge.lua',
	'server/sv_main.lua',
}

escrow_ignore { '**/*' }

files {
	'stream/clamp.ytyp',
}

data_file 'DLC_ITYP_REQUEST' 'stream/clamp.ytyp'

dependency '/assetpacks'