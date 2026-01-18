local QBCore = exports[Config.Core]:GetCoreObject()
local Spawned = false
local IsBusy = false
local TreeObjs = {}


CreateThread(function()
    WaitPlayerLoad()
    ShroomBlip = AddBlipForRadius(Config.HarvestZone.Coords, 80.0)                 
    SetBlipColour(ShroomBlip, 1)
    SetBlipAlpha(ShroomBlip, 155)  

    while true do 
        local PlayerPed = PlayerPedId()
        local PlayerCoords = GetEntityCoords(PlayerPed)
        local Distance = GetDistanceBetweenCoords(Config.HarvestZone.Coords, PlayerCoords, false)
        if Distance <= 200.0  then 
            if not Spawned then
                SpawnPaydirtRocks()
            end
        else
            if Spawned then 
                DeSpawnedPaydirtRocks()
            end
        end
        Wait(1500)
    end
end)


CreateThread(function()
    WaitPlayerLoad()
    local ShroomBlip = AddBlipForRadius(Config.HarvestZone.Coords, 80.0)                 
    SetBlipColour(ShroomBlip, 1)
    SetBlipAlpha(ShroomBlip, 155)  
end)

CreateThread(function()
    WaitPlayerLoad()
    while true do 
        local Sleep = 1000
        local PlayerPed = PlayerPedId()
        local PlayerCoords = GetEntityCoords(PlayerPed)
        if next(TreeObjs) then 
            local pData = QBCore.Functions.GetPlayerData()
            for k, v in pairs(TreeObjs) do 
                local RockCoords = GetEntityCoords(k)
                local Distance = GetDistanceBetweenCoords(RockCoords, PlayerCoords, true)
                if Distance <= 2.5 and not IsBusy and not pData.metadata.inlaststand and not pData.metadata.isdead then 
                    Sleep = 0
                    DrawText3D(RockCoords.x, RockCoords.y, RockCoords.z + 0.5, "[~b~E~s~] To ~r~Harvest~s~")
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent("kael-harvest:client:harvest", k)
                    end
                end
            end
        end
        Wait(Sleep)
    end
end)

function SpawnPaydirtRocks()
    Spawned = true
    local Coords = Config.HarvestZone.Coords 
    local Radius = Config.HarvestZone.Radius 
    local RockModel = Config.HarvestZone.Model 
    local MaxSpawn = Config.HarvestZone.MaxSpawn 
    QBCore.Functions.LoadModel(RockModel)
    for i=1, MaxSpawn, 1 do
        local SpawnCoords = RandomCoords(Coords, Radius)
        local PaydirRock = CreateObject(RockModel, SpawnCoords, false, true, false)
        PlaceObjectOnGroundProperly(PaydirRock)
        FreezeEntityPosition(PaydirRock, true)
        TreeObjs[PaydirRock] = PaydirRock
    end
end

function DeSpawnedPaydirtRocks()
    Spawned = false
    for k, v in pairs(TreeObjs) do 
        DeleteEntity(k)
    end
end

function SpawnNewRock()
    local Coords = Config.HarvestZone.Coords 
    local Radius = Config.HarvestZone.Radius 
    local RockModel = Config.HarvestZone.Model 
    local MaxSpawn = Config.HarvestZone.MaxSpawn

    local SpawnCoords = RandomCoords(Coords, Radius)
    local PaydirRock = CreateObject(RockModel, SpawnCoords, false, true, false)
    PlaceObjectOnGroundProperly(PaydirRock)
    FreezeEntityPosition(PaydirRock, true)
    TreeObjs[PaydirRock] = PaydirRock
end


RegisterNetEvent("kael-harvest:client:harvest", function(rock)
    IsBusy = true
    TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_GARDENER_PLANT", 0, 0)
    QBCore.Functions.Progressbar('harvest', "Harvesting...", 8000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        IsBusy = false
        TreeObjs[rock] = nil
        DeleteEntity(rock)
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('kael-harvest:server:harvest')
        SpawnNewRock()
    end, function() -- Cancel
        IsBusy = false
        ClearPedTasks(PlayerPedId())
    end) 
end)

function InShroomZone()
    local PlayerPed = PlayerPedId()
    local PlayerCoords = GetEntityCoords(PlayerPed)
    local ShroomCoords = Config.HarvestZone.Coords

    local Distance = GetDistanceBetweenCoords(PlayerCoords, ShroomCoords, true)
    if Distance <= 80.0 then
        return true 
    else
        return false
    end
end

exports("InShroomZone", InShroomZone)

function WaitPlayerLoad()
    while not LocalPlayer.state.isLoggedIn do
        Wait(500)
    end
end

function RandomCoords(coords, radius)
    local x = coords.x + math.random(-radius, radius)
    local y = coords.y + math.random(-radius, radius)
    safeCoords = vector3(x, y, coords.z)    
    return safeCoords 
end

function DrawText3D(x, y, z, text)
    AddTextEntry('mining3dtxt', text)
    SetFloatingHelpTextWorldPosition(1, x, y, z)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('mining3dtxt')
    EndTextCommandDisplayHelp(2, false, true, -1)
end

function Notify(title, message, ntype)
    QBCore.Functions.Notify(message, ntype)
end


AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
    for k, v in pairs(TreeObjs) do DeleteEntity(k) end    
end)

