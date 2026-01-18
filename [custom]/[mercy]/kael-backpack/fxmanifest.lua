shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
games { 'gta5' }

author "Kael"
description 'Backpack system!'

shared_scripts {
     '@qb-core/shared/locale.lua',
     'config.lua',
     'shared/shared.lua'
}

client_scripts {
     'client/client_main.lua'
}

server_script {
     '@oxmysql/lib/MySQL.lua',
     'server/server_main.lua'
}

dependency 'oxmysql'

lua54 'yes'
