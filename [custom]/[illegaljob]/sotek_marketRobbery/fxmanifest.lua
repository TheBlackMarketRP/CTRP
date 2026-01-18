shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'

lua54 'on'

escrow_ignore {
    "config.lua",
    "server/*.lua",
    "client/**/*.lua",

}
client_scripts {
    "config.lua",
    "client/modules/handler/module_handler.lua",
    "client/modules/module/native_ui.lua",
    "client/modules/module/*.lua",
    "client/function/*.lua",
    "client/event/*.lua",
    "client/framework/*.lua"

}

server_scripts {
    "config.lua",
    "server/cb.lua",
    "server/main.lua",
    "server/framework.lua"

}

dependency '/assetpacks'