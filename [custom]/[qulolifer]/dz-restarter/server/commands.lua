
-- Default script command to start and cancel manual server restart
-- You can change them to your framework permission level to use this two commands

RegisterCommand('startrestart', function(source, args)
	local src = source
	local Timer = tonumber(args[1]) -- countdown timer in minutes
	if (Timer ~= nil) and (Timer > 0) then
		StartServerRestart(Timer) -- function to start a manual server restart
	end
end, true)

RegisterCommand('cancelrestart', function(source, args)
	local src = source
	CancelServerRestart() -- function to cancel the manual server restart
end, true)
