
--███╗░░██╗░█████╗░████████╗██╗███████╗██╗░█████╗░░█████╗░████████╗██╗░█████╗░███╗░░██╗
--████╗░██║██╔══██╗╚══██╔══╝██║██╔════╝██║██╔══██╗██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║
--██╔██╗██║██║░░██║░░░██║░░░██║█████╗░░██║██║░░╚═╝███████║░░░██║░░░██║██║░░██║██╔██╗██║
--██║╚████║██║░░██║░░░██║░░░██║██╔══╝░░██║██║░░██╗██╔══██║░░░██║░░░██║██║░░██║██║╚████║
--██║░╚███║╚█████╔╝░░░██║░░░██║██║░░░░░██║╚█████╔╝██║░░██║░░░██║░░░██║╚█████╔╝██║░╚███║
--╚═╝░░╚══╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝

function SendTextMessagee(msg, type)
	--exports['mythic_notify']:SendAlert('inform', msg)

	ESX.ShowNotification(msg)
	--TriggerEvent('codem-notification:Create', msg, 'info', nil, 5000)
	--exports['Roda_Notifications']:showNotify(msg, 'info', 5000)
	--exports['okokNotify']:Alert("Jewelry Robbery'", msg, 5000, type)
	--exports['mythic_notify']:SendAlert('inform', msg)
	--QBCore.Functions.Notify(msg, 'success')
end

--██████╗ ██╗     ██╗██████╗ ███████╗     █████╗ ███╗   ██╗██████╗      ██████╗ █████╗ ██╗     ██╗     ███████╗██╗ ██████╗ ███╗   ██╗
--██╔══██╗██║     ██║██╔══██╗██╔════╝    ██╔══██╗████╗  ██║██╔══██╗    ██╔════╝██╔══██╗██║     ██║     ██╔════╝██║██╔════╝ ████╗  ██║
--██████╔╝██║     ██║██████╔╝███████╗    ███████║██╔██╗ ██║██║  ██║    ██║     ███████║██║     ██║     ███████╗██║██║  ███╗██╔██╗ ██║
--██╔══██╗██║     ██║██╔═══╝ ╚════██║    ██╔══██║██║╚██╗██║██║  ██║    ██║     ██╔══██║██║     ██║     ╚════██║██║██║   ██║██║╚██╗██║
--██████╔╝███████╗██║██║     ███████║    ██║  ██║██║ ╚████║██████╔╝    ╚██████╗██║  ██║███████╗███████╗███████║██║╚██████╔╝██║ ╚████║
--╚═════╝ ╚══════╝╚═╝╚═╝     ╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝      ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝      

function PoliceCall()
	if Config.Dispatch.Type == 'standalone' then
		TriggerServerEvent('stoned-vangrob:PoliceAlertStandalone')
	elseif Config.Dispatch.Type == 'linden_alerts' then
		print("insert your linden trigger / export")
	elseif Config.Dispatch.Type == 'qb_defaultalert' then
    	TriggerServerEvent('police:server:policeAlert', 'Attempted Jewelry Robbery')
	elseif Config.Dispatch.Type == 'rcore_dispatch' then
		local data = {
            code = '10-64', 
            default_priority = 'high', -- 'low' | 'medium' | 'high' -> The alert priority
            coords = coords, -- vector3 -> The coords of the alert
            job = 'police', -- string | table -> The job, for example 'police' or a table {'police', 'ambulance'}
            text = 'Jewelry Robbery', -- string -> The alert text
            type = 'alerts', -- alerts | shop_robbery | car_robbery | bank_robbery -> The alert type to track stats
            blip_time = 5, -- number (optional) -> The time until the blip fades
            blip = { -- Blip table (optional)
                sprite = 431, -- number -> The blip sprite: Find them here (https://docs.fivem.net/docs/game-references/blips/#blips)
                colour = 3, -- number -> The blip colour: Find them here (https://docs.fivem.net/docs/game-references/blips/#blip-colors)
                scale = 1.2, -- number -> The blip scale
                text = 'Jewelry Robbery', -- number (optional) -> The blip text
                flashes = false, -- boolean (optional) -> Make the blip flash
                radius = 0, -- number (optional) -> Create a radius blip instead of a normal one
            }
        }
        TriggerServerEvent('rcore_dispatch:server:sendAlert', data)
    elseif Config.Dispatch.Type == 'cd_dispatch' then
		local data = exports['cd_dispatch']:GetPlayerInfo()
		TriggerServerEvent('cd_dispatch:AddNotification', {
			job_table = {'police', "sheriff" }, 
			coords = data.coords,
			title = '10-15 - Jewelry Robbery',
			message = 'A '..data.sex..' Robbing Jewelry at '..data.street, 
			flash = 0,
			unique_id = data.unique_id,
			sound = 1,
			blip = {
				sprite = Config.Dispatch.BlipSprite, 
				scale = Config.Dispatch.BlipScale, 
				colour = Config.Dispatch.BlipColor,
				flashes = false, 
				text = '911 - Jewelry Robbery',
				time = 5,
				radius = 0,
			}
		})
	end
end

function ProgressBarFunc()
    Anim = true
	if Config.ProgressBar == 'progressbar' then
		exports['progressbar']:Progress({
			name = "jewel_rob",
			duration = 2000,
			label = ("Stealing"),
			useWhileDead = false,
			canCancel = true,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			},
		}, function(status)
			if not status then

			end
		end)
	elseif Config.ProgressBar == 'mythic_progbar' then
		TriggerEvent("mythic_progbar:client:progress", {
			name = "jewel_rob",
			duration = 2000,
			label = ("Stealing"),
			useWhileDead = false,
			canCancel = true,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			},
		}, function(status)
			if not status then

			end
		end)
	elseif Config.ProgressBar == 'ox_lib' then
		---
	elseif Config.ProgressBar == 'disable' then
		-- disable
	end

end

function checkArma()
    local ped = PlayerPedId()
    local selectedWeapon = GetSelectedPedWeapon(ped)
    local weaponHash = GetHashKey(selectedWeapon)
    for _, weapon in ipairs(Config.WeaponsBreakShowcase) do
        if weaponHash == GetHashKey(weapon) then
            return true
        end
    end
    return false  -- Se nenhum correspondente foi encontrado, retornamos false
end