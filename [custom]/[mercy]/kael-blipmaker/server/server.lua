local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand(Config.CreationCommand, function(source, _)
    TriggerClientEvent("kael-blip:client:opencreatemenu", source)
end, true)

lib.callback.register("kael-blip:server:getblips", function(source)
    local blips = MySQL.query.await("SELECT * FROM `kael_blip`")
    if blips and blips[1] ~= nil then
        return blips
    else
        return false
    end
end)

lib.callback.register("kael-blip:server:getblipdata", function(source, id)
    local blips = MySQL.query.await("SELECT * FROM `kael_blip` WHERE `id` = ?", {id})
    if blips and blips[1] ~= nil then
        return blips[1]
    else
        return false
    end
end)

RegisterNetEvent("kael-blip:server:makeblip", function(data, coords)
    local source = source
    local Coords = {x = coords.x, y = coords.y, z = coords.z}
    Coords = json.encode(Coords)
    MySQL.query.await("INSERT INTO `kael_blip` (`b_coords`, `b_icon`, `b_size`, `b_color`, `b_shortrange`, `b_radius`, `b_radius_color`, `b_alpha`, `b_text`, `b_flash`, `b_status`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", { Coords, data[2], data[4], data[3], data[5], data[7], data[8], data[9], data[1], data[6], data[10]})
    TriggerClientEvent("kael-blip:client:updateblipdata", -1)
    TriggerClientEvent("kael-blip:client:opencreatemenu", source)
end)

RegisterNetEvent("kael-blip:server:updateblip", function(id, data)
    local source = source
    MySQL.query.await("UPDATE `kael_blip` SET `b_icon` = ?, `b_size` = ?, `b_color` = ?, `b_shortrange` = ?, `b_radius` = ?, `b_radius_color` = ?, `b_alpha` = ?, `b_text` = ?, `b_flash` = ?, `b_status` = ? WHERE `id` = ?", {data[2], data[4], data[3], data[5], data[7], data[8], data[9], data[1], data[6], data[10], id})
    TriggerClientEvent("kael-blip:client:updateblipdata", -1)
    TriggerClientEvent("kael-blip:client:openblipsettings", source, {id = id})
end)

RegisterNetEvent('kael-blip:server:updatevector', function(id, coords)
    local source = source
    local Coords = {x = coords.x, y = coords.y, z = coords.z}
    Coords = json.encode(Coords)
    MySQL.query.await("UPDATE `kael_blip` SET `b_coords` = ? WHERE `id` = ?", {Coords, id})
    TriggerClientEvent("kael-blip:client:updateblipdata", -1)
    TriggerClientEvent("kael-blip:client:openblipsettings", source, {id = id})
end)


RegisterNetEvent('kael-blip:server:removeblip', function(id)
    local source = source
    MySQL.query.await("DELETE FROM `kael_blip` WHERE `id` = ?", {id})
    TriggerClientEvent("kael-blip:client:updateblipdata", -1)
    TriggerClientEvent("kael-blip:client:opencreatemenu", source)
end)