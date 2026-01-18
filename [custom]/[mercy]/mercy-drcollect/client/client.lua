local QBCore = exports[Config.Core]:GetCoreObject()
local CheckPointObj = {} 
local ShowingAlart = false
local IsCollecting = false
local IsBusy = false

local pData = nil

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    pData = QBCore.Functions.GetPlayerData()
end)


CreateThread(function()
    WaitPlayerLoad()  
    for k, v in pairs(Config.CollectLocations) do 
        if v.Blip.Show then 
            local MarkarBlip = AddBlipForCoord(v.Coords)
            SetBlipSprite(MarkarBlip, v.Blip.Icon)
            SetBlipColour(MarkarBlip, v.Blip.Color)
            SetBlipDisplay(MarkarBlip, 4)
            SetBlipScale(MarkarBlip, v.Blip.Size)
            SetBlipAsShortRange(MarkarBlip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(v.Name)
            EndTextCommandSetBlipName(MarkarBlip)
        end
    end
end)

CreateThread(function()
    WaitPlayerLoad()  
    while true do 
        local Sleep = 1500
        local PlayerPed = PlayerPedId()
        local PlayerCoords = GetEntityCoords(PlayerPed)
        for k, l in pairs(Config.CollectLocations) do 
            local Dist = GetDistanceBetweenCoords(l.Coords, PlayerCoords, true)
            if Dist <= 6.0 and Dist > 1.0 then
                Sleep = 0
                DrawMarker(l.MarkerType, l.Coords, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, l.Size.x, l.Size.y, l.Size.z, l.Color.r, l.Color.g, l.Color.b, l.Color.a, true, true, 2, nil, nil, false)                   
            elseif Dist <= 1.0 then     
                if not IsBusy then 
                    Sleep = 0                        
                    DrawText3D(l.Coords.x, l.Coords.y, l.Coords.z, 'Press ~b~[E]~w~ To Collect ~g~'.. l.Name ..'~w~')
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent('m-dcollect:client:buttonpress', k)
                    end
                end
            end 
        end
        Wait(Sleep)
    end    
end)

RegisterNetEvent('m-dcollect:client:buttonpress', function(id)
    IsCollecting = true    
    IsBusy = true
    QBCore.Functions.RequestAnimDict('mini@repair')
    TaskPlayAnim(PlayerPedId(), 'mini@repair', "fixing_a_ped", 5.0, -1, -1, 49, 0, false, false, false) 
    local LastChecked = GetGameTimer()
    local AFKCheck = math.random(Config.AntiAFKCheck.min, Config.AntiAFKCheck.max)
    CreateThread(function()
        while IsCollecting do 
            local Dists = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.CollectLocations[id].Coords)
            if IsCollecting and not IsEntityPlayingAnim(PlayerPedId(), "mini@repair", "fixing_a_ped", 3) then
                TaskPlayAnim(PlayerPedId(), 'mini@repair' ,"fixing_a_ped", 5.0, -1, -1, 49, 0, false, false, false)
            end
            if Dists > 4.0 then 
                IsCollecting = false
                IsBusy = false
                ClearPedTasks(PlayerPedId())
                TriggerEvent('progressbar:client:cancel')
                break
            end 

            if (GetGameTimer() - LastChecked) >= AFKCheck then
                AntiAFKConfirmation("collect", id)
                IsCollecting = false
                IsBusy = false
                ClearPedTasks(PlayerPedId())
                TriggerEvent('progressbar:client:cancel')
                break
            end

            Wait(1500)
        end
    end)  
    CollectFunction(id)
end)

