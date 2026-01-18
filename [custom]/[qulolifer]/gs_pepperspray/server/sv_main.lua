RegisterNetEvent('gs_pepperspray:SprayPlayer', function(target)
    local src = source
    local canApplySpray = Functions.CanPlayerApplySprayEffect(src)
    if (canApplySpray == false) then
        return
    end

    TriggerClientEvent('gs_pepperspray:GetSprayed', target)
end)
