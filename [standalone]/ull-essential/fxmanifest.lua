shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
-- Written by UnLuckyLust ( © Dreams Weaver 2023 ) | Purchase only at https://UnLuckyLust.tebex.io

fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'ull-essential'
author 'Dreams Weaver by UnLuckyLust'
description 'Essential functions for FiveM Scripts'
version '1.1.0'

ui_page '/nui/essential.html'
files {
    '/nui/essential.html',
    '/nui/essential.css',
    '/nui/essential.js',
    '/nui/game_functions/*.js',
    '/nui/sound_functions/*.js',
    '/nui/sounds/*.ogg',
    '/nui/sounds/*.mp3',
    '/nui/images/*.png',
    '/nui/videos/*.mp4',
}
shared_script {
    '/config/*.lua',
    '/locales/*.lua',
	'/lua/shared.lua',
}
server_script '/lua/server.lua'
client_scripts {
    '/lua/client.lua',
    '/lua/sounds.lua',
}
escrow_ignore {
    '/config/*.lua',
    '/locales/*.lua',
}
dependency '/assetpacks'