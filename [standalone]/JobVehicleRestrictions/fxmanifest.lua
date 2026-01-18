shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'adamant'
game 'gta5'

name 'JobVehicleRestrictions'
description 'Restricts vehicles to specified jobs'
author 'NSS'
version '1.0.5'
lua54 'yes'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client.lua'
}

dependency 'qb-core'

escrow_ignore {
    'config.lua',
    'client.lua'
}
dependency '/assetpacks'