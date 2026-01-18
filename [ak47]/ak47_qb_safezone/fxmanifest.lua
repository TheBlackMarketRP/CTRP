shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'adamant'
game 'gta5'
description 'Ak47 Safezone'
author 'MenanAk47'
version '1.3'

client_scripts {
    "@ox_lib/init.lua",
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    
    "config.lua",
    "framework/client/*.lua",
    "modules/**/config.lua",

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
    "modules/**/config.lua",

    "locales/locale.lua",
    "locales/en.lua",

    "utils/server.lua",
    "modules/**/server/*.lua",
}

escrow_ignore {
    "config.lua",
    "modules/**/config.lua",
    "locales/*.lua",
    "framework/**/*",
}

lua54 'yes'

dependencies {
    'PolyZone',
    'qb-core',
    'ox_lib',
}

dependency '/assetpacks'