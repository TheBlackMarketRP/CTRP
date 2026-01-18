shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
author 'MenanAl47'
description 'A multi-vendor player shop system for FiveM'
version '1.2.1'

ui_page 'web/build/index.html'

files {
    'web/build/index.html',
    'web/build/assets/*'
}

shared_scripts {
    "@ox_lib/init.lua",
    'config.lua',
    'locales/locale.lua',
    'locales/en.lua',
}

client_scripts {
    "framework/client/*.lua",
    'customizable/client/*.lua',
    'client/*.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    "framework/server/*.lua",
    'server/*.lua'
}

dependencies {
    'qb-core',
    'ox_lib',
}

escrow_ignore {
    "INSTALL ME FIRST/**/*",
    "framework/**/*",
    "customizable/**/*",
    "config.lua",
    "locales/*.lua",
}

lua54 'yes'

dependency '/assetpacks'