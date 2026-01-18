local QBCore = exports["qb-core"]:GetCoreObject()


RegisterCommand(Config.ClothingMneu.command, function(source, args)
    if source == 0 then return end -- console
    local ID = tonumber(args[1])
    local role = Config.ClothingMneu.discordrole
    local HasRole = CheckRole(source, role)
    
    if HasRole then 
        TriggerClientEvent("illenium-appearance:client:openClothingShopMenu", ID, true)
    else
        TriggerClientEvent('okokNotify:Alert', source, 'Admin', 'Not Allowed!', 2002, 'error', false)
    end
end)



function CheckRole(src, role)
    local Role = nil  
    local HasRole = exports.zdiscord:isRolePresent(src, role);
    if HasRole then 
        Role = true
    end
    return Role
end



QBCore.Functions.CreateCallback("mercy-extra:server:checkvehicle", function(source, cb, plate)
    local Player = QBCore.Functions.GetPlayer(source)
    local Result = MySQL.query.await('SELECT * FROM `player_vehicles` WHERE plate = ?', {plate})
    if Result ~= nil and Result[1] ~= nil then 
        cb(true)
    else
        cb(false)
    end
end)