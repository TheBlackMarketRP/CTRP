Notify = function(msg, type)
    exports['ox_lib']:notify({
        type = type or 'info',
        description = msg,
        position = 'top',
    })
end

-- Don't change below
RegisterNetEvent('ak47_qb_outfitbag:notify', Notify)