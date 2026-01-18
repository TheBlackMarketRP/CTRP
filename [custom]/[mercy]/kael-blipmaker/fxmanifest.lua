fx_version 'cerulean'

games { 'gta5' }

author 'Kael'
description 'Kael Blip Maker'
version '1.0.1'

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

lua54 'yes'


