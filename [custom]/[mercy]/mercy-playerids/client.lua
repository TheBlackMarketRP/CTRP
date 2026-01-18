local QBCore = exports['qb-core']:GetCoreObject()
local DisplayData = nil



fontId = RegisterFontId('Arb')
DrawText3D = function(x, y, z, text)
	SetTextScale(0.69, 0.69)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(243, 0, 0, 243)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

GetClosestPlayer = function()
    local closestPlayers = QBCore.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(GetPlayerPed(-1))

    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, coords.x, coords.y, coords.z, true)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
	end

	return closestPlayer, closestDistance
end

GetPlayers = function()
    local players = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        if DoesEntityExist(ped) then
            table.insert(players, player)
        end
    end
    return players
end

GetPlayersFromCoords = function(coords, distance)
    local players = GetPlayers()
    local closePlayers = {}

    if coords == nil then
		coords = GetEntityCoords(GetPlayerPed(-1))
    end
    if distance == nil then
        distance = 5.0
    end
    for _, player in pairs(players) do
		local target = GetPlayerPed(player)
		local targetCoords = GetEntityCoords(target)
		local targetdistance = GetDistanceBetweenCoords(targetCoords, coords.x, coords.y, coords.z, true)
		if targetdistance <= distance then
			table.insert(closePlayers, player)
		end
    end
    
    return closePlayers
end


function GetCurrentPlayers()
    local TotalPlayers = 0

    for _, player in ipairs(GetActivePlayers()) do
        TotalPlayers = TotalPlayers + 1
    end

    return TotalPlayers
end


RegisterKeyMapping('+scoreboard', 'Open Scoreboard', 'keyboard', Config.OpenKey)

RegisterCommand('+scoreboard', function()
    DisplayData = MakeIdData()
    TriggerEvent('animations:client:EmoteCommandStart', {"Tablet2"})
    scoreboardOpen = true    
end, false)

RegisterCommand('-scoreboard', function() 
    if scoreboardOpen then
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        scoreboardOpen = false
        DisplayData = nil
    end
end, false)

CreateThread(function()
    while true do
        if scoreboardOpen then
            if not IsPauseMenuActive() then
                if DisplayData then
                    for k, v in pairs(DisplayData) do
                        if HasEntityClearLosToEntity(PlayerPedId(), v.PlayerPed, 17) then
                            local PlayerCoords = GetEntityCoords(v.PlayerPed)
                            local GangTag = ""
                            if v.gang.tag ~= nil then 
                                GangTag = " | ~r~" .. v.gang.tag:upper() .. "~s~"
                            end
                            DrawText3D(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z + 1.0, '~b~ID~w~ [ '..v.PlayerId..' ]' .. GangTag)
                        end
                    end
                end
            else
                scoreboardOpen = false
            end
        end
        Citizen.Wait(3)
    end
end)

function MakeIdData()
    local GangData = promise.new()
    local ReturnData = {}
    for _, player in pairs(GetPlayersFromCoords(GetEntityCoords(GetPlayerPed(-1)), 10.0)) do
        local PlayerId = GetPlayerServerId(player)
        local PlayerPed = GetPlayerPed(player)
        local PlayerName = GetPlayerName(player)
        local PlayerCoords = GetEntityCoords(PlayerPed)        
        ReturnData[#ReturnData + 1] = {
            PlayerId = PlayerId,
            PlayerPed = PlayerPed,
            PlayerName = PlayerName,
            PlayerCoords = PlayerCoords,
        }      
    end

    QBCore.Functions.TriggerCallback("mercy-id:server:getplayergang", function(gData)
        GangData:resolve(gData) 
    end, ReturnData)  

    return Citizen.Await(GangData)
end