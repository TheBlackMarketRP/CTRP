shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'

author 'quattro._'
props_author 'fiftyshadesofotaku'
developer 'Dream Development'
description 'Dream Development Barber Shop [SCRIPT][ESX][QB]'
support 'https://discord.gg/aUsykSKtEz'
tebex 'https://dreamdev.tebex.io/'

version '1.0.7'
lua54 'yes'

client_scripts {
    'framework/client/esx.lua',
    'framework/client/qb.lua',
    'framework/client/qbox.lua',
    'client/lib/ox_lib.lua',
    'client/lib/ox_target.lua',
    'client/lib/qb-target.lua',
    'client/main.lua',
    'client/functions.lua',
    'client/editable.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'framework/server/esx.lua',
    'framework/server/qb.lua',
    'framework/server/qbox.lua',
    'server/version-checker.lua',
    'server/main.lua'
}

shared_script {
    '@ox_lib/init.lua',
    'config.lua',
    'locales/*.lua',
    'shared/main.lua'
}

ui_page "html/index.html"

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/img/textureVariation/*.png',
    'html/img/hair/*.png',
    'html/img/length/*.png',
    'html/img/beard/*.png',
    'html/img/icons/*.png',
    'stream/[panel]/dreamdev_props_hairsalon.ytyp'
}

data_file 'DLC_ITYP_REQUEST' 'stream/[panel]/dreamdev_props_hairsalon.ytyp'


escrow_ignore {
    'locales/*.lua',
    'client/editable.lua',
    'config.lua'
}
	
dependencies {
    'oxmysql'
}
dependency '/assetpacks'