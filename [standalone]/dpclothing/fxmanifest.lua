shared_script '@mercyac/shared_fg-obfuscated.lua'
shared_script '@mercyac/ai_module_fg-obfuscated.lua'
shared_script '@mercyac/protection_shared-obfuscated.lua'
fx_version 'bodacious'
game 'gta5'
author 'dullpear'
version '1.0.3'
description 'dpClothing+'

client_scripts {
	'Client/Functions.lua', 		-- Global Functions / Events / Debug and Locale start.
	'Locale/*.lua', 				-- Locales.
	'Client/Config.lua',			-- Configuration.
	'Client/Variations.lua',		-- Variants, this is where you wanan change stuff around most likely.
	'Client/Clothing.lua',
	'Client/GUI.lua',				-- The GUI.
}