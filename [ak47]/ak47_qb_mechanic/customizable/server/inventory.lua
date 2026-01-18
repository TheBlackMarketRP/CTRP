RegisterNetEvent('ak47_qb_mechanic:registeroxinventory', function(identifier, data)
    exports["ox_inventory"]:RegisterStash(identifier, identifier, data.slots, data.weight * 1000)
end)

RegisterNetEvent('ak47_qb_mechanic:OpenQbStash', function(identifier, data)
    exports["qb-inventory"]:OpenInventory(source, identifier, data)
end)