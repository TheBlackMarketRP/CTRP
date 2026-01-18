shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'adamant'
games { 'gta5' }

client_scripts {
	"config.lua",
	"client/*.lua",
}

lua54 "yes"

escrow_ignore {
	"config.lua",
	"client/*.lua",
}
dependency '/assetpacks'