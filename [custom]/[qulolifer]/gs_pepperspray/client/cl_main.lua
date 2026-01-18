local isSprayed = false
local sprayStartTimer = 0

RegisterNetEvent('gs_pepperspray:GetSprayed', function()
    local CanPlayerGetSprayed = Functions.CanPlayerBeSprayed()
    local ImmuneClothes = Functions.DoesPedHaveImmuneClothes()
    if CanPlayerGetSprayed and not ImmuneClothes then
        DoSprayEffect()
    end
end)

CreateThread(function()
    if Config.Debug then
        RegisterCommand('pepperspray_effect', function(source, args, raw)
            local targetNet = tonumber(args[1])
            TriggerServerEvent('gs_pepperspray:SprayPlayer', targetNet)
        end)
    end
end)

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local pedWeapon = GetSelectedPedWeapon(ped)
        local ms = 250

        if Config.PepperSprayWeaponHash == pedWeapon then
            ms = 0
            if IsControlPressed(0, Config.SprayDetectionKey) then
                local hit, sprayedPed = IsPlayerHit()
                if hit then
                    local target = NetworkGetPlayerIndexFromPed(sprayedPed)
                    local targetNet = GetPlayerServerId(target)
                    TriggerServerEvent('gs_pepperspray:SprayPlayer', targetNet)
                    ms = 1000
                end
            end
        end

        Wait(ms)
    end
end)

function IsPlayerHit()
    local playerPed = PlayerPedId()
    local playerId = PlayerId()
    local hit, entityHit = GetEntityPlayerIsFreeAimingAt(playerId)

    if not hit or not IsPedAPlayer(entityHit) then
        return false, 0
    end

    if entityHit == playerPed then
        return false, 0
    end

    local pedCoord = GetEntityCoords(playerPed)
    local distance = #(pedCoord - GetEntityCoords(entityHit))

    if (distance > Config.MaxmimumSprayDistance) then
        return false, 0
    end

    local myRotation = GetEntityHeading(playerPed)
    local targetRotation = GetEntityHeading(entityHit)

    if math.abs(myRotation - targetRotation) < Config.MaxmimumSprayAngle then
        return false, 0
    end

    return true, entityHit
end

function DoSprayEffect()
    if (isSprayed) then
        sprayStartTimer = GetGameTimer()
        return
    end
    isSprayed = true
    sprayStartTimer = GetGameTimer()
    Functions.OnPlayerSprayed()
    PlaySprayedAnimation()

    CreateThread(function()
        while isSprayed do
            Wait(0)
            local ped = PlayerPedId()
            if not IsEntityPlayingAnim(ped, Config.Animation.Dict, Config.Animation.Name, 51) then
                PlaySprayedAnimation()
            end

            for _, key in ipairs(Config.DisabledKeysWhenSprayed) do
                DisableControlAction(0, key, false)
            end
        end
    end)

    while GetGameTimer() - sprayStartTimer < Config.SprayEffectTimer do
        local remainingTime = Config.SprayEffectTimer - (GetGameTimer() - sprayStartTimer)

        DoScreenFadeOut(200)
        Wait(200)
        SetTimecycleModifierStrength(1.0 + (3.0 * remainingTime / Config.SprayEffectTimer))
        DoScreenFadeIn(200)
        SetTimecycleModifier(Config.MainTimeCycle)
        SetExtraTimecycleModifier(Config.ExtraTimeCycle)
        Wait(1600)

        if Functions.ShouldSprayEffectStop() then
            break
        end
    end

    DoScreenFadeOut(200)
    Wait(200)
    ClearTimecycleModifier()
    ClearExtraTimecycleModifier()
    isSprayed = false
    StopAnimTask(PlayerPedId(), Config.Animation.Dict, Config.Animation.Name, 1.0)
    DoScreenFadeIn(200)
    Wait(200)
end

function PlaySprayedAnimation()
    CreateThread(function()
        local dict = Config.Animation.Dict
        local anim = Config.Animation.Name

        LoadAnimDict(dict)

        local playerPed = PlayerPedId()
        TaskPlayAnim(playerPed, dict, anim, 8.0, 8.0, -1, 51, 1.0, false, false, false)
    end)
end

function LoadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(10)
    end
end
