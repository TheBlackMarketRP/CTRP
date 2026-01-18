function Sup.PlayAnimationPeds(key)
    TriggerServerEvent("Sup:StartRobbery", Sup.UUID, key)
    Modules.Utils.LoadAnimDict("mp_am_hold_up")
    local obj = GetClosestObjectOfType(Sup.Main[key].props.pos.xyz, 1.0, Sup.Main[key].props.hash, true, true, true)
    SetEntityRotation(Sup.Peds[key], GetEntityRotation(obj) + vector3(0, 0, 180.0))
    local scene2 = NetworkCreateSynchronisedScene(Sup.Main[key].props.pos.xyz,
        GetEntityRotation(obj) + vector3(0, 0, 180.0), 2, true, false, 1065353216.0, 0, 10.0)
    NetworkAddPedToSynchronisedScene(Sup.Peds[key], scene2, "mp_am_hold_up", "holdup_victim_20s", 8.0, -8.0,
        1033, 1148846080, 0, 0)
    NetworkAddEntityToSynchronisedScene(obj, scene2, "mp_am_hold_up", "holdup_victim_20s_till", 8.0, -8.0, 1)
    NetworkStartSynchronisedScene(scene2)
    Modules.UI.RealWait(11000)
    local bag = CreateObject(GetHashKey(Sup.Main[key].bag), GetEntityCoords(Sup.Peds[key]), false, false)
    SetEntityAsMissionEntity(bag, true, true)
    AttachEntityToEntity(bag, Sup.Peds[key], GetPedBoneIndex(Sup.Peds[key], 60309), 0.1, -0.11, 0.08, 0.0, -75.0, -75.0,
        1, 1, 0, 0, 2, 1)
    CreateModelSwap(GetEntityCoords(obj), 0.5, GetHashKey('prop_till_01'), GetHashKey('prop_till_01_dam'), false)
    Modules.UI.RealWait(10000)
    DetachEntity(bag, true, false)
    ApplyForceToEntity(bag, 3, vector3(0.0, 50.0, 0.0), 0.0, 0.0, 0.0, 0, true, true, false, false, true)
    Modules.UI.RealWait(2500)
    local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(Sup.Peds[key]),
        GetEntityRotation(Sup.Peds[key]), 2, false, true, 1065353216.0, 0, 10.0)
    NetworkAddPedToSynchronisedScene(Sup.Peds[key], scene3, "mp_am_hold_up", "handsup_base", 8.0, -8.0,
        1033, 1148846080, 0, 0)
    NetworkStartSynchronisedScene(scene3)

    CreateThread(function()
        while not Sup.Main[key].done do
            if #(Modules.Player.GetPos() - GetEntityCoords(bag)) <= 1.5 then
                Sup.Main[key].done = true
                TriggerServerEvent("Sup:DoneRobbery", Sup.UUID, key)
                DeleteEntity(bag)
                ---ADD ITEM
                PlaySoundFrontend(-1, "PICKUP_WEAPON_SMOKEGRENADE", "HUD_FRONTEND_WEAPONS_PICKUPS_SOUNDSET", 1)
                if Sup.MoneyUse then
                    local money = Callback.TriggerServerCallback("Sup:GiveMoney", Sup.UUID, Sup.MoneyType,
                        Sup.Main[key].reward)
                    while money == nil do Wait(1) end
                    if money then
                        if Sup.Notification == "gtav" then
                            Modules.Utils.ShowNotification(Sup.Language['received'] ..
                                Sup.Main[key].reward .. "~s~" .. Sup.Language["money"])
                        else
                            Sup.ShowNotification(Sup.Language['received'] ..
                                Sup.Main[key].reward .. "~s~" .. Sup.Language["money"])
                        end
                    end
                end
            end
            Wait(1)
        end
    end)
end

function Sup.SecondAnimation(key)
    TriggerServerEvent("Sup:StartRobbery", Sup.UUID, key)
    local rot = GetEntityRotation(Sup.Peds[key])
    local pos = GetEntityCoords(Sup.Peds[key])
    local scene2 = NetworkCreateSynchronisedScene(pos,
        rot, 2, true, false, 1065353216.0, 0, 10.0)
    NetworkAddPedToSynchronisedScene(Sup.Peds[key], scene2, "mp_am_hold_up", "cower_intro", 8.0, -8.0,
        1033, 1148846080, 0, 0)
    NetworkStartSynchronisedScene(scene2)
    Modules.UI.RealWait(GetAnimDuration("mp_am_hold_up", "cower_intro") * 1000)
    local scene3 = NetworkCreateSynchronisedScene(pos,
        rot, 2, false, true, 1065353216.0, 0, 10.0)
    NetworkAddPedToSynchronisedScene(Sup.Peds[key], scene3, "mp_am_hold_up", "cower_loop", 8.0, -8.0,
        1033, 1148846080, 0, 0)
    NetworkStartSynchronisedScene(scene3)
    CreateThread(function()
        while not Sup.Main[key].done do
            if #(Modules.Player.GetPos() - Sup.Main[key].scene.pos) <= 1.5 then
                if Sup.Notification == "gtav" then
                    Modules.Utils.ShowHelpNotification(Sup.Language["collect"])
                else
                    Sup.ShowHelpNotification(Sup.Language["collect"])
                end
                if IsControlJustPressed(0, 38) then
                    TriggerServerEvent("Sup:DoneRobbery", Sup.UUID, key)
                    Sup.Main[key].done = true
                    Sup.PlayAnimation(key)
                end
            end
            Wait(1)
        end
    end)
