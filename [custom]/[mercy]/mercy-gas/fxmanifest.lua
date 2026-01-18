shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'

games { 'gta5' }

author 'Kael Script'
description 'Black Market Gas'
version '1.0.1'

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

shared_scripts {
    'config.lua',
}

files {
    'ui/index.html',
    'ui/styles.css',
    'ui/scripts.js',
}


ui_page {'ui/index.html'}

lua54 'yes'


