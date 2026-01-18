Citizen.CreateThread(function()
    if Config.Inventory == 'auto' then
        if GetResourceState('ak47_qb_inventory') == 'started' then
            Config.Inventory = 'ak47_qb_inventory'
        elseif GetResourceState('ox_inventory') == 'started' then
            Config.Inventory = 'ox_inventory'
        elseif GetResourceState('qs-inventory') == 'started' then
            Config.Inventory = 'qs-inventory'
        elseif GetResourceState('qb-inventory') == 'started' then
            Config.Inventory = 'qb-inventory'
        elseif GetResourceState('ps-inventory') == 'started' then
            Config.Inventory = 'ps-inventory'
        elseif GetResourceState('lj-inventory') == 'started' then
            Config.Inventory = 'lj-inventory'
        elseif GetResourceState('codem-inventory') == 'started' then
            Config.Inventory = 'codem-inventory'
        elseif GetResourceState('origen_inventory') == 'started' then
            Config.Inventory = 'origen_inventory'
        elseif GetResourceState('tgiann-inventory') == 'started' then
            Config.Inventory = 'tgiann-inventory'
        elseif GetResourceState('cheeza_inventory') == 'started' then
            Config.Inventory = 'cheeza_inventory'
        end
    end
end)

OpenStash = function(identifier, name, weight, slots)
    if Config.Inventory == 'ak47_qb_inventory' then
        exports["ak47_qb_inventory"]:OpenInventory({identifier = identifier, type = 'stash', label = name, maxWeight = weight * 1000, slots = slots})
    elseif Config.Inventory == 'qb-inventory-old' then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", identifier, {maxweight = weight * 1000, slots = slots})
        TriggerEvent("inventory:client:SetCurrentStash", identifier)
    elseif Config.Inventory == 'ps-inventory' then
        TriggerServerEvent("ps-inventory:server:OpenInventory", "stash", identifier, {maxweight = weight * 1000, slots = slots})
        TriggerEvent("ps-inventory:client:SetCurrentStash", identifier)
    elseif Config.Inventory == 'qb-inventory' then
        TriggerServerEvent("ak47_qb_mechanic:OpenQbStash", identifier, {maxweight = weight * 1000, slots = slots, label = name})
    elseif Config.Inventory == 'ox_inventory' then
        TriggerServerEvent('ak47_qb_mechanic:registeroxinventory', identifier, {weight = weight, slots = slots}, uid)
        exports["ox_inventory"]:openInventory('stash', identifier)
    elseif Config.Inventory == 'qs-inventory' then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", identifier, {maxweight = weight, slots = slots})
        TriggerEvent("inventory:client:SetCurrentStash", identifier)
    elseif Config.Inventory == 'cheeza_inventory' then
        TriggerEvent('inventory:openHouse', name, identifier, "Stash", weight)
    elseif Config.Inventory == 'core_inventory' then
        TriggerServerEvent('core_inventory:server:openInventory', identifier, 'stash')
    elseif Config.Inventory == 'codem-inventory' then
        TriggerServerEvent('codem-inventory:server:openstash', identifier, slots, weight, identifier)
    end
end
