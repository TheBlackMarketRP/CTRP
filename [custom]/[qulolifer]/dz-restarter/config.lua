
Config = {}

--------------------------------------------------------------------------
------------------------ txAdmin Scheduled Restart -----------------------

Config.ScheduledRestartTimer = 30 -- In minutes - Min 1 / Max 30

--------------------------------------------------------------------------
--------------------------- Last Seconds Storm ---------------------------

Config.EnableStorm = true -- Either enable or disable the Weather change and the thunder strike
Config.StormDuration = 60 -- In seconds, The Storm starts in the last 60 seconds of server restart timer

--------------------------------------------------------------------------
------------------------- Thunder Effect & Sound -------------------------

Config.EnableThunder = true -- Either enable or disable the tunder strikes and earthquakes
Config.ThunderInterval = 10 -- In seconds, Thunder strike each 10 seconds in default
Config.EnableThunderSound = true -- Either enable or disable tunder sound effects
Config.ThunderSoundVolume = 80 -- Thunder Sound Volume, from 0 to 100

Config.EnablePlayerFall = true -- Either enable or disable the falling of all server players
Config.EnableNPCsFallAndFlee = true -- Either enable or disable the falling and fleeing effect of your server's NPCs

-- Note: The Storm must enabled for The Thunder effect & sound to work, also for players and NPSs to fall

--------------------------------------------------------------------------
----------------------------- Emergency Sound ----------------------------

Config.EnableEmergencySound = true -- Either enable or disable the emergency sound
Config.EmergencySoundVolume = 80 -- Thunder Sound Volume, from 0 to 100

-- The Emergency Sound starts when the storm starts and the weather changes
-- You can change the "emergency.ogg" emergency sound file. Location: "dz-restarter/html/sound/emergency.ogg"
-- Note: The Storm must enabled for the emergency sound to work

--------------------------------------------------------------------------
------------------------ Timer UI Screen Position ------------------------

Config.TimerScreenPos = "centerleft" --  Timer Screen Positions: "topcenter" | "topleft" | "topright" | "bottomcenter" | "bottomleft" | "bottomright" | "centercenter" | "centerleft" | "centerright"

Config.AllowShowHideUI = true -- For players who wants to hide the ui from screen. Set it to "true" if you want the Command and the Key to work
Config.ShowHideCommand = 'showHideRestarterUi' -- Show / Hide UI Command
Config.ShowHideUIKeyMapping = 'F10' -- Show / Hide UI Key

--------------------------------------------------------------------------
------------------------- Storm Weather Funtions -------------------------

Config.StormWeather = function() -- Triggered function to change the weather when the storm hits
	-- Server side "thunder storm weather" event or export or function, QBCore and Execute Command example
	
	-- Pre-configured Examples:
	-- ExecuteCommand('weather thunder') -- Server side execute command example (works with vSync)
	-- exports['qb-weathersync']:setWeather('thunder') -- QBCore weathersync script export example
end

Config.ClearWeather = function() -- Triggered function to reset the weather to default status
	-- Server side "clear weather" event or export or function or command, QBCore and Execute Command example
	
	-- Pre-configured Examples:
	-- ExecuteCommand('weather clear') -- Server side execute command example (works with vSync)
	-- exports['qb-weathersync']:setWeather('clear') -- QBCore weathersync script export example
end

--------------------------------------------------------------------------
------------------------------ Translations ------------------------------

Config.Translations = {
	['auto_restart'] = 'Auto-Restart',
	['auto_restart_canceled'] = 'Auto-Restart Cenceled',
	
	['server_restart'] = 'Server Restart',
	['server_restart_canceled'] = 'Server Restart Cenceled',
	
	['restart_timer_hidden'] = 'Restart Timer is Hidden',
	
	['kick_message'] = 'Server Restart 😊',
}

--------------------------------------------------------------------------
------------------------------ Console Debug -----------------------------

Config.Debug = true