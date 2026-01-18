local QBCore = exports[Config.Core]:GetCoreObject()

local Pilot = nil
local Vehicle = nil
local PlaneBlip = nil
local dBox = nil
local dPara = nil
local Dropped = false
local DropBlip = nil

local Lights = {}

local SpawnedPeds = {}
local GunPeds = {}
local LootPeds = {}


RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.TriggerCallback('kael-purge:server:getsatus', function(cfg)
        Config.CurrentPurge = cfg
        TriggerEvent("kael-purge:client:startpurge", cfg)
    end)
end)

RegisterNetEvent('kael-purge:client:updatecfg', function(cfg)
    Config.CurrentPurge = cfg
end)

CreateThread(function()    
    WaitPlayerLoad()
    while true do 
        local Sleep = 5000
        if Config.CurrentPurge.Active then
            local CID = QBCore.Functions.GetPlayerData().citizenid
            local MyScore = 0
            if Config.CurrentPurge.KillScores[CID] then 
                MyScore = Config.CurrentPurge.KillScores[CID].kills
            else
                MyScore = 0
            end
            local KillsLists = Config.CurrentPurge.KillScores
            local Lists = {}
            local Count = 1
            table.sort(KillsLists, function(a, b)
                return a.score > b.score
            end)
            for k, v in pairs(KillsLists) do 
                Lists[#Lists + 1] = v
                if Count >= 3 then break end
                Count = Count + 1
            end
            SendNUIMessage({
                action = 'ShowScores',
                myscore = MyScore,
                KillsLists = Lists
            })
        end
        Wait(Sleep)
    end
end)

CreateThread(function()    
    WaitPlayerLoad()
    while true do 
        local Sleep = 1000
        if Config.CurrentPurge.Active then
            for k, v in pairs(LootPeds) do 
                local Health = GetEntityHealth(v)
                if Health <= 0 then
                    local PlayerCoords = GetEntityCoords(PlayerPedId())
                    local PedCoords = GetEntityCoords(v)
                    local Distance = GetDistanceBetweenCoords(PedCoords, PlayerCoords, true)
                    if Distance <= 1.0 then
                        Sleep = 0
                        DrawText3D(PedCoords.x, PedCoords.y, PedCoords.z, "[ ~b~E~s~ ] - ~r~Loot~s~ Body")
                        if IsControlJustReleased(0, 38) then
                            LootBody(v, PedToNet(v))               
                        end
                    end
                end
            end
        end
        Wait(Sleep)
    end
end)

function LootBody(ped, netId)
    TaskTurnPedToFaceEntity(PlayerPedId(), ped, 1000)
    Wait(1500)
    QBCore.Functions.RequestAnimDict("amb@medic@standing@kneel@base")
    QBCore.Functions.RequestAnimDict("anim@gangops@facility@servers@bodysearch@")
    TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
    TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@", "player_search", 2.0, 2.0, -1, 48, 0, false, false, false)
    Wait(2000)
    ClearPedTasks(PlayerPedId())

    TriggerServerEvent("kael-purge:server:lootbody", netId)
end

CreateThread(function()    
    WaitPlayerLoad()
    while true do 
        local Sleep = 1000
        if DoesEntityExist(dBox) then 
            local PlayerCoords = GetEntityCoords(PlayerPedId())
            local BoxCoords = GetEntityCoords(dBox)
            local Distance = GetDistanceBetweenCoords(BoxCoords, PlayerCoords, true)
            if Distance <= 25.0 and Distance > 2.5 then                             
                Sleep = 0
                DrawMarker(22, BoxCoords.x, BoxCoords.y, BoxCoords.z + 1.4, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 199, 15, 15, 175, true, true, 2, true, nil, nil, false)
            elseif Distance <= 2.5 then
                Sleep = 0
                DrawText3D(BoxCoords.x, BoxCoords.y, BoxCoords.z  + 1.4, "[ ~b~E~s~ ] - ~r~Loot~s~ Drop")
                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent("kael-purge:server:lootsync")                          
                end
            end
        end
        Wait(Sleep)
    end
end)

CreateThread(function()
    WaitPlayerLoad()

    AddRelationshipGroup("GROUP_A")
    AddRelationshipGroup("GROUP_B")

    while true do 
        if Config.CurrentPurge.Active then
            local IgnoredPeds = {}
            if next(IgnoredPeds) == nil then
                for _, player in ipairs(GetActivePlayers()) do
                    local ped = GetPlayerPed(player)
                    IgnoredPeds[#IgnoredPeds+1] = ped
                end
            end

            local sPeds = GetPeds(IgnoredPeds)
            local PlayerCoords = GetEntityCoords(PlayerPedId())
            for k, v in pairs(sPeds) do 
                LootPeds[v] = v                 
                local PedCoords = GetEntityCoords(v)
                local Distance = GetDistanceBetweenCoords(PlayerCoords, PedCoords, true)   
                if Distance <= 100.0 then       
                    local Weapon = Config.Peds.Weapons[math.random(#Config.Peds.Weapons)]
                    ClearPedTasks(v)
                    SetEntityAsMissionEntity(v, true)
                    SetEntityVisible(v, true)
                    SetPedCanRagdoll(v, false) 
                    if not GunPeds[v] then 
                        GunPeds[v] = v
                        GiveWeaponToPed(v, GetHashKey(Weapon), -1, true, true)
                    end
                    SetPedAccuracy(v, 100)
                    SetPedDropsWeaponsWhenDead(v, false)
                    SetPedFleeAttributes(v, 0, false)
                    SetPedCombatAttributes(v, 46, true)
                    SetPedCombatMovement(v, 1)
                    SetPedAlertness(v, 3)
                    SetPedCombatRange(v, 3)
                    SetPedSeeingRange(v, 500.0)
                    
                    if math.random(2) == 1 then 
                        SetPedRelationshipGroupHash(v, GetHashKey("GROUP_A"))
                    else
                        SetPedRelationshipGroupHash(v, GetHashKey("GROUP_B"))
                    end

                    SetRelationshipBetweenGroups(5, GetHashKey("GROUP_A"), GetHashKey("GROUP_B"))
                    SetRelationshipBetweenGroups(5, GetHashKey("GROUP_B"), GetHashKey("GROUP_A"))

                    SetRelationshipBetweenGroups(5, GetHashKey("GROUP_A"), GetHashKey("PLAYER"))
                    SetRelationshipBetweenGroups(5, GetHashKey("GROUP_B"), GetHashKey("PLAYER"))
                end
            end
        end
        Wait(10000)
    end
end)

RegisterNetEvent('kael-purge:client:startpurge', function(cfg) 
    Config.CurrentPurge = cfg
    if Config.CurrentPurge.Active then    
        TriggerEvent("InteractSound_CL:PlayOnOne", "Alert", 0.4)
        -- MissionPopUpText("~r~Alert~s~", "~w~The Purge Has Started~s~")
        TriggerServerEvent("kael-purge:server:storeinventory")

        SendNUIMessage({
            action = 'ShowNews',
        })
        -- Wait(60000)
        -- SendNUIMessage({
        --     action = 'HideNews',
        -- })
    end
    while Config.CurrentPurge.Active do 
        Wait(math.random(Config.Peds.SpawnInterval.min, Config.Peds.SpawnInterval.min) * 60 * 1000)
        if Config.CurrentPurge.Active then
            SpawnPeds()
        end   
    end
end)

RegisterNetEvent('kael-purge:client:stoppurge', function(cfg) 
    Config.CurrentPurge = cfg
    for k, v in pairs(SpawnedPeds) do 
        DeleteEntity(v)
    end
    for k, v in pairs(GunPeds) do 
        DeleteEntity(v)
    end

    if DoesEntityExist(dBox) then 
        RemoveBlip(DropBlip)
        DeleteEntity(dBox)
        dBox = nil
        for k, v in pairs(Lights) do 
            DeleteEntity(v)
        end
    end
    SendNUIMessage({
        action = 'HideScores',
    })
    SendNUIMessage({
        action = 'HideNews',
    })
    TriggerServerEvent("kael-purge:server:giveinventory")
end)

RegisterNetEvent('kael-purge:client:startsmoke', function(dest)
    local pos = vector3(dest.x, dest.y, dest.z + 150)
    local ground = vector3(dest.x, dest.y, dest.z)
    RequestWeaponAsset(GetHashKey("weapon_flare")) 
    while not HasWeaponAssetLoaded(GetHashKey("weapon_flare")) do
        Wait(0)
    end
    ShootSingleBulletBetweenCoords(pos.x, pos.y, pos.z, ground.x, ground.y, ground.z, 0, false, GetHashKey("weapon_flare"), 0, true, true, -1.0)
end)

RegisterNetEvent('kael-purge:client:spawnitemdrop', function(dest)
    QBCore.Functions.Notify('Airdrop Inbound!', 'success')
    SpawnPlane(dest)
end)

RegisterNetEvent('kael-purge:client:lootsync', function(cfg)
    Config.CurrentPurge = cfg
    if DoesEntityExist(dBox) then 
        RemoveBlip(DropBlip)
        DeleteEntity(dBox)
        dBox = nil
        for k, v in pairs(Lights) do 
            DeleteEntity(v)
        end
    end
end)

function SpawnPeds()
    for k, v in pairs(SpawnedPeds) do 
        local Health = GetEntityHealth(v)
        if Health <= 0 then
            DeleteEntity(v)
            SpawnedPeds[k] = nil
        end
    end

    for i = 1, Config.Peds.SpawnNumbers, 1 do 
        local Coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), math.random(0, 20) + 0.0, math.random(0, 20) + 0.0, 1.0)
        local Model = Config.Peds.Models[math.random(#Config.Peds.Models)]
        local Weapon = Config.Peds.Weapons[math.random(#Config.Peds.Weapons)]
        QBCore.Functions.LoadModel(Model)
        local Ped = CreatePed(26, Model, Coords, true, true)   
        SpawnedPeds[Ped] = Ped
        LootPeds[Ped] = Ped
        NetworkRegisterEntityAsNetworked(Ped)
        while not NetworkGetEntityIsNetworked(Ped) do 
            wait(0)
        end
        SetEntityAsMissionEntity(Ped, true)
        SetEntityVisible(Ped, true)
        SetPedCanRagdoll(Ped, false)  
        if not GunPeds[Ped] then 
            GunPeds[Ped] = Ped
            GiveWeaponToPed(Ped, GetHashKey(Weapon), -1, true, true)
        end
        SetPedAccuracy(Ped, 100)
        SetPedDropsWeaponsWhenDead(Ped, false)
		SetPedFleeAttributes(Ped, 0, false)
        SetPedCombatAttributes(Ped, 46, true)
        SetPedCombatMovement(Ped, 1)
        SetPedAlertness(Ped, 3)
        SetPedCombatRange(Ped, 3)
        SetPedSeeingRange(Ped, 500.0)
        
        if math.random(2) == 1 then 
            SetPedRelationshipGroupHash(Ped, GetHashKey("GROUP_A"))
        else
            SetPedRelationshipGroupHash(Ped, GetHashKey("GROUP_B"))
        end
    end

    SetRelationshipBetweenGroups(5, GetHashKey("GROUP_A"), GetHashKey("GROUP_B"))
    SetRelationshipBetweenGroups(5, GetHashKey("GROUP_B"), GetHashKey("GROUP_A"))

    SetRelationshipBetweenGroups(5, GetHashKey("GROUP_A"), GetHashKey("PLAYER"))
    SetRelationshipBetweenGroups(5, GetHashKey("GROUP_B"), GetHashKey("PLAYER"))    
    Wait(500)
end

function SpawnPlane(dest)
    if Config.Plane.Enable then
        local PlaneModel = Config.Plane.Model
        local PilotModel = Config.Plane.Pilot
        QBCore.Functions.LoadModel(PlaneModel)
        QBCore.Functions.LoadModel(PilotModel)

        local rad = 3.14
        local direction = vector3(math.cos(rad), math.sin(rad), 0.0)
        local vehicleCoords = vector3(3500,-3500, Config.Plane.Height)
        local heading = rad * 57.2958 - 90
        
            
        if DoesEntityExist(dBox) then 
            RemoveBlip(DropBlip)
            DeleteEntity(dBox)
            dBox = nil
            for k, v in pairs(Lights) do 
                DeleteEntity(v)
            end
        end

        if DoesEntityExist(Vehicle) then 
            RemoveBlip(PlaneBlip)
            DeleteEntity(Vehicle)
            DeleteEntity(Pilot)
            Vehicle = nil
            Pilot = nil
            Dropped = false
        end

        Vehicle = CreateVehicle(PlaneModel, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, heading, false, true)
        Pilot = CreatePed(4, PilotModel, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, heading, false, true)

        PlaneBlip = AddBlipForEntity(Vehicle)
        SetBlipSprite(PlaneBlip, 307)
        SetBlipRotation(PlaneBlip, GetEntityHeading(Pilot))
        SetPedIntoVehicle(Pilot, Vehicle, -1)

        ControlLandingGear(Vehicle, 3)
        SetVehicleEngineOn(Vehicle, true, true, false)
        SetEntityVelocity(Vehicle, direction.x * Config.Plane.Speed, direction.y * Config.Plane.Speed, 0.0)
        TaskPlaneMission(Pilot, Vehicle, 0, 0, dest.x, dest.y, dest.z + 250, 6, 0, 0, heading, 2000.0, 400.0)
        
        while DoesEntityExist(Vehicle) do
            SetBlipRotation(PlaneBlip, Ceil(GetEntityHeading(Pilot)))
            local pcoords = GetEntityCoords(Vehicle)
            local dist = #(pcoords - dest)
            if dist < 280 and not Dropped then
                Dropped = true  
                DropBox(dest) 
            end
            if dist > 500 and Dropped then
                RemoveBlip(PlaneBlip)
                DeleteEntity(Vehicle)
                DeleteEntity(Pilot)
                Vehicle = nil
                Pilot = nil
                Dropped = false
            end
            Wait(1000)
        end 
    else
        if DoesEntityExist(dBox) then 
            RemoveBlip(DropBlip)
            DeleteEntity(dBox)
            dBox = nil
            for k, v in pairs(Lights) do 
                DeleteEntity(v)
            end
        end
        DropBox(dest) 
    end   
end

function DropBox(dest)   
    CreateThread(function()
        TaskPlaneMission(Pilot, Vehicle, 0, 0, -3500, 3500, Config.Plane.Height, 6, 0, 0, heading, 2000.0, 400.0)
        local pos = vector3(dest.x, dest.y, dest.z + 150)
        local ground = vector3(dest.x, dest.y, dest.z)

        QBCore.Functions.LoadModel('prop_lev_crate_01')
        QBCore.Functions.LoadModel('prop_wall_light_15a')
        QBCore.Functions.LoadModel('p_parachute1_sp_dec')
        dBox = CreateObject('prop_lev_crate_01', pos.x, pos.y, pos.z, false, true)
        dPara = CreateObject('p_parachute1_sp_dec', pos.x, pos.y, pos.z, false, true)
        SetEntityLodDist(dPara, 1000)
		AttachEntityToEntity(dPara, dBox, 0, 0.0, 0.0, 3.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)

        for i = 1, 4, 1 do
            local light = CreateObject('prop_wall_light_15a', pos.x, pos.y, pos.z, false, true)
            Lights[#Lights+1] = light
            if (i == 1) then
                AttachEntityToEntity(light, dBox, 0, 0.0, -1.1, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
            elseif (i == 2) then
                AttachEntityToEntity(light, dBox, 0, 0.0, 1.1, 0.0, 0.0, 0.0, 180.0, false, false, false, false, 2, true)
            elseif (i == 3) then
                AttachEntityToEntity(light, dBox, 0, -1.1, 0.0, 0.0, 0.0, 0.0, 270.0, false, false, false, false, 2, true)
            elseif (i == 4) then
                AttachEntityToEntity(light, dBox, 0, 1.1, 0.0, 0.0, 0.0, 0.0, 90.0, false, false, false, false, 2, true)
            end
        end

        -- SetObjectPhysicsParams(dBox, 99999.0, 0.5, 0.0, 0.0, 0.0, 700.0, 0.0, 0.0, 0.0, 0.5, 0.0)
        SetEntityLodDist(dBox, 1000) 
        ActivatePhysics(dBox)
        SetDamping(dBox, 2, 0.1) 
        SetEntityVelocity(dBox, 0.0, 0.0, -9000.0)

        if Config.DropBlip.Enable then 
            DropBlip = AddBlipForEntity(dBox)
            SetBlipSprite (DropBlip, Config.DropBlip.Icon)
            SetBlipDisplay(DropBlip, 4)
            SetBlipScale  (DropBlip, Config.DropBlip.Size)
            SetBlipAsShortRange(DropBlip, false)
            SetBlipColour(DropBlip, Config.DropBlip.Color)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Config.DropBlip.Text)
            EndTextCommandSetBlipName(DropBlip)
        end

        Wait(13000)        
        DeleteEntity(dPara)
    end)     
end

AddEventHandler('gameEventTriggered', function(event, args)
    if event == "CEventNetworkEntityDamage" and args[6] == 1 then
        if not IsEntityAPed(args[1]) or IsPedAPlayer(args[1]) then return end
        local victimPed = args[1] 
        local attacker = args[2] 

        if attacker == PlayerPedId() and victimPed ~= PlayerPedId() then     
            TriggerServerEvent("kael-purge:server:updatekills")
        end
    end
end)


function WaitPlayerLoad()
    while not LocalPlayer.state.isLoggedIn do
        Wait(500)
    end
end

function GetPeds(ignoreList)
    local pedPool = GetGamePool('CPed')
    local peds = {}
    local ignoreTable = {}
    ignoreList = ignoreList or {}
    for i = 1, #ignoreList do
        ignoreTable[ignoreList[i]] = true
    end
    for i = 1, #pedPool do
        if not ignoreTable[pedPool[i]] then
            peds[#peds + 1] = pedPool[i]
        end
    end
    return peds
end

function MissionPopUpText(title, sub)
    CreateThread(function()
        local Play = true
        local ScaleformHandle = RequestScaleformMovie("mp_big_message_freemode") 
        while not HasScaleformMovieLoaded(ScaleformHandle) do 
          Wait(0)
        end      
        BeginScaleformMovieMethod(ScaleformHandle, "SHOW_SHARD_WASTED_MP_MESSAGE") 
        PushScaleformMovieMethodParameterString(title) 
        PushScaleformMovieMethodParameterString(sub) 
        PushScaleformMovieMethodParameterInt(5) 
        EndScaleformMovieMethod() 
        SetTimeout(20000, function()
            Play = false
        end)        
        while Play do 
            Wait(0)
            DrawScaleformMovieFullscreen(ScaleformHandle, 255, 255, 255, 255) 
        end
    end)
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.40, 0.40)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry('STRING')
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.010+ factor, 0.035, 0, 0, 0, 150)
    ClearDrawOrigin()
end

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end  
    if DoesEntityExist(dBox) then 
        DeleteEntity(dBox)
    end
    DeleteEntity(dPara)
    DeleteEntity(Vehicle)
    DeleteEntity(Pilot)
    RemoveBlip(PlaneBlip)  
    RemoveBlip(DropBlip)
    for k, v in pairs(Lights) do 
        DeleteEntity(v)
    end
    for k, v in pairs(SpawnedPeds) do 
        DeleteEntity(v)
    end
end)

