shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
lua54 'yes'
games { 'gta5' }
author 'Kael Scripts'
description 'A Purge Script'
version '1.0.0'

client_scripts {
    'client/**.lua',
}

server_scripts {
    'server/**.lua',
}

shared_scripts {
    'config.lua',
}

files {
    'web/app.html',
    'web/app.js',
    'web/style.css',
}


ui_page {'web/app.html'}