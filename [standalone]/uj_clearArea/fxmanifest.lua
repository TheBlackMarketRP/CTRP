shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'bodacious'
games { 'gta5' }
lua54 "yes"

client_scripts {
	"client.lua",
}

escrow_ignore {
  'client.lua',
}
dependency '/assetpacks'