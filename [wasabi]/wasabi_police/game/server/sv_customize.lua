-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
local QBCore = exports['qb-core']:GetCoreObject()
local webhook = 'https://discord.com/api/webhooks/1450496242902630470/6johBugbVg5fnXNe-ED94nK1ahlxxRBX4PA6Moezw0-bb-q7xTgX9QHsJpH1P9mH9SQ_'



if not wsb then return print((Strings.no_wsb):format(GetCurrentResourceName())) end

-- Customize the way it pulls user identification info?
wsb.registerCallback('wasabi_police:checkPlayerId', function(source, cb, target)
    local data = wsb.getPlayerIdentity(target)
    cb(data)
end)

-- Customize the way it deposits LEO fines, etc
function PaySociety(accountName, amount)
    if wsb.framework == 'qb' then
        local management = Config.OldQBManagement and 'qb-management' or 'qb-banking'
        exports[management]:AddMoney(accountName, amount)
        return
    end
    -- If not QB, assume esx
    TriggerEvent('esx_addonaccount:getSharedAccount', accountName, function(account)
        if account then
            account.addMoney(amount)
            return
        end
        -- if account doesn't exist, try adding society_ prefix
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..accountName, function(societyAccount)
            if not societyAccount then
                print(Strings.no_society_account:format(accountName))
                return
            end
            societyAccount.addMoney(amount)
        end)
    end)
end

--Death check
deathCheck = function(serverId)
    local player = wsb.getPlayer(serverId)
    if not player then return end
    local state = Player(serverId).state
    return state.dead or
        state.isDead or
        player?.PlayerData?.metadata?['isdead'] or
        false
end

wsb.registerCallback('wasabi_police:revokeLicense', function(source, cb, id, license)
    if not wsb.hasLicense(id, license) then return cb(false) end
    wsb.revokeLicense(id, license)
    cb(true)
end)

if wsb.framework == 'qb' then
    wsb.registerCallback('wasabi_police:isPlayerDead', function(source, cb, id)
        local player = wsb.getPlayer(id)
        if not player then
            cb(false)
            return
        end
        cb(player.PlayerData.metadata['isdead'])
    end)
end

if wsb.framework == 'esx' then
    CreateThread(function()
        for i = 1, #Config.policeJobs do
            TriggerEvent('esx_society:registerSociety', Config.policeJobs[i], Config.policeJobs[i],
                'society_' .. Config.policeJobs[i], 'society_' .. Config.policeJobs[i], 'society_' ..
                Config.policeJobs[i], { type = 'public' })
        end
    end)
end

wsb.registerCallback('wasabi_police:getIdentifier', function(source, cb, target)
    if not wsb.getPlayer(target) then return cb(false) end
    cb(wsb.getIdentifier(target))
end)


--mercy custom code
RegisterNetEvent("mercy-police:server:searchplayer", function(cid)
    local src = source
    local totalcount = 0 
    local MsgData = ''
    local Searchableitems = {
            'markedbills',
            'cokebaggy',
            'rawmeth',
            'meth',
            'crack_baggy',
            'cocaine',
            'lean',
            'leancup',
            'xannax',
            'fentanyl',
            'pillpress',
            'earrings',
            'chain',
            'ring',
            'painting',
            'bracelet',
       

    }
    local Police = QBCore.Functions.GetPlayer(source)
    local Criminal = QBCore.Functions.GetPlayer(cid)
    local Criminalitems = Criminal.PlayerData.items 
    
    
    for k, v in pairs(Searchableitems) do 
        for j, i in pairs(Criminalitems) do
            if v == i.name then 
                Criminal.Functions.RemoveItem(v, i.count)
                if i.name == 'markedbills' then 
                    Police.Functions.AddItem(v, i.count)
                end
                totalcount = totalcount + 1
                MsgData = MsgData .. "```yaml\nItem: " .. i.name .. " | Amount: " .. i.count ..  "\n```"
            end
        end
    end
    if totalcount == 0 then 
        -- TriggerClientEvent('QBCore:Notify', source, 'They are Clean', 'success')
        TriggerClientEvent('okokNotify:Alert', source, 'Police Search', 'They are Clean', 2000, 'success', false)
    else   
        TriggerClientEvent('okokNotify:Alert', source, 'Police Search', 'They are Dirty', 2000, 'error', false)

        local embedData = {
            { 
                ['title'] = 'Police Search by: ' .. GetPlayerName(src) .. ' from: ' .. GetPlayerName(cid), 
                ['color'] = 1146986,
                ['footer'] = { 
                    ['text'] = 'Found On: ' .. os.date( "!%a %b %d, %H:%M", os.time() + 6 * 60 * 60 ), 
                },
                ['description'] = MsgData,
                ['author'] = { 
                    ['name'] = 'mercy-bot', 
                    ['icon_url'] = '', 
                },
            }
        }
        SendToDiscord(webhook, embedData)
    
    end
end)


