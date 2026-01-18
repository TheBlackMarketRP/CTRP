fx_version 'cerulean'
game 'gta5'
description 'Fishing'
author "MenanAk47"
version '1.2'

shared_scripts {
    '@ox_lib/init.lua',
    'locales/locale.lua',
    'locales/en.lua',
    'config.lua'
}

client_scripts {
    'framework/client/*',
    'customizable/client/*',
    'client/client.lua',
}

server_scripts {
    'framework/server/*',
    'server/server.lua',
}

ui_page 'web/index.html'

files {
    'web/**/*',
}

escrow_ignore {
    "INSTALL ME FIRST/**/*",
    "customizable/**/*",
    "framework/**/*",
    'locales/*.lua',
    'config.lua',
}

dependencies {
    'qb-core',
    'ox_lib',
}

lua54 'yes'
dependency '/assetpacks'