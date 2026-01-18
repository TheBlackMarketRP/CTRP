CreateThread(function()
    if GetResourceState('ox_target') == 'started' then
        for i, v in pairs(Config.Storage) do
            exports['qb-target']:AddBoxZone('ak47_qb_mechanic:storage'..i, vector3(v.position.x, v.position.y, v.position.z - 1.0), 1.2, 1.2, {
                name = 'ak47_qb_mechanic:storage'..i,
                heading = v.position.w,
                debugPoly = Config.Debug,
                minZ = v.position.z - 1.0 - 1,
                maxZ = v.position.z + 1.0 - 1,
                }, {
                options = {
                    {
                        label = _U('storage'),
                        icon = 'fa-solid fa-box',
                        canInteract = function(entity)
                            return PlayerData and PlayerData.job and v.job == PlayerData.job.name
                        end,
                        action = function(entity)
                            OpenStorageMenu(i)
                        end
                    },
                },
                distance = 2.5,
            })
        end
    else
        CreateThread(function()
            while true do
                Wait(1000)
                local playerCoords = GetEntityCoords(cache.ped)
                for i, v in pairs(Config.Storage) do
                    local position = vector3(v.position.x, v.position.y, v.position.z)
                    local distance = #(playerCoords - position)
                    if distance < 5.0 and PlayerData.job.name == v.job then
                        while distance < 5.0 do
                            Wait(1)
                            playerCoords = GetEntityCoords(cache.ped)
                            position = vector3(v.position.x, v.position.y, v.position.z)
                            distance = #(playerCoords - position)
                            if distance < 2.0 then
                                DrawText3D(v.position.x, v.position.y, v.position.z, _U('pressstorage'))
                            else
                                DrawText3D(v.position.x, v.position.y, v.position.z, _U('storage'))
                            end
                            if IsControlJustReleased(0, 38) then
                                OpenStorageMenu(i)
                            end
                        end
                    end
                end
            end
        end)
    end

    exports['qb-target']:AddGlobalVehicle({
        options = {
            {
                name = 'ak47_qb_mechanic:attach',
                label = _U('attach_tow'),
                icon = 'fas fa-link',
                action = function(entity)
                    if not Config.MechanicJobs[PlayerData.job.name] then return end
                    if not FirstVehicle then
                        if not Config.TowRopeVehicles[GetEntityModel(entity)] then return end
                        FirstVehicle = entity
                        AttachRopeTemp(entity, true)
                    elseif not SecondVehicle then
                        if entity == FirstVehicle then
                            return
                        end
                        SecondVehicle = entity
                        AttachRope()
                    end
                end,
                canInteract = function(entity)
                    if not Config.MechanicJobs[PlayerData.job.name] then return end
                    local playerPed = PlayerPedId()
                    if IsPedInAnyVehicle(playerPed, false) then return false end
                    if RopeHandle ~= nil then return false end
                    if Config.BlacklistedClasses[GetVehicleClass(entity)] then return false end
                    if SecondVehicle ~= nil then return false end
                    return true
                end,
            },
            {
                name = 'ak47_qb_mechanic:detach',
                label = _U('detach_tow'),
                icon = 'fas fa-unlink',
                action = function(entity)
                    DetachRope()
                end,
                canInteract = function(entity)
                    if not Config.MechanicJobs[PlayerData.job.name] then return end
                    if entity == FirstVehicle or entity == SecondVehicle then
                        return true
                    end
                    return false
                end
            },
            {
                name = 'ak47_qb_mechanic:cancel',
                label = _U('cancel_tow'),
                icon = 'fas fa-times',
                action = function(entity)
                    DetachRope()
                end,
                canInteract = function(entity)
                    if not Config.MechanicJobs[PlayerData.job.name] then return end
                    if FirstVehicle ~= nil and SecondVehicle == nil then
                        return true
                    end
                    return false
                end
            },
            {
                name = 'ak47_qb_mechanic:towvehicle',
                label = _U('tow_vehicle'),
                icon = 'fas fa-car-burst',
                canInteract = function(entity)
                    return Config.TowVehicles[GetEntityModel(entity)] and PlayerData.job and Config.MechanicJobs[PlayerData.job.name]
                end,
                action = function(entity)
                    selectTowedVehicle(entity)
                end,
            },
            {
                name = 'ak47_qb_mechanic:releasevehicle',
                label = _U('release_vehicle'),
                icon = 'fas fa-car-burst',
                canInteract = function(entity)
                    return Config.TowVehicles[GetEntityModel(entity)] and PlayerData.job and Config.MechanicJobs[PlayerData.job.name]
                end,
                action = function(entity)
                    local istow = lib.callback.await('ak47_qb_mechanic:isatowvehicle', nil, NetworkGetNetworkIdFromEntity(entity))
                    if istow then
                        selectDetachVehicle(entity, istow)
                    else
                        Notify(_U('not_tow'), 'error')
                    end
                end,
            },
            {
                name = 'ak47_qb_mechanic:diagnostic',
                label = _U('diagnostic'),
                icon = 'fas fa-user-gear',
                canInteract = function(entity)
                    return PlayerData.job and Config.MechanicJobs[PlayerData.job.name]
                end,
                action = function(entity)
                    OpenDiagnosticMenu(entity)
                end,
            },
        },
        distance = 3.0,
    })
    
    if GetResourceState('ox_target') == 'started' then
        for i, v in pairs(Config.Stash) do
            exports['qb-target']:AddBoxZone('ak47_qb_mechanic:stash'..i, vector3(v.position.x, v.position.y, v.position.z - 1.0), v.size.x, v.size.y, {
                name = 'ak47_qb_mechanic:stash'..i,
                heading = v.rotation,
                debugPoly = Config.Debug,
                minZ = v.position.z - v.size.z - 1.0,
                maxZ = v.position.z + v.size.z - 1.0,
            },{
                options = {
                    {
                        label = _U('stash'),
                        icon = 'fa-solid fa-box',
                        canInteract = function(entity)
                            return PlayerData and PlayerData.job and v.jobs[PlayerData.job.name] and GetPlayerJobRank() >= v.jobs[PlayerData.job.name]
                        end,
                        action = function(entity)
                            local identifier = 'mechanic:stash:'..i
                            if not v.shared then
                                identifier = identifier..':'..Identifier
                            end
                            OpenStash(identifier, v.name, v.weight, v.slots)
                        end
                    },
                },
                distance = 2.5,
            })
        end
    else
        CreateThread(function()
            while true do
                Wait(1000)
                local playerCoords = GetEntityCoords(cache.ped)
                for i, v in pairs(Config.Stash) do
                    local position = vector3(v.position.x, v.position.y, v.position.z)
                    local distance = #(playerCoords - position)
                    if distance < 5.0 and v.jobs[PlayerData.job.name] and GetPlayerJobRank() >= v.jobs[PlayerData.job.name] then
                        while distance < 5.0 do
                            Wait(1)
                            playerCoords = GetEntityCoords(cache.ped)
                            position = vector3(v.position.x, v.position.y, v.position.z)
                            distance = #(playerCoords - position)
                            if distance < 2.0 then
                                DrawText3D(v.position.x, v.position.y, v.position.z, _U('pressstash'))
                            else
                                DrawText3D(v.position.x, v.position.y, v.position.z, _U('stash'))
                            end
                            if IsControlJustReleased(0, 38) then
                                local identifier = 'mechanic:stash:'..i
                                if not v.shared then
                                    identifier = identifier..':'..Identifier
                                end
                                OpenStash(identifier, v.name, v.weight, v.slots)
                            end
                        end
                    end
                end
            end
        end)
    end
end)