function CollectFunction(id)
    local RandOmItem = Config.CollectLocations[id].RewardItems[math.random(#Config.CollectLocations[id].RewardItems)]
    local ItemIterval = Config.CollectLocations[id].ItemGiveInterval
    if IsCollecting then   
        QBCore.Functions.Progressbar('collecting', 'Collecting....', ItemIterval, false, true, { 
            disableMovement = false,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = false,
        }, {}, {}, {}, function() -- Play When Done
            if IsCollecting then
                TriggerServerEvent('m-dcollect:server:giveritems', RandOmItem.item, RandOmItem.amount, id)
            end
        end, function() -- Play When Cancel
            IsCollecting = false
            IsBusy = false
            ClearPedTasks(PlayerPedId())
        end)
    end   
end

RegisterNetEvent("m-dcollect:server:restartcollect",  function(id)
    CollectFunction(id)
end)

CreateThread(function()
    WaitPlayerLoad()   
    pData = QBCore.Functions.GetPlayerData()

    for zone, res in pairs(Config.Processes) do 
        if res.Blip.Enable then 
            if res.Job and res.Job == pData.job.name then
                local RestBlip = AddBlipForCoord(res.Process.Coords)
                SetBlipSprite (RestBlip, res.Blip.Icon)
                SetBlipDisplay(RestBlip, 4)
                SetBlipScale  (RestBlip, res.Blip.Size)
                SetBlipAsShortRange(RestBlip, true)
                SetBlipColour(RestBlip, res.Blip.Color)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentSubstringPlayerName(res.Name)
                EndTextCommandSetBlipName(RestBlip)
            end

            if not res.Job then 
                local RestBlip = AddBlipForCoord(res.Process.Coords)
                SetBlipSprite (RestBlip, res.Blip.Icon)
                SetBlipDisplay(RestBlip, 4)
                SetBlipScale  (RestBlip, res.Blip.Size)
                SetBlipAsShortRange(RestBlip, true)
                SetBlipColour(RestBlip, res.Blip.Color)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentSubstringPlayerName(res.Name)
                EndTextCommandSetBlipName(RestBlip)
            end
        end
    end
end)

CreateThread(function()
    WaitPlayerLoad()  
    while true do  
        local Sleep = 1000
        pData = QBCore.Functions.GetPlayerData()

        for zone, res in pairs(Config.Processes) do 
            local PlayerPed = PlayerPedId()
            local PlayerCoords = GetEntityCoords(PlayerPed)
            local Dist = GetDistanceBetweenCoords(res.Process.Coords, PlayerCoords, true)

            if res.Job and res.Job == pData.job.name then
                if Dist <= 6.0 and Dist > 1.0 then 
                    Sleep = 0
                    DrawMarker(22, res.Process.Coords, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.5, 0.5, 0.5, 78, 155, 22, 200, true, true, 2, nil, nil, false)                           
                elseif Dist <= 1.0 then   
                    if not IsBusy then 
                        Sleep = 0  
                        DrawText3D(res.Process.Coords.x, res.Process.Coords.y, res.Process.Coords.z, "Press ~b~[E]~w~ To Process")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("m-dcollect:client:processes", zone)
                        end
                    end
                end
            end

            if not res.Job then 
                if Dist <= 6.0 and Dist > 1.0 then 
                    Sleep = 0
                    DrawMarker(22, res.Process.Coords, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.5, 0.5, 0.5, 78, 155, 22, 200, true, true, 2, nil, nil, false)                           
                elseif Dist <= 1.0 then   
                    if not IsBusy then 
                        Sleep = 0  
                        DrawText3D(res.Process.Coords.x, res.Process.Coords.y, res.Process.Coords.z, "Press ~b~[E]~w~ To Process")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("m-dcollect:client:processes", zone)
                        end
                    end
                end
            end
        end
        Wait(Sleep)
    end
end)


-- Prepare Event -- 
RegisterNetEvent('m-dcollect:client:processes', function(z)
    local Zone = Config.Processes[z]

    local ItemMenu = {
        {
            header = "Process Recipe",
            icon = 'fas fa-vial-virus',
            txt = "",
            isMenuHeader = true,
        },
        {
            header = "Close",
            icon = "fas fa-xmark",
            txt = "",
            params = {
                event = '',
            }
        },
    }

    for k, v in pairsByKeys(Zone.Process.Recipe) do
        ItemMenu[#ItemMenu + 1] = {
            disabled = not HasRequriedItem(v.required),
            icon = k,
            header = "<h3>".. QBCore.Shared.Items[k].label,
            txt = TextBuildForRequired(v.required),
            params = {
                event = 'm-dcollect:client:processitem',
                args = {
                    item = k,                        
                    requiredItems = v.required,   
                    reward = v.reward,   
                    timer = v.time,    
                    zone = z,                
                }
            }
        }
    end
    
    exports[Config.Menu]:openMenu(ItemMenu)
end)

RegisterNetEvent("m-dcollect:client:processitem", function(data)
    local rItems = data.requiredItems
    local z = data.zone
    IsCollecting = true
    IsBusy = true
    QBCore.Functions.RequestAnimDict('mini@repair')
    TaskPlayAnim(PlayerPedId(), 'mini@repair', "fixing_a_ped", 5.0, -1, -1, 49, 0, false, false, false) 
    local LastChecked = GetGameTimer()
    local AFKCheck = math.random(Config.AntiAFKCheck.min, Config.AntiAFKCheck.max)
    CreateThread(function()
        while IsCollecting do 
            local Dists = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.Processes[z].Process.Coords)
            if IsCollecting and not IsEntityPlayingAnim(PlayerPedId(), "mini@repair", "fixing_a_ped", 3) then
                TaskPlayAnim(PlayerPedId(), 'mini@repair' ,"fixing_a_ped", 5.0, -1, -1, 49, 0, false, false, false)
            end
            if Dists > 4.0 then 
                IsCollecting = false
                IsBusy = false
                ClearPedTasks(PlayerPedId())
                TriggerEvent('progressbar:client:cancel')
                break
            end 

            if not HasRequriedItem(rItems) then 
                IsCollecting = false
                IsBusy = false
                ClearPedTasks(PlayerPedId())
                TriggerEvent('progressbar:client:cancel')
                break
            end

            if (GetGameTimer() - LastChecked) >= AFKCheck then
                AntiAFKConfirmation("process", data)
                IsCollecting = false
                IsBusy = false
                ClearPedTasks(PlayerPedId())
                TriggerEvent('progressbar:client:cancel')
                break
            end
            
            Wait(1500)
        end
    end) 
    ProccessFunction(data) 
end)    

function ProccessFunction(data)
    local Item =  data.item
    local Amount = data.reward
    local rItems = data.requiredItems
    local Timer = data.timer
    local z = data.zone

    if IsCollecting then                
        QBCore.Functions.Progressbar('collecting', 'Processing....', Timer, false, true, { 
            disableMovement = false,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = false,
        }, {}, {}, {}, function() -- Play When Done
            if IsCollecting then  
                TriggerServerEvent("m-dcollect:server:makeitems", Item, rItems, Amount, data)
            end
        end, function() -- Play When Cancel
            IsCollecting = false
            IsBusy = false
            ClearPedTasks(PlayerPedId())
        end)
    end
end

RegisterNetEvent("m-dcollect:server:restartprocess",  function(data)
    ProccessFunction(data)
end)

function AntiAFKConfirmation(cType, current)
    CreateThread(function()
        local Confirm = exports.ox_lib:alertDialog({
            header = 'AFK Alert',
            content = 'Confirm, That You Are Not AFK Grinding xD!',
            centered = math.random(0, 1),
            cancel = false
        })

        if cType == "collect" and Confirm == "confirm" then 
            TriggerEvent("m-dcollect:client:buttonpress", current)
        elseif cType == "process" and Confirm == "confirm" then
            TriggerEvent("m-dcollect:client:processitem", current)
        end
    end)
end


function HasRequriedItem(rItems)
    local hasTrueCount = 0
    local itemCount = 0
    for ik = 1, #rItems do
        local items = rItems[ik].name
        local amount = rItems[ik].amount
        local fitem = nil
        local famount = 0
        for _, ivk in pairs(QBCore.Functions.GetPlayerData().items) do
            if items == ivk.name then
                fitem = ivk.name
                local ssAmount = ivk?.amount or ivk?.count
                famount = famount + ssAmount
            end
        end
        if fitem == items and famount >= amount then
            hasTrueCount = hasTrueCount + 1
        end 
        itemCount = itemCount + 1
    end
    if itemCount == hasTrueCount then
        return true
    else
        return false
    end
end

function pairsByKeys(t)
	local a = {}
	for n in pairs(t) do a[#a+1] = n end
	table.sort(a)
	local i = 0
	local iter = function() i = i + 1 if a[i] == nil then return nil else return a[i], t[a[i]] end end
	return iter
end

function TextBuildForRequired(rItems)
    local TextBuild = ''
    for t = 1, #rItems do
        TextBuild = TextBuild .. "-".. QBCore.Shared.Items[rItems[t].name].label .. ' ' .. rItems[t].amount .. "x<br>"
    end
    return TextBuild
end

function DrawText3D(x, y, z, text)
    AddTextEntry('mining3dtxt', text)
    SetFloatingHelpTextWorldPosition(1, x, y, z)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('mining3dtxt')
    EndTextCommandDisplayHelp(2, false, true, -1)
end

function WaitPlayerLoad()
    while not LocalPlayer.state.isLoggedIn do
        Wait(500)
    end
end

