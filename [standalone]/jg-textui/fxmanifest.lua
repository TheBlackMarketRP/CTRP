shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version "cerulean"
game "gta5"

description "Simple text UI library"
version "1.0"
author "JG Scripts"

client_script "client.lua"

ui_page "web/index.html"

files {"web/*"}

escrow_ignore {"**/*"}

lua54 "yes"

dependency '/assetpacks'