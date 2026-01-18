RemoveQuality = function(item, amount)
    -- if you have inventory trigger to remove item quality
    TriggerServerEvent('ak47_inventory:removequality', item, amount, true)
end