-- Steal Player Function --
RegisterNetEvent("mercy-police:server:stealplayer", function(cid)
    local src = source
    local totalcount = 0 
    local MsgData = ''
    local Searchableitems = {
            'markedbills',
    }
    local Player = QBCore.Functions.GetPlayer(source)
    local Criminal = QBCore.Functions.GetPlayer(cid)
    if not Criminal then 
        TriggerClientEvent('okokNotify:Alert', src, 'Player Steal', 'No one nearby!', 2000, 'error', false)
        return false
    end
    local Criminalitems = Criminal.PlayerData.items 
    
    if not Criminal.PlayerData.metadata.isdead or not Criminal.PlayerData.metadata.inlaststand then 
        TriggerClientEvent('okokNotify:Alert', src, 'Player Steal', 'They are not dead!', 2000, 'error', false)
        return false
    end 
    
    for k, v in pairs(Searchableitems) do 
        for j, i in pairs(Criminalitems) do
            if v == i.name then 
                if i.name == 'markedbills' then 
                    local Count = i.count
                    local StealAmount = Count
                    if Count >= 50000 then
                        StealAmount = math.random(10000, 50000)
                    end
                    Criminal.Functions.RemoveItem(v, StealAmount)
                    Player.Functions.AddItem(v, StealAmount)
                    MsgData = MsgData .. "```yaml\nItem: " .. i.name .. " | Amount: " .. StealAmount ..  "\n```"

                else
                    Criminal.Functions.RemoveItem(v, i.count)
                    Player.Functions.AddItem(v, i.count)
                    MsgData = MsgData .. "```yaml\nItem: " .. i.name .. " | Amount: " .. i.count ..  "\n```"

                end
                totalcount = totalcount + 1
            end
        end
    end

    if totalcount == 0 then 
        -- TriggerClientEvent('QBCore:Notify', source, 'They are Clean', 'success')
        TriggerClientEvent('okokNotify:Alert', source, 'Player Steal', 'They dont have any black money', 2000, 'error', false)
    else   
        -- TriggerClientEvent('okokNotify:Alert', source, 'Player Steal', 'They are Dirty', 2000, 'error', false)

        local embedData = {
            { 
                ['title'] = 'Player Item Stolen by: ' .. GetPlayerName(src) .. ' from: ' .. GetPlayerName(cid), 
                ['color'] = 1146986,
                ['footer'] = { 
                    ['text'] = 'Found On: ' .. os.date( "!%a %b %d, %H:%M", os.time() + 6 * 60 * 60 ), 
                },
                ['description'] = MsgData,
                ['author'] = { 
                    ['name'] = 'mercy-bot', 
                    ['icon_url'] = '', 
                },
            }
        }
        SendToDiscord(webhook, embedData)
    
    end
end)

