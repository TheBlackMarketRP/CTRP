shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Kakarot'
description 'Door management system allowing players to lock and unlock doors'
version '2.0.0'

ui_page 'html/index.html'

shared_scripts {
    'config.lua',
    'configs/*.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}

server_script 'server/main.lua'
client_script 'client/main.lua'

files {
    'html/*.html',
    'html/*.js',
    'html/*.css',
    'html/sounds/*.ogg',
}
