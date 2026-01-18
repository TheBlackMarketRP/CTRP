local IsAnimated = false

RegisterNetEvent('ak47_qb_business:onEat')
AddEventHandler('ak47_qb_business:onEat', function(data)
    local data = data
    if not IsAnimated then
        IsAnimated = true
        local playerPed = PlayerPedId()
        if data then
            TriggerServerEvent('ak47_qb_business:removeItem', data.item)

            if data.prepare then
                if GetResourceState('rpemotes') == 'started' or GetResourceState('rpemotes-reborn') == 'started' or GetResourceState('dpemotes') == 'started' then
                    ExecuteCommand('e '..data.prepare.emote)
                else
                    print('^3Please use rpemotes-reborn for food animation with prop^0')
                    PlayerDefaultEat()
                end
                lib.progressCircle({
                    duration = data.prepare.delay,
                    label = _U('preparing')
                })
            end

            Citizen.CreateThread(function()
                if data.stress then
                    Notify(_U('rstress'))
                    if data.stress.add then
                        local div = (data.stress.add or 0) / (data.stress.delay / 1000)
                        while data.stress.delay >= 0 do
                            Citizen.Wait(1000)
                            data.stress.delay = data.stress.delay - 1000
                        end
                        TriggerServerEvent('hud:server:GainStress', math.floor(data.stress.add))
                    else
                        local div = (data.stress.remove or 0) / (data.stress.delay / 1000)
                        while data.stress.delay >= 0 do
                            Citizen.Wait(1000)
                            data.stress.delay = data.stress.delay - 1000
                        end
                        TriggerServerEvent('hud:server:RelieveStress', math.floor(data.stress.remove))
                    end
                end
            end)

            if data.hunger then
                Citizen.CreateThread(function()
                    lib.progressCircle({
                        duration = data.hunger.delay,
                        label = _U('eating')
                    })
                end)
                if data.hunger.emote then
                    if GetResourceState('rpemotes') == 'started' or GetResourceState('rpemotes-reborn') == 'started' or GetResourceState('dpemotes') == 'started' then
                        ExecuteCommand('e '..data.hunger.emote)
                    else
                        print('^3Please use rpemotes-reborn for food animation with prop^0')
                        PlayerDefaultEat()
                    end
                end
                if data.hunger.add then
                    local div = (data.hunger.add or 0) / (data.hunger.delay / 1000)
                    while data.hunger.delay >= 0 do
                        Citizen.Wait(1000)
                        data.hunger.delay = data.hunger.delay - 1000
                        TriggerServerEvent("ak47_qb_business:SetMetaData", 'hunger', QBCore.Functions.GetPlayerData().metadata['hunger'] + div)
                    end
                else
                    local div = (data.hunger.remove or 0) / (data.hunger.delay / 1000)
                    while data.hunger.delay >= 0 do
                        Citizen.Wait(1000)
                        data.hunger.delay = data.hunger.delay - 1000
                        TriggerServerEvent("ak47_qb_business:SetMetaData", 'hunger', QBCore.Functions.GetPlayerData().metadata['hunger'] - div)
                    end
                end
            end

            if data.thirst then
                Citizen.CreateThread(function()
                    lib.progressCircle({
                        duration = data.thirst.delay,
                        label = _U('drinking')
                    })
                end)
                if data.thirst.emote then
                    if GetResourceState('rpemotes') == 'started' or GetResourceState('rpemotes-reborn') == 'started' or GetResourceState('dpemotes') == 'started' then
                        ExecuteCommand('e '..data.thirst.emote)
                    else
                        print('^3Please use rpemotes-reborn for food animation with prop^0')
                        PlayerDefaultDrink()
                    end
                end
                if data.thirst.add then
                    local div = (data.thirst.add or 0) / (data.thirst.delay / 1000)
                    while data.thirst.delay >= 0 do
                        Citizen.Wait(1000)
                        data.thirst.delay = data.thirst.delay - 1000
                        TriggerServerEvent("ak47_qb_business:SetMetaData", 'thirst', QBCore.Functions.GetPlayerData().metadata['thirst'] + div)
                    end
                else
                    local div = (data.thirst.remove or 0) / (data.thirst.delay / 1000)
                    while data.thirst.delay >= 0 do
                        Citizen.Wait(1000)
                        data.thirst.delay = data.thirst.delay - 1000
                        TriggerServerEvent("ak47_qb_business:SetMetaData", 'thirst', QBCore.Functions.GetPlayerData().metadata['thirst'] - div)
                    end
                end
            end
            if GetResourceState('rpemotes') == 'started' or GetResourceState('rpemotes-reborn') == 'started' or GetResourceState('dpemotes') == 'started' then
                ExecuteCommand('emotecancel')
            else
                print('^3Please use rpemotes-reborn for food animation with prop^0')
                ClearPedTasks(playerPed)
            end
            IsAnimated = false
        else
            print('^3Usable data of this item is not set proparly^0')
        end
    end
end)

PlayerDefaultEat = function()
    local playerPed = PlayerPedId()
    lib.requestAnimDict('mp_player_inteat@burger')
    TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)
end

PlayerDefaultDrink = function()
    local playerPed = PlayerPedId()
    lib.requestAnimDict('mp_player_intdrink')
    TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 49, 0, 0, 0, 0)
end