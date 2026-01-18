shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Kakarot'
description 'Collection of shell models with exports for creating them'
version '1.2.0'
this_is_a_map 'yes'

client_scripts {
    'client/main.lua',
    'client/optional.lua'
}

files {
    'stream/starter_shells_k4mb1.ytyp'
}

data_file 'DLC_ITYP_REQUEST' 'stream/starter_shells_k4mb1.ytyp'
