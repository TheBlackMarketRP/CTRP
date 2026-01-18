shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'

author 'fiftyshadesofotaku & quattro._'
developer 'Dream Development'
description 'Dream Development Nails Shop V2 [SCRIPT][ESX][QB][QBOX]'
support 'https://discord.gg/aUsykSKtEz'
tebex 'https://dreamdev.tebex.io/'

version '1.6.0'
lua54 'yes'

shared_script {
    '@ox_lib/init.lua', --DISABLE IF U DON'T USE OX_LIB
    'config.lua',
    'locales/*.lua',
    'shared/main.lua'
}

client_scripts {
    'client/lib/dd/main.lua',
    'client/lib/dd/callback.lua',
    'client/lib/dd/showHelpNotification.lua',
    'framework/client/esx.lua',
    'framework/client/qbox.lua',
    'framework/client/qb.lua',
    'client/lib/ox_lib.lua',
    'client/lib/ox_target.lua',
    'client/lib/qb-target.lua',
    'client/functions.lua',
    'client/main.lua',
    'client/editable.lua'
}

server_scripts {
    'server/lib/dd/main.lua',
    'server/lib/dd/callback.lua',
    '@oxmysql/lib/MySQL.lua',
    'framework/server/esx.lua',
    'framework/server/qbox.lua',
    'framework/server/qb.lua',
    'server/version-checker.lua',
    'server/main.lua'
}

ui_page "html/index.html"

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/img/*.png',
    'stream/[base_nails]/dd-basic_script_nails.ytyp'
}

data_file 'DLC_ITYP_REQUEST' 'stream/[base_nails]/dd-basic_script_nails.ytyp'

escrow_ignore {
    'locales/*.lua',
    'client/editable.lua',
    'config.lua'
}
	
dependencies {
    'oxmysql'
}
dependency '/assetpacks'