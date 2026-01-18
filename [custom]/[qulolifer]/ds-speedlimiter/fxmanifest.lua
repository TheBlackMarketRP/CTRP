shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
games { 'gta5' }

author 'itz_ceh'
description 'Speed Limiter for all vehicles | DS'
version '1.0.0'

ui_page 'html/index.html'

client_scripts {
    'client/*.lua'
}

shared_scripts {
    'config.lua',
}

files {
    'html/index.html',
    'html/style.css',     
    'html/scripts.js',     
}
