shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'

games { 'gta5' }

author 'Kael Script'
description 'The Black Market Fraud Script'
version '1.0.1'

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

shared_scripts {
    'config.lua',
}

files {
    'state_images/*.png',
}


lua54 'yes'


