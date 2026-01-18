local QBCore = exports['qb-core']:GetCoreObject()
local OnCollection = false
Notify = function(msg, type)
    lib.notify({
        type = type or 'info',
        description = msg,
        position = 'top',
    })

    -- QB Notify
    --QBCore.Functions.Notify(msg, type)
end

ShowProgress = function(progressData, success, cancel)
    OnCollection = true
    -- QBCore.Functions.RequestAnimDict('mini@repair')
    -- TaskPlayAnim(PlayerPedId(), 'mini@repair', "fixing_a_ped", 5.0, -1, -1, 49, 0, false, false, false) 

    -- while OnCollection do
    --     success()
    --     Wait(progressData.duration)
    -- end
    if lib.progressCircle({
        label = progressData.label,
        duration = progressData.duration,
        disable = false,
        canCancel = progressData.canCancel,
        anim = progressData.anim,
    }) then
        OnCollection = false
        success()
    else
        OnCollection = false
        cancel()
    end

    -- Qb Progress
    --[[
    QBCore.Functions.Progressbar('drugmanagerv2:collect', progressData.label, progressData.duration, false, progressData.canCancel, {
        disableMovement = progressData.disable.move, 
        disableCarMovement = progressData.disable.car, 
        disableMouse = progressData.disable.mouse, 
        disableCombat = progressData.disable.combat
    },{
        animDict = progressData.anim and progressData.anim.dict, 
        anim = progressData.anim and progressData.anim.clip,
        flags = progressData.anim and progressData.anim.flag,
    }, nil, nil, function()
        success()
    end, function()
        cancel()
    end)
    ]]
end

CancleProgress = function()
    OnCollection = false
    ClearPedTasks(PlayerPedId())
    if lib.progressActive() then
        lib.cancelProgress()
    end

    -- Qb Progress
    --TriggerEvent('progressbar:client:cancel')
end


-- AK47 Freeze Fix – Allows walking while collecting
-- This overrides any freeze loops AK47 Drug Manager uses.


-- CreateThread(function()
--     while true do 
--         if OnCollection and not IsEntityPlayingAnim(PlayerPedId(), "mini@repair", "fixing_a_ped", 3) then
--             TaskPlayAnim(PlayerPedId(), 'mini@repair' ,"fixing_a_ped", 5.0, -1, -1, 49, 0, false, false, false)
--         end
--         Wait(2000)
--     end
-- end)

-- -- Hard override: some AK47 versions freeze EVERY FRAME.
-- -- This forces the player to stay mobile no matter what.
CreateThread(function()
    while true do
        if OnCollection then
            local ped = PlayerPedId()
            FreezeEntityPosition(ped, false)
        end
        Wait(0)
    end
end)
