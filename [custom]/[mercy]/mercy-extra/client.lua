local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    while true do 
        for _, veh in ipairs(GetGamePool('CVehicle')) do
            if DoesEntityExist(veh) then
                local vType = GetVehicleType(veh)
                if vType == "heli" or vType == "plane" then
                    local driver = GetPedInVehicleSeat(veh, -1)
                    if driver == 0 or not IsPedAPlayer(driver) then
                        local Plate = QBCore.Functions.GetPlate(veh)
                        QBCore.Functions.TriggerCallback("mercy-extra:server:checkvehicle", function(CB)
                            if not CB then 
                                NetworkRequestControlOfEntity(veh)
                                while not NetworkHasControlOfEntity(veh) do
                                    Wait(1)
                                    NetworkRequestControlOfEntity(veh)
                                end
                                DeleteEntity(veh)
                            end
                        end, Plate)
                    end
                end
            end
        end
        Wait(5000)
    end
end)


CreateThread(function()
    WaitPlayerLoad()
    for k, v in pairs(Config.ClearZones) do 
        if not v.polyZone then
			v.polyZone = PolyZone:Create(v.poly,{
                name = k,
                debugPoly = v.debug
            })
		end
    end
end)

CreateThread(function()
    WaitPlayerLoad()
    while true do 
        if Config.RemoveVehicles then
            for _, veh in ipairs(GetGamePool('CVehicle')) do
                if DoesEntityExist(veh) then
                    if GetZoneAtCoords(GetEntityCoords(veh)) then
                        local driver = GetPedInVehicleSeat(veh, -1)
                        if driver == 0 or not IsPedAPlayer(driver) then
                            local Plate = QBCore.Functions.GetPlate(veh)
                            QBCore.Functions.TriggerCallback("mercy-extra:server:checkvehicle", function(CB)
                                if not CB then 
                                    NetworkRequestControlOfEntity(veh)
                                    while not NetworkHasControlOfEntity(veh) do
                                        Wait(1)
                                        NetworkRequestControlOfEntity(veh)
                                    end
                                    DeleteEntity(veh)
                                end
                            end, Plate)
                        end
                    end
                end
            end
        end

        if Config.RemovePeds then
            for _, ped in ipairs(GetGamePool('CPed')) do
                if DoesEntityExist(ped) and not IsPedAPlayer(ped) then
                    if GetZoneAtCoords(GetEntityCoords(ped)) then
                        DeleteEntity(ped)
                    end
                end
            end
        end
        Wait(5000)
    end
end)


function GetZoneAtCoords(coords)
	local Zone = nil
	for k, v in pairs(Config.ClearZones) do
		if v.polyZone and v.polyZone:isPointInside(coords) then
			Zone = k
			break
		end
	end
	return Zone
end

function WaitPlayerLoad()
    while not LocalPlayer.state.isLoggedIn do
        Wait(500)
    end
end