end

function Sup.PlayAnimation(key)
    Modules.Cam.create("Winner")
    Modules.Cam.setPos("Winner", Sup.Main[key].scene.cam.pos)
    Modules.Cam.setFov("Winner", Sup.Main[key].scene.cam.fov)
    Modules.Cam.lookAtCoords("Winner", Sup.Main[key].scene.cam.lookAt)
    Modules.Cam.render("Winner", true, false, 0)
    Modules.Cam.shake("Winner", "DRUNK_SHAKE", 0.5)

    Modules.Utils.LoadAnimDict("oddjobs@shop_robbery@rob_till")
    local rot = Sup.Main[key].scene.rot
    local scene1 = NetworkCreateSynchronisedScene(Sup.Main[key].scene.pos,
        rot, 2, true, false, 1065353216.0, 0, 10.0)
    NetworkAddPedToSynchronisedScene(Modules.Player.GetPed(), scene1, "oddjobs@shop_robbery@rob_till", "enter", 8.0, -
        8.0
        , 1033, 1148846080, 0, 0)
    NetworkStartSynchronisedScene(scene1)
    Modules.UI.RealWait(GetAnimDuration("oddjobs@shop_robbery@rob_till", "enter") * 1000)
    local scene2 = NetworkCreateSynchronisedScene(Sup.Main[key].scene.pos,
        rot, 2, false, true, 1065353216.0, 0, 10.0)
    NetworkAddPedToSynchronisedScene(Modules.Player.GetPed(), scene2, "oddjobs@shop_robbery@rob_till", "loop", 8.0, -8.0
        ,
        1033, 1148846080, 0, 0)
    NetworkStartSynchronisedScene(scene2)
    CreateThread(function()
        for i = 1, Sup.TakeMoneyTime do
            -- body
            Wait(1000)
            PlaySoundFrontend(-1, "PICKUP_WEAPON_SMOKEGRENADE", "HUD_FRONTEND_WEAPONS_PICKUPS_SOUNDSET", 1)
        end

    end)
    Modules.UI.RealWait(Sup.TakeMoneyTime * 1000)
    PlaySoundFrontend(-1, "PICKUP_WEAPON_SMOKEGRENADE", "HUD_FRONTEND_WEAPONS_PICKUPS_SOUNDSET", 1)
    if Sup.MoneyUse then
        local money = Callback.TriggerServerCallback("Sup:GiveMoney", Sup.UUID, Sup.MoneyType, Sup.Main[key].scene.reward)
        while money == nil do Wait(1) end

        if money then
            if Sup.Notification == "gtav" then
                Modules.Utils.ShowNotification(Sup.Language['received'] ..
                    Sup.Main[key].scene.reward .. "~s~" .. Sup.Language["money"])
            else
                Sup.ShowNotification(Sup.Language['received'] ..
                    Sup.Main[key].scene.reward .. "~s~" .. Sup.Language["money"])
            end
        end
    end

    local scene3 = NetworkCreateSynchronisedScene(Sup.Main[key].scene.pos,
        rot, 2, true, false, 1065353216.0, 0, 10.0)
    NetworkAddPedToSynchronisedScene(Modules.Player.GetPed(), scene3, "oddjobs@shop_robbery@rob_till", "exit", 8.0, -8.0
        ,
        1033, 1148846080, 0, 0)
    NetworkStartSynchronisedScene(scene3)
    Modules.UI.RealWait(GetAnimDuration("oddjobs@shop_robbery@rob_till", "exit") * 1000)
    ClearPedTasks(Modules.Player.GetPed())
    Modules.Cam.render("Winner", false, true, 1000)
    Modules.UI.RealWait(1000)
    Modules.Cam.delete("Winner")


end

RegisterNetEvent("Sup:StartRobberyMyBitch")
AddEventHandler("Sup:StartRobberyMyBitch", function(key, random)
    if random == 1 then
        Sup.PlayAnimationPeds(key)
    else
        Sup.SecondAnimation(key)

    end
end)
