-- Written by UnLuckyLust ( © Dreams Weaver 2023 ) | Purchase only at https://UnLuckyLust.tebex.io

--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
-------------------------------------- ███╗   ██╗ ██████╗ ████████╗██╗███████╗██╗   ██╗ ----------------------------------------
-------------------------------------- ████╗  ██║██╔═══██╗╚══██╔══╝██║██╔════╝╚██╗ ██╔╝ ----------------------------------------
-------------------------------------- ██╔██╗ ██║██║   ██║   ██║   ██║█████╗   ╚████╔╝ -----------------------------------------
-------------------------------------- ██║╚██╗██║██║   ██║   ██║   ██║██╔══╝    ╚██╔╝ ------------------------------------------
-------------------------------------- ██║ ╚████║╚██████╔╝   ██║   ██║██║        ██║ -------------------------------------------
--| source = 'client' or source id --- ╚═╝  ╚═══╝ ╚═════╝    ╚═╝   ╚═╝╚═╝        ╚═╝ -------------------------------------------                                         
 function Message(source, title, text, style, time)
    if not title then title = Config['Notify']['Default'].Title end
    if not style then style = Config['Notify']['Default']['Template'].Primary end
    if not time then time = Config['Notify']['Default'].Display_Time end
    if source and text then
        if Config['Notify'].Core == 'standalone' then -- ull-essential built in Notifications
            if source == 'client' then
                exports['ull-essential']:Notify(text, style, time)
            else
                TriggerClientEvent('ull:essential:notify', source, text, style, time)
            end
        elseif Config['Notify'].Core == 'ull' then -- UnLuckyLust Notify {Get it free - https://unluckylust.tebex.io}
            if source == 'client' then
                exports['ull-notify']:notify(title, text, style, time)
            else
                TriggerClientEvent('ull:notify', source, title, text, style, time)
            end

        elseif Config['Notify'].Core == 'qb' then -- QBcore Notify 
            if source == 'client' then
                exports['qb-core']:GetCoreObject().Functions.Notify(text, style)
            else
                TriggerClientEvent('QBCore:Notify', source, text, style)
            end
            
        elseif Config['Notify'].Core == 'esx' then -- ESX Legacy Notify
            if source == 'client' then
                exports["esx_notify"]:Notify(style, time, text)
            else
                TriggerClientEvent("ESX:Notify", source, style, time, text)
            end

        elseif Config['Notify'].Core == 'okok' then -- okok Notify
            if source == 'client' then
                exports['okokNotify']:Alert(title, text, time, style)
            else
                TriggerClientEvent('okokNotify:Alert', source, title, text, time, style)
            end
            
        elseif Config['Notify'].Core == 'custom' then -- Custom Notify
            if source == 'client' then

            -- Custom notification script - Client side notification export
            else
            
            -- Custom notification script - Server side notification event
            end
        else
            if Config['Debug'].Active then print(Local[Config.Language]["Debugs"].Error_Notify) end -- Debug
        end
    end
 end
 exports("Message", Message)
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
----------------------- ██████╗ ███████╗██████╗ ███╗   ███╗███╗   ███╗██╗███████╗██╗ ██████╗ ███╗   ██╗ ------------------------
----------------------- ██╔══██╗██╔════╝██╔══██╗████╗ ████║████╗ ████║██║██╔════╝██║██╔═══██╗████╗  ██║ ------------------------
----------------------- ██████╔╝█████╗  ██████╔╝██╔████╔██║██╔████╔██║██║███████╗██║██║   ██║██╔██╗ ██║ ------------------------
----------------------- ██╔═══╝ ██╔══╝  ██╔══██╗██║╚██╔╝██║██║╚██╔╝██║██║╚════██║██║██║   ██║██║╚██╗██║ ------------------------
----------------------- ██║     ███████╗██║  ██║██║ ╚═╝ ██║██║ ╚═╝ ██║██║███████║██║╚██████╔╝██║ ╚████║ ------------------------
--| Server Side Only! - ╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝     ╚═╝╚═╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ------------------------                                                                           
 function Permissions(player, permission, core)
    if player and permission then
        if tonumber(player) <= 0 then
            print("No valid client found")
        else
            local Has_Permissions = false
            if not core or core == nil then
                if IsPlayerAceAllowed(player, permission) then
                    Has_Permissions = true
                end
            elseif core == 'qb' then
                local QB = exports['qb-core']:GetCoreObject()
                if QB.Functions.HasPermission(player, permission) then
                    Has_Permissions = true
                end
            elseif core == 'esx' then
                local ESX = exports['es_extended']:getSharedObject()
                local xPlayer = ESX.GetPlayerFromId(player)
                local xPermission = xPlayer.getGroup()
                if xPermission == permission then
                    Has_Permissions = true
                end
            end
            return Has_Permissions
        end
    end
 end
 exports("Permissions", Permissions)