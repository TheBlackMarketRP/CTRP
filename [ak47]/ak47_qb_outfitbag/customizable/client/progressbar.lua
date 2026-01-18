ShowProgress = function(progressData)
    --follows ox_lib progress https://overextended.dev/ox_lib/Modules/Interface/Client/progress

    return lib.progressCircle({
        label = progressData.label,
        duration = progressData.duration,
        disable = progressData.disable,
        canCancel = progressData.canCancel,
        anim = progressData.anim,
    })
end

-- Don't change below
RegisterNetEvent('ak47_qb_outfitbag:progress', ShowProgress)
lib.callback.register('ak47_qb_outfitbag:progress', ShowProgress)