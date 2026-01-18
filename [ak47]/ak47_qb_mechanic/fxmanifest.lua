shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
author 'MenanAk47'
description 'Advanced Mechanic'
version '1.4'

files {
    "data/carcols_gen9.meta",
    "data/carmodcols_gen9.meta",
    "data/carmodcols.ymt",
    "stream/vehicle_paint_ramps.ytd"
}

data_file "CARCOLS_GEN9_FILE" "data/carcols_gen9.meta"
data_file "CARMODCOLS_GEN9_FILE" "data/carmodcols_gen9.meta"
data_file "FIVEM_LOVES_YOU_447B37BE29496FA0" "data/carmodcols.ymt"
data_file 'DLC_ITYP_REQUEST' 'stream/mechanic_props.ytyp'

shared_scripts {
    "@ox_lib/init.lua",
    "locales/locale.lua",
    "locales/en.lua",
    "config.lua",
    "modules/**/config.lua",
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "framework/server/*.lua",
    "customizable/server/*.lua",
    "modules/**/server/*.lua",
} 

client_scripts {
    "framework/client/*.lua",
    "customizable/client/*.lua",
    "modules/**/client/*.lua",
} 

ui_page 'web/build/index.html'

files {
    'web/build/index.html',
    'web/build/**/*'
}

escrow_ignore {
    "INSTALL ME FIRST/**/*",
    "config.lua",
    "locales/*.lua",
    "modules/**/config.lua",
    "framework/**/*",
    "customizable/**/*",
}

lua54 'yes'

dependencies {
    'qb-core',
    'qb-target',
    'ox_lib',
}
dependency '/assetpacks'