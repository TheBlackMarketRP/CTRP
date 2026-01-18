shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
-- Written by UnLuckyLust ( © Dreams Weaver 2023-2025 ) | Download Free only at https://UnLuckyLust.tebex.io

fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Dreams Weaver by UnLuckyLust'
description 'WaterMark for FiveM servers'
version '2.0.0'

-- files
ui_page '/nui/watermark.html'
files {
    '/nui/watermark.html',
    '/nui/style.css',
    '/nui/function.js',
    '/nui/logo.png',
}

-- lua
dependency 'ull-essential'
shared_script '/config.lua'
server_script'/lua/server.lua'
client_script '/lua/client.lua'
escrow_ignore '/config.lua'
dependency '/assetpacks'