--musroom redzone loot player funcion
RegisterNetEvent("mercy-police:server:lootplayer", function(cid)
    local src = source
    local totalcount = 0 
    local MsgData = ''
    local Searchableitems = {
            'markedbills',
            'cokebaggy',
            'rawmeth',
            'meth',
            'crack_baggy',
            'cocaine',
            'lean',
            'leancup',
            'xannax',
            'fentanyl',
            'pillpress',
            'earrings',
            'chain',
            'ring',
            'painting',
            'bracelet',
            'shroom_pouch',
            'shroom',
            'weed_ak47',
            'plugbrick',
            'weed_ak47_cbd_crop',
            'weed_tak47',
            'ogkushleaf',
            'ogkushnug',
            'weed_ogkush',
            'leaftrim',
            'leafbag',
            'leafraw',
            'ttiger_breath',
            'rtiger_breath',
            'tiger_breath',
            'tigerbrick',
            'leafbrick',
            'ak47brick',
            'kushbrick',
    }
    local Player = QBCore.Functions.GetPlayer(source)
    local Criminal = QBCore.Functions.GetPlayer(cid)
    if not Criminal then 
        TriggerClientEvent('okokNotify:Alert', src, 'Player Steal', 'No one nearby!', 2000, 'error', false)
        return false
    end
    local Criminalitems = Criminal.PlayerData.items 
    
    if not Criminal.PlayerData.metadata.isdead or not Criminal.PlayerData.metadata.inlaststand then 
        TriggerClientEvent('okokNotify:Alert', src, 'Player Steal', 'They are not dead!', 2000, 'error', false)
        return false
    end 
    
    for k, v in pairs(Searchableitems) do 
        for j, i in pairs(Criminalitems) do
            if v == i.name then 
                if i.name == 'markedbills' then 
                    local Count = i.count
                    local StealAmount = Count
                    if Count >= 50000 then
                        StealAmount = math.random(10000, 50000)
                    end
                    Criminal.Functions.RemoveItem(v, StealAmount)
                    Player.Functions.AddItem(v, StealAmount)
                    MsgData = MsgData .. "```yaml\nItem: " .. i.name .. " | Amount: " .. StealAmount ..  "\n```"

                else
                    Criminal.Functions.RemoveItem(v, i.count)
                    Player.Functions.AddItem(v, i.count)
                    MsgData = MsgData .. "```yaml\nItem: " .. i.name .. " | Amount: " .. i.count ..  "\n```"

                end
                totalcount = totalcount + 1
            end
        end
    end

    if totalcount == 0 then 
        -- TriggerClientEvent('QBCore:Notify', source, 'They are Clean', 'success')
        TriggerClientEvent('okokNotify:Alert', source, 'Player Steal', 'They dont have any black money', 2000, 'error', false)
    else   
        -- TriggerClientEvent('okokNotify:Alert', source, 'Player Steal', 'They are Dirty', 2000, 'error', false)

        local embedData = {
            { 
                ['title'] = 'Player Item Stolen by: ' .. GetPlayerName(src) .. ' from: ' .. GetPlayerName(cid), 
                ['color'] = 1146986,
                ['footer'] = { 
                    ['text'] = 'Found On: ' .. os.date( "!%a %b %d, %H:%M", os.time() + 6 * 60 * 60 ), 
                },
                ['description'] = MsgData,
                ['author'] = { 
                    ['name'] = 'mercy-bot', 
                    ['icon_url'] = '', 
                },
            }
        }
        SendToDiscord(webhook, embedData)
    
    end
end)

function SendToDiscord(hook, embedData)
    PerformHttpRequest(hook, function() end, 'POST', json.encode({ username = 'Weapon Logs', embeds = embedData}), { ['Content-Type'] = 'application/json' })
end


-- Kael Custom Codes --

RegisterNetEvent("wasabi_police:server:getgun", function()
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        Player.Functions.AddItem(Config.GunItem, 1)
    end
end)

RegisterNetEvent("wasabi_police:server:getammo", function()
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        Player.Functions.AddItem(Config.AmmoItem, Config.AmmoAmount)
    end
end)