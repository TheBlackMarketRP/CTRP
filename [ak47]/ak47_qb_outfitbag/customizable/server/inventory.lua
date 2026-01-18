Citizen.CreateThread(function()
    if Config.Inventory == 'auto' then
        if GetResourceState('ak47_qb_inventory') == 'started' then
            Config.Inventory = 'ak47_qb_inventory'
        elseif GetResourceState('ox_inventory') == 'started' then
            Config.Inventory = 'ox_inventory'
        elseif GetResourceState('qs-inventory') == 'started' then
            Config.Inventory = 'qs-inventory'
        elseif GetResourceState('codem-inventory') == 'started' then
            Config.Inventory = 'codem-inventory'
        elseif GetResourceState('origen_inventory') == 'started' then
            Config.Inventory = 'origen_inventory'
        elseif GetResourceState('tgiann-inventory') == 'started' then
            Config.Inventory = 'tgiann-inventory'
        elseif GetResourceState('qb-inventory') == 'started' then
            Config.Inventory = 'qb-inventory'
        elseif GetResourceState('ps-inventory') == 'started' then
            Config.Inventory = 'ps-inventory'
        elseif GetResourceState('lj-inventory') == 'started' then
            Config.Inventory = 'lj-inventory'
        else
            print('^1Incompatible inventory! Please set your inventory in config.^0')
            return
        end
        print(string.format("^2%s initialized for this script.^0", Config.Inventory))
    end
end)

AddItem = function(source, item, amount, slot, info)
    if Config.Inventory == 'ak47_qb_inventory' then
        exports['ak47_qb_inventory']:AddItem(source, item, 1, slot, info)
    elseif Config.Inventory == 'ox_inventory' then
        exports['ox_inventory']:AddItem(source, item, 1, info)
    elseif Config.Inventory == 'qs-inventory' then
        exports['qs-inventory']:AddItem(source, item, 1, slot, info)
    elseif Config.Inventory == 'codem-inventory' then
        exports['codem-inventory']:AddItem(source, item, 1, slot, info)
    elseif Config.Inventory == 'origen_inventory' then
        exports['origen_inventory']:AddItem(source, item, 1, slot, info)
    elseif Config.Inventory == 'tgiann-inventory' then
        exports['tgiann-inventory']:AddItem(source, item, 1, slot, info)
    elseif Config.Inventory == 'qb-inventory' or Config.Inventory == 'lj-inventory' or Config.Inventory == 'ps-inventory' then
        exports[Config.Inventory]:AddItem(source, item, 1, slot, info)
    end
end

RemoveItem = function(source, item, amount, slot)
    if Config.Inventory == 'ak47_qb_inventory' then
        exports['ak47_qb_inventory']:RemoveItem(source, item, 1, slot)
    elseif Config.Inventory == 'ox_inventory' then
        exports['ox_inventory']:RemoveItem(source, item, 1, nil, slot)
    elseif Config.Inventory == 'qs-inventory' then
        exports['qs-inventory']:RemoveItem(source, item, 1, slot)
    elseif Config.Inventory == 'codem-inventory' then
        exports['codem-inventory']:RemoveItem(source, item, 1, slot)
    elseif Config.Inventory == 'origen_inventory' then
        exports['origen_inventory']:RemoveItem(source, item, 1, slot)
    elseif Config.Inventory == 'tgiann-inventory' then
        exports['tgiann-inventory']:RemoveItem(source, item, 1, slot)
    elseif Config.Inventory == 'qb-inventory' or Config.Inventory == 'lj-inventory' or Config.Inventory == 'ps-inventory' then
        exports[Config.Inventory]:RemoveItem(source, item, 1, slot, info)
    end
end