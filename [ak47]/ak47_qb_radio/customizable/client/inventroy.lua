RegisterNetEvent('ak47_inventory:onRemoveItem', function(item, amount, slot, has)
    if item == 'radio' and has <= 0 then
        RemovePlayerFromRadio()
    end
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    Wait(1000)
    if not QBCore.Functions.HasItem('radio', 1) then
        RemovePlayerFromRadio()
    end
end)