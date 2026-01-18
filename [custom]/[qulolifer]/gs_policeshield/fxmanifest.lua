shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
games { 'gta5' }

author 'Gamzky'
description 'Police Shield Script'
version '1.0.8'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts {
    'bridge/cl_bridge.lua',
    'client/cl_functions.lua',
    'client/cl_main.lua',
}

server_scripts {
    'bridge/sv_bridge.lua',
    'server/sv_main.lua',
}

escrow_ignore { '**/*' }

-- Custom model included for collision improvements and LOD
files {
    'stream/prop_ballistic_shield_custom.ytyp',
    'meta/weaponanimations.meta',
}

data_file 'DLC_ITYP_REQUEST' 'stream/prop_ballistic_shield_custom.ytyp'
data_file 'WEAPON_ANIMATIONS_FILE' 'meta/weaponanimations.meta'

dependency '/assetpacks'