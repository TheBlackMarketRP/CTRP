CreateThread(function()
    while true do
        local pNear = false

        for key, value in pairs(Sup.Main) do
            -- body
            if #(Modules.Player.GetPos() - value.props.pos.xyz) <= 20 then
                if GetPedRelationshipGroupHash(Sup.Peds[key]) ~= Sup.CIA then
                    Sup.Peds[key] = NetToEnt(Callback.TriggerServerCallback("Sup:GetSpecificPed", Sup.UUID, key))
                    SetPedRelationshipGroupHash(Sup.Peds[key], Sup.CIA)
                end
                pNear = true
                local _, hash = GetCurrentPedWeapon(Modules.Player.GetPed(), true)
                if #(Modules.Player.GetPos() - value.ped.pos.xyz) <= Sup.PedDistanceToAim then 
                    if IsPlayerFreeAiming(PlayerId()) or IsPedInMeleeCombat(Modules.Player.GetPed()) and hash ~= GetHashKey("WEAPON_UNARMED") then
                        local random = math.random(1,3)

                        if random == 1 then
                            if not value.started and not value.done then
                                local cops = Callback.TriggerServerCallback("Sup:CheckForPolice", Sup.UUID)
                                if cops then
                                    value.started = true
                                    TriggerServerEvent("Sup:StartRobberyMyBitch", Sup.UUID, key, random)
                                    Sup.CallCops()
                                    -- Sup.PlayAnimationPeds(key)
                                else
                                    Wait(10000)
                                end
                            end
                        else
                            if not value.started and not value.done then
                                local cops = Callback.TriggerServerCallback("Sup:CheckForPolice", Sup.UUID)
                                if cops then
                                    value.started = true
                                    TriggerServerEvent("Sup:StartRobberyMyBitch", Sup.UUID, key, random)
                                    Sup.CallCops()
                                    -- Sup.SecondAnimation(key)
                                else
                                    Wait(10000)
                                end
                            end
                        end
                    end
                end
            end
        end

        if pNear then
            Wait(1)
        else
            Wait(800)
        end
        Wait(1)
    end
end)
