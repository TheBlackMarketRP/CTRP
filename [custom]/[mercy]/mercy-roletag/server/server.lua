local QBCore = exports[Config.Core]:GetCoreObject()

QBCore.Functions.CreateCallback('mercy-roletag:client:getconfig', function(source, cb)
    cb(Config.Tags)
end)

RegisterCommand(Config.Command, function(source, args)
    local src = source
    local Tag = args[1]
    local Role = GetRoleType(src, Tag)
    if Role then 
        if not Config.Tags[src] then 
            Config.Tags[src] = {
                src = src, 
                role = Role
            }
        elseif Config.Tags[src] then
            Config.Tags[src] = nil
        end
        TriggerClientEvent('mercy-roletag:client:updateconfig', -1, Config.Tags)
    else
        TriggerClientEvent('QBCore:Notify', src, "You Don't have The Role", 'error')
    end
    
end)

function GetRoleType(src, tag)
    local Role = nil  
    local HasRole = exports.zdiscord:isRolePresent(src, Config.Roles[tag].DiscordRoleID);
    if HasRole then 
        Role = tag
    end
    return Role
end

AddEventHandler("playerDropped", function(reason)
    local src = source
    if Config.Tags[src] then 
        Config.Tags[src] = nil
        TriggerClientEvent('mercy-roletag:client:updateconfig', -1, Config.Tags)
    end
end)