shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'adamant'
game 'gta5'
author "MenanAk47"
description "Hookah Lounge Job V2"
version "2.3"

ui_page('html/index.html')

files({
    'html/**/*'
})

shared_scripts {
    "@ox_lib/init.lua",
    'config.lua',
    'config-bar.lua',
    'locales/locale.lua',
    'locales/en.lua',
}

client_scripts {
    'client/utils.lua',
    'client/job.lua',
    'client/heater.lua',
    'client/main.lua',
    'client/target.lua',
    'client/bar.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/utils.lua',
    'server/job.lua',
    'server/heater.lua',
    'server/main.lua',
    'server/bar.lua',
}

escrow_ignore {
    'locales/*.lua',
    'config*.lua',
    'server/utils.lua',
    'client/utils.lua',
    'INSTALL ME FIRST/**/*',
}

lua54 'yes'

dependencies {
    'qb-core',
    'qb-management',
    'ox_lib',
    '/server:5181', -- requires at least server build 5181
}

dependency '/assetpacks'