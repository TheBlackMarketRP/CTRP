if GetResourceState('qb-clothing') ~= 'started' then return end

lib.callback.register('ak47_qb_outfitbag:getskin', function(source)
    local result = MySQL.Sync.fetchAll('SELECT skin FROM playerskins WHERE citizenid = ? AND active = 1', {GetIdentifier(source)})
    return result and result[1] and json.decode(result[1].skin)
end)