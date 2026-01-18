shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
author 'MenanAk47'
description 'Advanced VIP Shop'
version '1.4'

ui_page 'web/build/index.html'
--ui_page 'http://localhost:5173'

files {
    'web/build/index.html',
    'web/build/**/*',
}

shared_scripts {
    '@ox_lib/init.lua',
    'locales/locale.lua',
    'locales/en.lua',
    'config.lua'
}


server_scripts {
    'config-server.lua',
    '@mysql-async/lib/MySQL.lua',
    'framework/server/*',
    'config.lua',
    'customizable/server/*.lua',
    'server/server.lua',
}

client_scripts {
    'framework/client/*',
    'config.lua',
    'customizable/client/*.lua',
    'client/client.lua',
} 

escrow_ignore {
    "INSTALL ME FIRST/**/*",
    "config*.lua",
    "locales/*.lua",
    "framework/**/*",
    "customizable/**/*",
}

lua54 'yes'

dependencies {
    'qb-core',
    'ox_lib',
}

dependency '/assetpacks'