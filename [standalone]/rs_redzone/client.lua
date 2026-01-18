QBCore = exports['qb-core']:GetCoreObject()
local activeZones = {}
local currentZones = {}
local blips = {}
local inZone = false
local currentZoneName = nil
local recentDeaths = {}

CreateThread(function()
    Wait(2000)
    TriggerServerEvent('rs_redzone:requestActiveZones')
end)

RegisterNetEvent('rs_redzone:checkvicinzone', function(killer)
    if not inZone then
        TriggerEvent("wasabi_ambulance:revivePlayerInZone", "shot")
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent("rs_redzone:server:punishkiller", killer)
    end
end)

RegisterNetEvent('rs_redzone:client:punishkiller', function()
    if inZone and currentZones.zone and currentZones.series then
        local ZoneCoords = Config.ZoneSeries[currentZones.series][currentZones.zone].Zone.coords
        local ZoneRadius = Config.ZoneSeries[currentZones.series][currentZones.zone].Zone.radius
        local GetRndCoords = Config.ZoneSeries[currentZones.series][currentZones.zone].Zone.rspoints[math.random(#Config.ZoneSeries[currentZones.series][currentZones.zone].Zone.rspoints)]
        -- Wait(10000)
        SetEntityCoords(PlayerPedId(), GetRndCoords.x, GetRndCoords.y, GetRndCoords.z + 0.2)
        Wait(1500)
        FreezeEntityPosition(PlayerPedId(), true)
        Wait(15000)
        FreezeEntityPosition(PlayerPedId(), false)
    end
end)

RegisterNetEvent('rs_redzone:updateActiveZones')
AddEventHandler('rs_redzone:updateActiveZones', function(zones)
    activeZones = zones
    UpdateBlips()
    if Config.Debug == true then
        print("[CLIENT] Active zones updated")
    end
end)

RegisterNetEvent('rs_redzone:notifyZoneChange')
AddEventHandler('rs_redzone:notifyZoneChange', function()
    ShowNotification(Config.Notifications.zone_change)
    if Config.Debug == true then
        print("[CLIENT] Zone change notification received")
    end
end)

RegisterNetEvent('rs_redzone:killReward')
AddEventHandler('rs_redzone:killReward', function()
    ShowNotification(Config.Notifications.kill_reward)
    if Config.Debug == true then
        print("[CLIENT] Kill reward notification received")
    end
end)

function UpdateBlips()
    for _, blip in pairs(blips) do
        if DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
    end
    blips = {}
    
    for seriesName, series in pairs(activeZones) do
        for zoneName, isActive in pairs(series) do
            if isActive then
                local zoneConfig = Config.ZoneSeries[seriesName][zoneName]
                if zoneConfig then
                    CreateZoneBlip(zoneConfig, zoneName)
                end
            end
        end
    end
    if Config.Debug == true then
        print("[CLIENT] Blips updated")
    end
end

function CreateZoneBlip(zoneConfig, zoneName)
    local blip = AddBlipForRadius(zoneConfig.Zone.coords, zoneConfig.Zone.radius * 1.0)
    SetBlipColour(blip, zoneConfig.Blip.color)
    SetBlipAlpha(blip, Config.BlipSettings.alpha)

    local centerBlip = AddBlipForCoord(zoneConfig.Zone.coords)
    SetBlipSprite(centerBlip, Config.BlipSettings.sprite)
    SetBlipScale(centerBlip, Config.BlipSettings.scale)
    SetBlipColour(centerBlip, zoneConfig.Blip.color)
    SetBlipAsShortRange(centerBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.BlipSettings.name .. " - " .. zoneName)
    EndTextCommandSetBlipName(centerBlip)
    
    table.insert(blips, blip)
    table.insert(blips, centerBlip)
end


CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local playerInAnyZone = false
        local newZoneName = nil

        for seriesName, series in pairs(activeZones) do
            for zoneName, isActive in pairs(series) do
                if isActive then
                    local zoneConfig = Config.ZoneSeries[seriesName][zoneName]
                    if zoneConfig then
                        local distance = #(coords - zoneConfig.Zone.coords)
                        
                        if distance <= zoneConfig.Zone.radius then
                            playerInAnyZone = true
                            newZoneName = zoneName
                            currentZones.series = seriesName
                            currentZones.zone = zoneName
                            break
                        end
                    end
                end
            end
            if playerInAnyZone then break end
        end
        if playerInAnyZone and not inZone then
            inZone = true
            currentZoneName = newZoneName
            ShowNotification(Config.Notifications.enter)            
            local ZoneGun = Config.ZoneSeries[currentZones.series][currentZones.zone].ZoneGun
            local ZoneAmmo = Config.ZoneSeries[currentZones.series][currentZones.zone].ZoneAmmo
            GiveWeaponToPed(PlayerPedId(), GetHashKey(ZoneGun), 200, true, true)
            SetCurrentPedWeapon(PlayerPedId(), GetHashKey(ZoneGun), true)
            AddAmmoToPed(PlayerPedId(), GetHashKey(ZoneGun), 200)
            TaskReloadWeapon(PlayerPedId(), false)
            if Config.Debug == true then
                print("[CLIENT] Entered redzone: "..currentZoneName.." (series: "..currentZones.series..")")
            end
        elseif not playerInAnyZone and inZone then
            inZone = false
            currentZoneName = nil
            currentZones = {}
            ShowNotification(Config.Notifications.exit)
            SetCurrentPedWeapon(PlayerPedId(), -1569615261, true)
            if Config.Debug == true then
                print("[CLIENT] Exited redzone")
            end
        end
        
        Wait(1000)
    end
end)

local function HandleKill(killerPed, victimPed)
    if killerPed == PlayerPedId() and IsPedAPlayer(victimPed) then
        local victimPlayer = NetworkGetPlayerIndexFromPed(victimPed)
        local victimSrc = GetPlayerServerId(victimPlayer)
        if victimPlayer and victimPlayer ~= PlayerId() then
            if inZone and currentZones.zone and currentZones.series then
                if Config.Debug == true then
                    print(string.format("[CLIENT] Kill detected in zone: %s (series: %s)", currentZones.zone, currentZones.series))
                end
                TriggerServerEvent(
                    'rs_redzone:rewardKill',
                    currentZones.zone,       -- zoneName
                    currentZones.series,      -- seriesName
                    victimSrc
                )
            else
                if Config.Debug == true then
                    print("[CLIENT] Kill detected but not inside redzone")
                end
            end
        end
    end    
end

function HandleDeath(killerPed, victimPed)
    if victimPed == PlayerPedId() and IsPedAPlayer(killerPed) then        
        local victimPlayer = NetworkGetPlayerIndexFromPed(victimPed)
        if victimPlayer and victimPlayer == PlayerId() then
            if inZone and currentZones.zone and currentZones.series then
                local ZoneCoords = Config.ZoneSeries[currentZones.series][currentZones.zone].Zone.coords
                local ZoneRadius = Config.ZoneSeries[currentZones.series][currentZones.zone].Zone.radius
                local GetRndCoords = Config.ZoneSeries[currentZones.series][currentZones.zone].Zone.rspoints[math.random(#Config.ZoneSeries[currentZones.series][currentZones.zone].Zone.rspoints)]
                -- Wait(10000)
                SetEntityCoords(PlayerPedId(), GetRndCoords.x, GetRndCoords.y, GetRndCoords.z + 0.2)
                Wait(1000)
                TriggerEvent("wasabi_ambulance:revivePlayerInZone", "shot")
                ClearPedTasks(PlayerPedId())
            end
        end
    end
end


local function OnEntityDamage(args)
    local fatal = args[6]
    if fatal == 0 then return end

    local victim = args[1]
    local killer = args[2]

    if not IsEntityAPed(victim) then return end
    if recentDeaths[victim] then return end

    if victim == PlayerPedId() then
        HandleDeath(killer, victim)
    end

    if killer == PlayerPedId() or killer == -1 then
        recentDeaths[victim] = true
        HandleKill(killer, victim)
        Wait(1000)
        recentDeaths[victim] = nil
    end  

end

AddEventHandler('gameEventTriggered', function(eventName, args)
    if eventName == "CEventNetworkEntityDamage" then
        OnEntityDamage(args)
    end
end)

exports('isInRedzone', function()
    return inZone
end)

exports('getCurrentZone', function()
    if inZone then
        return currentZones
    end
    return nil
end)
    