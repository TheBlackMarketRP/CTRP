shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'

description 'Gang weapon and melee control system'
author 'L.cts'
version '1.2.0'

shared_script 'shared/config.lua'
shared_script '@qb-core/shared/locale.lua'

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}
