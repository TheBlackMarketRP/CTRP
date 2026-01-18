shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'

author 'quattro._ && fiftyshadesofotaku'
description 'Dream Development Nails Shop V2 EFFECTS LUCID DLC [SCRIPT][ESX][QB]'
support 'https://discord.gg/aUsykSKtEz'
lua54 'yes'

client_scripts {
    'client/data.lua',
    'client/main.lua',
}

files {
    'stream/nailshopv2-dlc-effects01.ytyp'
}

data_file 'DLC_ITYP_REQUEST' 'stream/nailshopv2-dlc-effects01.ytyp'
	
dependencies {
    'dd-nailshopV2'
}
dependency '/assetpacks'