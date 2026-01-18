local QBCore = exports['qb-core']:GetCoreObject()

local targeting = false
local CreatedBlip = {}


CreateThread(function()
    local Blips = lib.callback.await("kael-blip:server:getblips", false)
    ClearBlips()
    if Blips then
        MakeBlips(Blips)
    end
end)

RegisterNetEvent("kael-blip:client:updateblipdata", function()
    local Blips = lib.callback.await("kael-blip:server:getblips", false)
    ClearBlips()
    if Blips then
        MakeBlips(Blips)
    end
end)

RegisterNetEvent("kael-blip:client:opencreatemenu", function()
    local BlipData = {}
    BlipData[#BlipData + 1] = {
        title = 'Add New Blip',
        description = "",
        icon = 'fas fa-plus',
        event = 'kael-blip:client:addnewblipform',
    }

    local Blips = lib.callback.await("kael-blip:server:getblips", false)

    if Blips then 
        for k, v in pairs(Blips) do 
            BlipData[#BlipData + 1] = {
                title = v.b_text,
                description = "",
                icon = 'fab fa-fly',
                event = 'kael-blip:client:openblipsettings',
                args = {
                    id = v.id
                }
            }
        end
    end

    lib.registerContext({
        id = 'blipmenu',
        title = 'Blip Menu',
        options = BlipData
    })
    
    lib.showContext('blipmenu')
end)

RegisterNetEvent("kael-blip:client:addnewblipform", function()
    local Input = lib.inputDialog('Create New Blip', {
        {type = 'input', label = 'Text', description = '', required = true},
        {type = 'input', label = 'Icon', description = ''},
        {type = 'input', label = 'Color', description = ''},
        {type = 'input', label = 'Size', description = ''},
        {type = 'select', label = 'ShortRange', description = '', options = {{value = "1", label = "Yes"}, {value = "0", label = "No"}}},
        {type = 'select', label = 'Flashes', description = '', options = {{value = "1", label = "Yes"}, {value = "0", label = "No"}}},
       
        {type = 'input', label = 'Radius', description = ''},
        {type = 'input', label = 'Radius Color', description = ''},
        {type = 'input', label = 'Alpha', description = ''},
        {type = 'select', label = 'Enabled', description = '', options = {{value = "1", label = "Yes"}, {value = "0", label = "No"}}},

    })

    if Input then 
        GetTargettedVectorOnMouse(Input) 
    end
end)


RegisterNetEvent("kael-blip:client:openblipsettings", function(data)
    local BlipData = lib.callback.await("kael-blip:server:getblipdata", false, data.id)

    local BlipMenu = {
        {
            title = "Settings",
            description = "",
            icon = 'fas fa-wrench',
            event = 'kael-blip:client:settingsmenu',
            args = {
                blipdata = BlipData
            }
        },
        {
            title = "Update Vector",
            description = "",
            icon = 'fas fa-location-pin',
            event = 'kael-blip:client:updatevector',
            args = {
                id = data.id,
            }
        },
        {
            title = "Teleport",
            description = "",
            icon = 'fas fa-location-crosshairs',
            event = 'kael-blip:client:teleporttoblip',
            args = {
                id = data.id,
                coords = BlipData.b_coords
            }
        },
        {
            title = "Remove",
            description = "",
            icon = 'fas fa-trash-can',
            event = 'kael-blip:client:removeblip',
            args = {
                id = data.id,
                text = BlipData.b_text
            }
        },
    }
    
    lib.registerContext({
        id = 'bsettingsmenu',
        title = BlipData.b_text,
        options = BlipMenu
    })
    
    lib.showContext('bsettingsmenu')
end)

RegisterNetEvent('kael-blip:client:settingsmenu', function(data)
    local BlipData = data.blipdata
    local Input = lib.inputDialog('Update: ' .. BlipData.b_text, {
        {type = 'input', label = 'Text', default = BlipData.b_text, description = '', required = true},
        {type = 'input', label = 'Icon', default = BlipData.b_icon, description = ''},
        {type = 'input', label = 'Color', default = BlipData.b_color, description = ''},
        {type = 'input', label = 'Size', default = BlipData.b_size, description = ''},
        {type = 'select', label = 'ShortRange', default = BlipData.b_shortrange, description = '', options = {{value = "1", label = "Yes"}, {value = "0", label = "No"}}},
        {type = 'select', label = 'Flashes', default = BlipData.b_flash, description = '', options = {{value = "1", label = "Yes"}, {value = "0", label = "No"}}},
       
        {type = 'input', label = 'Radius', default = BlipData.b_radius, description = ''},
        {type = 'input', label = 'Radius Color', default = BlipData.b_radius_color, description = ''},
        {type = 'input', label = 'Alpha', default = BlipData.b_alpha, description = ''},
        {type = 'select', label = 'Enabled', default = tostring(BlipData.b_status), description = '', options = {{value = "1", label = "Yes"}, {value = "0", label = "No"}}},
    })

    if Input then 
        TriggerServerEvent("kael-blip:server:updateblip", BlipData.id, Input)
    end
end)

RegisterNetEvent('kael-blip:client:updatevector', function(data)
    UpdateTargetedVector(data.id)
end)

