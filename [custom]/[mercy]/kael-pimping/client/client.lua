local QBCore = exports[Config.Core]:GetCoreObject()
local IsPimping = false
local IsHookerReady = false
local HookerWorking = false
local Girl = nil
local GirlBlip = nil
local Customer = nil
local CustomerBlip = nil
local TotalEarned = 0

CreateThread(function()
    while true do 
        if IsPimping and IsHookerReady and HookerWorking then 
            local GirlLoc = GetEntityCoords(Girl)
            local PlayerLoc = GetEntityCoords(PlayerPedId())
            local Distance = GetDistanceBetweenCoords(GirlLoc, PlayerLoc)
            if Distance < 5.0 then 
                QBCore.Functions.Notify("You Can't Be Near While She Works!", 'error')
                TriggerEvent('edo-pimping:client:customerrunaway')
            elseif Distance > 50.0 then
                QBCore.Functions.Notify("You Can't Go Far While She is Working!", 'error')
                TriggerEvent('edo-pimping:client:stoppimping')
            end
        end
        Wait(2000)
    end
end)

RegisterCommand('pimp', function()
    QBCore.Functions.TriggerCallback("edo-pimping:server:checkpimpingitem", function(HasItem)
        if HasItem then 
            if not IsPimping then 
                IsPimping = true
                local PlayerPed = PlayerPedId()
                local PlayerCoords = GetEntityCoords(PlayerPed)
                local GirlModel = Config.GirlsModels[math.random(#Config.GirlsModels)]
                QBCore.Functions.LoadModel(GirlModel)
                Girl = CreatePed(0, GirlModel, PlayerCoords.x + 30, PlayerCoords.y + 30, PlayerCoords.z, true, true)
                SetBlockingOfNonTemporaryEvents(Girl, true)
                -- SetEntityInvincible(Girl, true)
        
                GirlBlip = AddBlipForEntity(Girl)
                SetBlipSprite(GirlBlip, 118)
                SetBlipColour(GirlBlip, 48)
                SetBlipDisplay(GirlBlip, 4)
                SetBlipScale(GirlBlip, 0.8)
                SetBlipAsShortRange(GirlBlip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("The Hooker")
                EndTextCommandSetBlipName(GirlBlip)
                
                -- TaskFollowNavMeshToCoord(Girl, PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, 1.0, -1, 2.0, 0, 0.0)
                TaskGoToEntity(Girl, PlayerPed, -1, 2.0, 1.0, 1073741824, 0)
                
                exports[Config.Target]:AddTargetEntity(Girl, { 
                    options = { 
                        { 
                            icon = 'fas fa-money-bill-1', 
                            label = 'Make Money For Me',  
                            event = "edo-pimping:client:startpimping",
                        },
                    },
                    distance = 1.5, 
                })
            else
                QBCore.Functions.Notify("You can summon another hoocker while Pimping!", 'error')
            end
        else
            QBCore.Functions.Notify("You don't have the item!", 'error')
        end
    end)
    
end)

RegisterNetEvent('edo-pimping:client:startpimping', function()
    QBCore.Functions.Notify("You Should Wait for us outside!", 'success')
    TaskStartScenarioInPlace(Girl, "WORLD_HUMAN_SMOKING", true, true)
    Wait(20000)
    IsHookerReady = true
    SpawnCustomer()
end)

function SpawnCustomer()
    while IsPimping and IsHookerReady and not HookerWorking do 
        HookerWorking = true
        local Job = Config.JobTypes[math.random(#Config.JobTypes)]
        local GirlLoc = GetEntityCoords(Girl)
        local CustomerModel = Config.CustomerModels[math.random(#Config.CustomerModels)]
        QBCore.Functions.LoadModel(CustomerModel)
        Customer = CreatePed(0, CustomerModel, GirlLoc.x + 20, GirlLoc.y + 20, GirlLoc.z, true, true)        
        SetBlockingOfNonTemporaryEvents(Customer, true)

        CustomerBlip = AddBlipForEntity(Customer)
        SetBlipSprite(CustomerBlip, 89)
        SetBlipColour(CustomerBlip, 0)
        SetBlipDisplay(CustomerBlip, 4)
        SetBlipScale(CustomerBlip, 0.8)
        SetBlipAsShortRange(CustomerBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("The Customer")
        EndTextCommandSetBlipName(CustomerBlip)


        if HookerWorking then 
            TaskGoToEntity(Customer, Girl, -1, 0.63, 1.0, 1073741824, 0)

            repeat 
                Wait(10)
            until (IsEntityAtCoord(Customer, GetEntityCoords(Girl), 0.63, 0.63, 0.63, false, false, 0)) 
        end
        
        if HookerWorking then 
            ClearPedTasksImmediately(Girl)

            TaskTurnPedToFaceEntity(Customer, Girl, 5500)
            TaskTurnPedToFaceEntity(Girl, Customer, 5500)

            Wait(1000)
        end

        if HookerWorking then 

            if Job.name == 'bj' then
                QBCore.Functions.RequestAnimDict('misscarsteal2pimpsex')
                TaskPlayAnim(Customer, "misscarsteal2pimpsex", "pimpsex_punter", 5.0, 5.0, -1, 15, 0, false, false, false)
                TaskPlayAnim(Girl, "misscarsteal2pimpsex", "pimpsex_hooker", 5.0, 5.0, -1, 15, 0, false, false, false)
            elseif Job.name == 'kiss' then 
                QBCore.Functions.RequestAnimDict('hs3_ext-20')
                TaskPlayAnim(Customer, "hs3_ext-20", "csb_georginacheng_dual-20", 5.0, 5.0, -1, 15, 0, false, false, false)
                TaskPlayAnim(Girl, "hs3_ext-20", "cs_lestercrest_3_dual-20", 5.0, 5.0, -1, 15, 0, false, false, false)
            elseif Job.name == 'date' then 
                TaskStartScenarioInPlace(Customer, "WORLD_HUMAN_DRINKING", true, true)
                TaskStartScenarioInPlace(Girl, "WORLD_HUMAN_DRINKING", true, true)
            elseif Job.name == 'sex' then 
                QBCore.Functions.RequestAnimDict('misscarsteal2pimpsex')
                TaskPlayAnim(Customer, "misscarsteal2pimpsex", "shagloop_pimp", 5.0, 5.0, -1, 15, 0, false, false, false)
                TaskPlayAnim(Girl, "misscarsteal2pimpsex", "shagloop_hooker", 5.0, 5.0, -1, 15, 0, false, false, false)
            end            

            Wait(10000)            
        end

        if HookerWorking then 
            ClearPedTasks(Customer)
            ClearPedTasks(Girl)

            TaskStartScenarioInPlace(Girl, "WORLD_HUMAN_SMOKING", true, true)

            SetEntityAsMissionEntity(Customer, false, false)
            SetEntityAsNoLongerNeeded(Customer)
            RemoveBlip(CustomerBlip)
            TotalEarned = TotalEarned + Job.price
            HookerWorking = false
        end
        
        Wait(20000)
    end
end

RegisterNetEvent('edo-pimping:client:customerrunaway', function()
    if HookerWorking then 
        HookerWorking = false
        ClearPedTasks(Girl)
        ClearPedTasks(Customer)
        RemoveBlip(CustomerBlip)
        TaskStartScenarioInPlace(Girl, "WORLD_HUMAN_SMOKING", true, true)
        TaskCombatPed(Customer, PlayerPedId(), 0, 16)
    end
end)

RegisterNetEvent('edo-pimping:client:stoppimping', function()
    TriggerServerEvent('edo-pimping:sever:removepimpingitem')
    ClearPedTasks(Girl)
    ClearPedTasks(Customer)
    SetEntityAsMissionEntity(Customer, false, false)
    SetEntityAsNoLongerNeeded(Customer)
    RemoveBlip(CustomerBlip)
    RemoveBlip(GirlBlip)
    SetEntityAsMissionEntity(Girl, false, false)
    SetEntityAsNoLongerNeeded(Girl)
    IsPimping = false
    IsHookerReady = false
    HookerWorking = false
    Girl = nil
    GirlBlip = nil
    Customer = nil
    CustomerBlip = nil
    TotalEarned = 0
end)

RegisterCommand('stoppimp', function()
    if HookerWorking then 
        HookerWorking = false
        ClearPedTasks(Girl)
        ClearPedTasks(Customer)
        SetEntityAsMissionEntity(Customer, false, false)
        SetEntityAsNoLongerNeeded(Customer)
        RemoveBlip(CustomerBlip)
    end
    
    IsPimping = false
    IsHookerReady = false

    TaskGoToEntity(Girl, PlayerPedId(), -1, 2.0, 1.0, 1073741824, 0)

    repeat 
        Wait(10)
    until (IsEntityAtCoord(Girl, GetEntityCoords(PlayerPedId()), 2.0, 2.0, 2.0, false, false, 0)) 

    QBCore.Functions.RequestAnimDict('mp_common')
    TaskPlayAnim(Girl, "mp_common", "givetake1_a", 5.0, 5.0, -1, 51, 0, false, false, false)

    -- Give Pimping Money -- 
    if TotalEarned > 0 then 
        QBCore.Functions.TriggerCallback("edo-pimping:server:giveearnedmoneytopimp", function(paid)
            if paid then 
                QBCore.Functions.Notify("You Got Paid By Hoocker!", 'success')
            end
        end, TotalEarned)
    end
    -- Give Pimping Money -- 

    Wait(1000)
    ClearPedTasks(Girl)

    RemoveBlip(GirlBlip)
    SetEntityAsMissionEntity(Girl, false, false)
    SetEntityAsNoLongerNeeded(Girl)
    Girl = nil
    GirlBlip = nil
    Customer = nil
    CustomerBlip = nil
    TotalEarned = 0
end)



