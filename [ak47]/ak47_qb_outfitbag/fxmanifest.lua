shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'adamant'
game 'gta5'
description 'Ak47 Outfit Bag'
author 'MenanAk47'
version '1.1'

client_scripts {
    "@ox_lib/init.lua",
    
    "config.lua",
    "framework/client/*.lua",
    "customizable/client/**/*.lua",

    "locales/locale.lua",
    "locales/en.lua",

    "utils/client.lua",
    "modules/**/client/*.lua",
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "@ox_lib/init.lua",
    "config.lua",
    "framework/server/*.lua",
    "customizable/server/**/*.lua",

    "locales/locale.lua",
    "locales/en.lua",

    "utils/server.lua",
    "modules/**/server/*.lua",
}

escrow_ignore {
    "INSTALL ME FIRST/**/*",
    "config.lua",
    "locales/*.lua",
    "framework/**/*",
    "customizable/**/*",
    "utils/**/*",
}

lua54 'yes'

dependencies {
    'qb-core',
    'ox_lib',
    'qb-target',
}

dependency '/assetpacks'