RegisterNetEvent('kael-blip:client:teleporttoblip', function(data)
    local Coords = json.decode(data.coords)
    local coords = vector3(Coords.x, Coords.y, Coords.z)
    SetEntityCoords(PlayerPedId(), coords)
    TriggerEvent("kael-blip:client:openblipsettings", data)
end)

RegisterNetEvent('kael-blip:client:removeblip', function(data)
    local RmBlip = lib.alertDialog({
        header = data.text,
        content = 'Are You Sure To Remove This Blip????',
        centered = true,
        cancel = true
    })

    if RmBlip == "confirm" then
        TriggerServerEvent('kael-blip:server:removeblip', data.id)
    elseif RmBlip == "cancel" then
        TriggerEvent("kael-blip:client:opencreatemenu")
    end
end)

function GetTargettedVectorOnMouse(input)
    CreateThread(function()
        targeting = true
        while targeting do
            Wait(0)
            local hit, coords = RayCastFromCamera(1000.0)
            if hit then
                DrawMarker(
                    28,
                    coords.x, coords.y, coords.z,
                    0.0, 0.0, 0.0,
                    0.0, 0.0, 0.0,
                    0.2, 0.2, 0.2,
                    0, 255, 0, 200,
                    false, true, 2, nil, nil, false
                )
                DrawText3D(coords.x, coords.y, coords.z + 0.8, "[ ~b~E~s~ ] - Save Coords")
            end
            if IsControlJustPressed(0, 38) then -- E
                targeting = false
                TriggerServerEvent("kael-blip:server:makeblip", input, coords)
                break
            end
        end
    end)
end

function UpdateTargetedVector(id)
    CreateThread(function()
        targeting = true
        while targeting do
            Wait(0)
            local hit, coords = RayCastFromCamera(1000.0)
            if hit then
                DrawMarker(
                    28,
                    coords.x, coords.y, coords.z,
                    0.0, 0.0, 0.0,
                    0.0, 0.0, 0.0,
                    0.2, 0.2, 0.2,
                    0, 255, 0, 200,
                    false, true, 2, nil, nil, false
                )
                DrawText3D(coords.x, coords.y, coords.z + 0.8, "[ ~b~E~s~ ] - Save Coords")
            end
            if IsControlJustPressed(0, 38) then -- E
                targeting = false
                TriggerServerEvent("kael-blip:server:updatevector", id, coords)
                break
            end
        end
    end)
end


function RayCastFromCamera(distance)
    local camRot = GetGameplayCamRot()
    local camCoord = GetGameplayCamCoord()

    local direction = RotationToDirection(camRot)
    local destination = camCoord + direction * distance

    local rayHandle = StartShapeTestRay(
        camCoord.x, camCoord.y, camCoord.z,
        destination.x, destination.y, destination.z,
        -1, PlayerPedId(), 0
    )

    local _, hit, endCoords = GetShapeTestResult(rayHandle)
    return hit == 1, endCoords
end

function RotationToDirection(rotation)
    local rotZ = math.rad(rotation.z)
    local rotX = math.rad(rotation.x)
    local cosX = math.abs(math.cos(rotX))

    return vector3(
        -math.sin(rotZ) * cosX,
        math.cos(rotZ) * cosX,
        math.sin(rotX)
    )
end

function MakeBlips(data)
    for k, v in pairs(data) do 
        if tonumber(v.b_status) == 1 then
            local Coords = json.decode(v.b_coords)
            local coords = vector3(Coords.x, Coords.y, Coords.z)
            local icon = v.b_icon ~= "" and tonumber(v.b_icon)
            local size = v.b_size ~= "" and tonumber(v.b_size) + 0.0
            local color = v.b_color ~= "" and tonumber(v.b_color)
            local short = v.b_shortrange ~= "" and tonumber(v.b_shortrange) == 1 and true or false
            local flashes = v.b_flash ~= "" and tonumber(v.b_flash) == 1 and true or false
            local radius = v.b_radius ~= "" and tonumber(v.b_radius) + 0.0
            local radius_color = v.b_radius_color ~= "" and tonumber(v.b_radius_color)
            local alpha = v.b_alpha ~= "" and tonumber(v.b_alpha)
            local text = v.b_text
            MakeRaidZone(coords, icon, size, color, short, flashes, text, radius, radius_color, alpha)
        end
    end
end

function ClearBlips()
    for k, v in pairs(CreatedBlip) do 
        RemoveBlip(v)
    end
end

function MakeRaidZone(coords, icon, size, color, short, flashes, text, radius, radius_color, alpha)
    if radius then
        local RadBlip = AddBlipForRadius(coords, radius)
        SetBlipColour(RadBlip, radius_color)
        SetBlipAlpha(RadBlip, alpha)
        CreatedBlip[#CreatedBlip + 1] = RadBlip
    end
    if icon then
        local Blip = AddBlipForCoord(coords)    
        SetBlipSprite(Blip, icon)
        SetBlipScale(Blip, size)
        SetBlipColour(Blip, color)
        SetBlipAsShortRange(Blip, short)
        SetBlipFlashes(Blip, flashes)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(text)
        EndTextCommandSetBlipName(Blip)
        CreatedBlip[#CreatedBlip + 1] = Blip
    end
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

