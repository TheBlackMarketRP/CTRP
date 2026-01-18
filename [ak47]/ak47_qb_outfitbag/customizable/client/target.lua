local targets = {}

CreateBagTarget = function(bagid)
    local coords = GetEntityCoords(Bags[bagid].prop)
    local target = exports[Config.TargetScript]:AddCircleZone("outfitbag:"..bagid, coords, 0.5, {
        name = "outfitbag:"..bagid,
        debugPoly = Config.Debug,
    },
    {
        options = {
            {
                icon = "fas fa-eye",
                label = _U('shareout'),
                canInteract = function()
                    return Config.Bags[Bags[bagid].item].canShare and Bags[bagid].owner == Identifier and not Bags[bagid].shared
                end,
                action = function(entity)
                    TriggerServerEvent('ak47_qb_outfitbag:setshared', bagid, true)
                end
            },
            {
                icon = "fas fa-eye-slash",
                label = _U('makeprivate'),
                canInteract = function()
                    return Bags[bagid].owner == Identifier and Bags[bagid].shared
                end,
                action = function(entity)
                    TriggerServerEvent('ak47_qb_outfitbag:setshared', bagid, false)
                end
            },
            {
                icon = "fas fa-briefcase",
                label = _U('outfits'),
                canInteract = function()
                    return Bags[bagid].owner == Identifier or Bags[bagid].shared
                end,
                action = function(entity)
                    OpenOutfitsMenu(bagid)
                end
            },
            {
                icon = "fas fa-person-walking-luggage",
                label = _U('pickup'),
                canInteract = function()
                    return Bags[bagid].owner == Identifier
                end,
                action = function(entity)
                    playAnimBag(bagid)
                    if ShowProgress({
                        duration = 1500,
                        disable = {
                            combat = true,
                            move = true,
                            car = true
                        },
                        canCancel = true,
                    }) then
                        TriggerServerEvent('ak47_qb_outfitbag:pickup', bagid)
                    end
                    ClearPedTasks(cache.ped)
                end
            },
        },
        distance = 2.0
    })
    Bags[bagid].target = target
end

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        for i, v in pairs(Bags) do
            if GetResourceState('ox_target') == 'started' then
                exports[Config.TargetScript]:RemoveZone(v.target)
            else
                exports[Config.TargetScript]:RemoveZone(v.target.name)
            end
            DeleteEntity(v.prop)
        end
    end
end)