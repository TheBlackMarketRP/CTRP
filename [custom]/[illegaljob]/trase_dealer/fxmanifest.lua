shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Trase'
description 'A FiveM script allowing players to sell drugs.'
version '1.0.7'

shared_scripts { '@ox_lib/init.lua', 'configuration/config.lua' }

client_scripts { '@PolyZone/client.lua', '@PolyZone/CircleZone.lua', 'frameworks/**/client.lua', 'client/*.lua', }

server_scripts {
    '@mysql-async/lib/MySQL.lua', -- Required
    'configuration/server.lua',
    'frameworks/**/server.lua', 
    'server/*.lua',
}

escrow_ignore { 
    'configuration/*.lua',
    'frameworks/**/*.lua',
    'client/*.lua',
    'server/*.lua',
}
dependency '/assetpacks'