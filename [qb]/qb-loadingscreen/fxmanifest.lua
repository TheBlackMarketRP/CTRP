shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author '_dpmn'
description 'Fivescripts Standard Loading Screen'

files {
    'web/script.js',
    'web/style.css',
    'web/index.html',
    'web/assets/*.*',
    'web/assets/**/*.*'
}

client_script 'client.lua'

loadscreen 'web/index.html'
