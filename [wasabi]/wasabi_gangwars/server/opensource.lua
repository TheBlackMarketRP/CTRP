-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
Config.DiscordWebhook = ''

function IsStaff(src)
    for i = 1, #Config.StaffGroups do
        if wsb.hasPermission(src, Config.StaffGroups[i]) then
            return true
        end
    end

    if IsPlayerAceAllowed(src, 'gangwars.staff') then return true end

    return false
end