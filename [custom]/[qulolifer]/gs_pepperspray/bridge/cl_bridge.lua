Functions = {}

-- If this function returns true, the player will receive the pepper-spray effect
-- If this function returns false, the player will not receive the pepper-spray effect or the pepper-spray effect will be canceled
Functions.CanPlayerBeSprayed = function()
    local ped = PlayerPedId()
    local isDead = IsPedDeadOrDying(ped, true)
    local isPedInAnyVehicle = IsPedInAnyVehicle(ped, false)

    return (not isDead and not isPedInAnyVehicle)
end

-- If this function returns true, the pepper-spray effect will be stopped.
-- If this function returns false, the pepper-spray effect will continue untill the timer is over.
Functions.ShouldSprayEffectStop = function()
    local ped = PlayerPedId()
    local isDead = IsPedDeadOrDying(ped, true)

    return (isDead)
end

-- Check if the ped has clothes which are immune to pepper-spray, like glasses or masks.
Functions.DoesPedHaveImmuneClothes = function()
    local immuneClothes = false

    -- This code below only works with skinchanger, but you can change it to the clothing script you are using
    if (GetResourceState('skinchanger') ~= 'started') then
        return immuneClothes
    end

    local skinReceived = false
    while (not skinReceived) do
        Wait(0)

        TriggerEvent('skinchanger:getSkin', function(skin)
            local gender = 'male'
            if (skin.sex == 1) then gender = 'female' end
            local clothesToCheck = Config.ImmuneClothes[gender]

            for clothing, component in pairs(skin) do
                if (clothesToCheck[clothing] ~= nil) then
                    for _, value in ipairs(clothesToCheck[clothing]) do
                        if (value == component) then
                            immuneClothes = true
                            break
                        end
                    end
                end
            end

            -- Ensure the function waits for the event handler above to finish
            skinReceived = true
        end)
    end

    return immuneClothes
end

Functions.OnPlayerSprayed = function()
    -- This function is triggered right before a player gets sprayed, you can execute any additional code you want here
end