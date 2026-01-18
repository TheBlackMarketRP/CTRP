local QBCore = exports[Config.Core]:GetCoreObject()
local GiftBoxProp = nil



RegisterNetEvent("kael-starter:client:opengivemneu", function(id, name, sex, job)
    local MenuData = {}

    for k, v in pairs(Config.Packs) do
        MenuData[#MenuData + 1] = {
            title = v.name,
            description = "Click to give starter pack",
            icon = 'nui://ox_inventory/web/images/' .. QBCore.Shared.Items[k].image,
            event = 'kael-starter:client:givepack',
            arrow = false,
            args = {
                id = id,
                item = k
            }
        }    
    end
    exports.ox_lib:registerContext({
        id = 'starter_menu',
        title = "(" .. id .. ") " .. name ..  " | " .. sex .. " | " .. job,
        options = MenuData
    })

    exports.ox_lib:showContext('starter_menu')
end)

RegisterNetEvent("kael-starter:client:givepack", function(data)
    local TargetId = data.id
    local PackId = data.item
    TriggerServerEvent("kael-starter:server:givepack", TargetId, PackId)
end)

RegisterNetEvent("kael-starter:client:openbox", function(item)
    local PlayerPed = PlayerPedId()
    local PlayerCoords = GetEntityCoords(PlayerPed)
    local ForwardCoords = GetEntityForwardVector(PlayerPed)
    local x, y, z = table.unpack(PlayerCoords + ForwardCoords * 0.9)

    local Model = Config.BoxModel
    QBCore.Functions.LoadModel(Model)
    GiftBoxProp = CreateObject(GetHashKey(Model), x, y, z, true, true, false)
    PlaceObjectOnGroundProperly(GiftBoxProp)
    Wait(500)
    FreezeEntityPosition(GiftBoxProp, true)

    QBCore.Functions.Progressbar("puttinggiftbox", "Opening Gift Box..", 5500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        anim = "machinic_loop_mechandplayer",
        flags = 51,
    }, {}, {}, function() -- Done 
        DeleteEntity(GiftBoxProp)
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent("kael-starter:client:openbox", item)
    end, function() -- Cancel
        DeleteEntity(GiftBoxProp)
        ClearPedTasks(PlayerPedId())
    end)         
end)

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
    DeleteEntity(GiftBoxProp)
end)