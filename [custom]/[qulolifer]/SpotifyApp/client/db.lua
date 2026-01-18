CreateThread(function()
	TriggerServerEvent('spotify:server:fetchLibrary')
end)

RegisterNetEvent('spotify:client:retrunlibrary', function(libaryData)
	libary = libaryData
end)

CreateThread(function()
    while true do
        TriggerServerEvent('spotify:server:saveLibary', libary)
        Wait(60000) -- // Saves every minute
    end
end)