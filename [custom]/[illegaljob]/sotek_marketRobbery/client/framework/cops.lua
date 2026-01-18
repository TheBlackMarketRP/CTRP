function Sup.CallCops()
    CreateThread(function()
        local cops = Callback.TriggerServerCallback("Sup:CheckForPolice", Sup.UUID)
        if cops then
            TriggerServerEvent("Sup:CallCops", Sup.UUID, "Market", Modules.Player.GetPos())
            local coords = Modules.Player.GetPos()
            local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
            exports.wasabi_mdt:CreateDispatch({
                type = 'robbery',
                title = 'Store Robbery',
                description = 'Armed suspect at convenience store',
                location = streetName,
                coords = {x = coords.x, y = coords.y, z = coords.z},
                priority = 5,
                departments = { 'police' }
            })
        end
    end)
end

local blips = nil
RegisterNetEvent("Sup:CallCops")
AddEventHandler("Sup:CallCops", function(name, coords, msg)
    local dist = CalculateTravelDistanceBetweenPoints(Modules.Player.GetPos(), coords)
    local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z)) ..
        " (" .. math.ceil(dist) .. "m)"
    local call = true
    local accept = false
    if Sup.Notification == "gtav" then
        Modules.Utils.ShowAdvancedNotification("CENTER", "Emergency call",
            "~b~Location: ~s~" .. streetName .. "\n~b~Information: ~s~" .. msg, "CHAR_CALL911", "CHAR_CALL911")
        Modules.Utils.ShowNotification(Sup.Language["takeCall"])
        PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)
    else
        --put your custom notification

        Sup.AdvencedNotification("CENTER", "Emergency call",
            "~b~Location: ~s~" .. streetName .. "\n~b~Information: ~s~" .. msg, "CHAR_CALL911", "CHAR_CALL911")
        Sup.ShowNotification(Sup.Language["takeCall"])
    end

    --
    local timer = GetGameTimer() + 10000
    while call do
        if GetGameTimer() > timer then
            Modules.Utils.ShowNotification(Sup.Language["ignore"])
            call = false
            accept = false
            break
        elseif IsControlJustPressed(0, 246) then
            Modules.Utils.ShowNotification(Sup.Language["accept"])
            call = false
            accept = true
            break
        elseif IsControlJustPressed(0, 306) then
            Modules.Utils.ShowNotification(Sup.Language["reject"])
            call = false
            accept = false
            break
        end
        Wait(1)
    end
    if accept then
        SetWaypointOff()
        if blips then
            RemoveBlip(blips)
        end
        blips = AddBlipForCoord(coords)
        SetBlipRoute(blips, true)
        Modules.Utils.ShowNotification("Vous avez pris l'appel")
        while accept do
            Wait(1000)
            if #(coords - Modules.Player.GetPos()) < 10.0 then
                RemoveBlip(blips)
                accept = false
                return
            end
        end
    end
end)
