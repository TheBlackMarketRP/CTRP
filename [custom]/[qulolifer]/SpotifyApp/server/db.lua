RegisterNetEvent('spotify:server:saveLibary', function(Library)
    local src = source
    local playerUID = GetPlayerIdentifierByType(src, 'license')

    MySQL.Async.fetchScalar('SELECT COUNT(*) FROM svddenspotify WHERE player_uid = @player_uid', {
        ['@player_uid'] = playerUID
    }, function(count)
        if count > 0 then
            MySQL.Async.execute('UPDATE svddenspotify SET data = @data WHERE player_uid = @player_uid', {
                ['@player_uid'] = playerUID,
                ['@data'] = json.encode(Library)
            })
        else
            MySQL.Async.execute('INSERT INTO svddenspotify (player_uid, data) VALUES (@player_uid, @data)', {
                ['@player_uid'] = playerUID,
                ['@data'] = json.encode(Library)
            })
        end
    end)
end)

RegisterNetEvent('spotify:server:fetchLibrary', function()
    local src = source

    local playerUID = GetPlayerIdentifierByType(src, 'license')

    MySQL.Async.fetchAll('SELECT * FROM svddenspotify WHERE player_uid = @player_uid', {
        ['@player_uid'] = playerUID
    }, function(result)
        if result[1] then
            TriggerClientEvent('spotify:client:retrunlibrary', src, json.decode(result[1].data))
        else
            TriggerClientEvent('spotify:client:retrunlibrary', src, {})
        end
    end)
end)

MySQL.ready(function()
    MySQL.Async.execute([[
        CREATE TABLE IF NOT EXISTS svddenspotify (
            player_uid VARCHAR(255),
            data LONGTEXT
        )
    ]])
end)