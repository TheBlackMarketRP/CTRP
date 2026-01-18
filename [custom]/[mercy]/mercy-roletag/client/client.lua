local QBCore = exports[Config.Core]:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.TriggerCallback('mercy-roletag:client:getconfig', function(tags)
        Config.Tags = tags
    end)
end)


RegisterNetEvent('mercy-roletag:client:updateconfig', function(tags)
    Config.Tags = tags
end)

CreateThread(function()
    while true do 
        local HasConfig = next(Config.Tags)
        local Sleep = 1000 
        if HasConfig then 
            for k, v in pairs(Config.Tags) do 
                if k == GetPlayerServerId(PlayerId()) then
                    Sleep = 0
                    local Text = Config.Roles[v.role].DisplayText
                    local r, g, b, a = table.unpack(Config.Roles[v.role].Color)
                    local BoneCoord = GetPedBoneCoords(PlayerPedId(), 31086)
                    local PlayerCoords = GetEntityCoords(PlayerPedId())
                    local x, y, z = table.unpack(BoneCoord)
                    DrawRoleTag(x, y, z, Text:upper(), r, g, b, a)
                    DrawRoleMarker(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, r, g, b, a)
                else                   
                    local PlayerPed = GetPlayerPed(GetPlayerFromServerId(k))    
                    if PlayerPed and PlayerPed ~= PlayerPedId() then             
                        local PlayerCoords = GetEntityCoords(PlayerPed)
                        local SrcCoords = GetEntityCoords(PlayerPedId())
                        local Distance = GetDistanceBetweenCoords(PlayerCoords, SrcCoords)
                        if Distance <= 30 and HasEntityClearLosToEntity(PlayerPedId(), PlayerPed) then 
                            Sleep = 0
                            local Text = Config.Roles[v.role].DisplayText
                            local r, g, b, a = table.unpack(Config.Roles[v.role].Color)
                            local BoneCoord = GetPedBoneCoords(PlayerPed, 31086)
                            local x, y, z = table.unpack(BoneCoord)
                            DrawRoleTag(x, y, z, Text:upper(), r, g, b, a)
                            DrawRoleMarker(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, r, g, b, a)
                        end     
                    end               
                end
            end
        end
        Wait(Sleep)
    end
end)

function DrawRoleTag(x, y, z, text, r, g, b, a)
	SetTextScale(0.60, 0.60)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(r, g, b, a)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, -0.14)
    ClearDrawOrigin()
end

function DrawRoleMarker(x, y, z, r, g, b, a)
    DrawMarker(27, x, y, z - 0.95, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, r, g, b, a, false, true, 2, false, nil, nil, false)
end

