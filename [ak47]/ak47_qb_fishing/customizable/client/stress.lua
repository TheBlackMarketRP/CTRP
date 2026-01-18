AddStress = function(amount)
    TriggerServerEvent('hud:server:GainStress', amount)
end

RemoveStress = function(amount)
    TriggerServerEvent('hud:server:RelieveStress', amount)
end