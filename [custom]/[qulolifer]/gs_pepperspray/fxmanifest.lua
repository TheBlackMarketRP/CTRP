shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
games { 'gta5' }

author 'Eviate'
description 'Pepperspray Script'
version '1.1.3'

lua54 'yes'

files {
    'weapon_v2/weaponarchetypes.meta',
    'weapon_v2/weaponanimations.meta',
    'weapon_v2/weapons.meta',
}

data_file 'WEAPON_METADATA_FILE' 'weapon_v2/weaponarchetypes.meta'
data_file 'WEAPON_ANIMATIONS_FILE' 'weapon_v2/weaponanimations.meta'
data_file 'WEAPONINFO_FILE' 'weapon_v2/weapons.meta'

shared_scripts {
    'config.lua',
}

client_scripts {
    'bridge/cl_bridge.lua',
    'client/cl_*.lua',
}

server_scripts {
    'bridge/sv_bridge.lua',
    'server/sv_*.lua',
}

escrow_ignore { '**/*' }

dependency '/assetpacks'