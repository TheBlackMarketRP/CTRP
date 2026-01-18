local QBCore = exports[Config.Core]:GetCoreObject()
local Hook = "https://discord.com/api/webhooks/1453131070278078577/k3LivH5hmytTAK5reOdRD7UTnzx4jzHJoJhyXCY3-2Q1ozqXHzRtdwl4UjkethoUvg2u"

RegisterNetEvent('m-dcollect:server:giveritems', function(item, amount, id)
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = math.random(amount)
    Player.Functions.AddItem(item, amount)
    TriggerClientEvent("m-dcollect:server:restartcollect", source, id)
    
    local MsgData = ""
    MsgData = MsgData .. "```yaml\nItem: " .. item .. " | Amount: " .. amount ..  "\n```"

    local embedData = {
        { 
            ['title'] = GetPlayerName(source) .. ' Collected Drugs: ', 
            ['color'] = 1146986,
            ['footer'] = { 
                ['text'] = 'Posted On: ' .. os.date( "!%a %b %d, %H:%M", os.time() + 6 * 60 * 60 ), 
            },
            ['description'] = MsgData,
            ['author'] = { 
                ['name'] = "collection-log", 
                ['icon_url'] = "", 
            },
        }
    }
    SendToDiscord(Hook, embedData)
end)

RegisterNetEvent('m-dcollect:server:makeitems', function(item, rItems, reward, data)
    local Player = QBCore.Functions.GetPlayer(source)
    local hasTrueCount = 0
    for _, i in pairs(rItems) do 
        local ItemFind = Player.Functions.GetItemByName(i.name)
        local ItemAmount = ItemFind?.amount or ItemFind?.count
        if ItemFind and ItemAmount >= i.amount then 
            hasTrueCount = hasTrueCount + 1
        end
    end  
    if #rItems == hasTrueCount then 
        for _, i in pairs(rItems) do 
            Player.Functions.RemoveItem(i.name, i.amount)
        end   
        Player.Functions.AddItem(item, reward)        
        TriggerClientEvent("m-dcollect:server:restartprocess", source, data)
        local MsgData = ""
        MsgData = MsgData .. "```yaml\nItem: " .. item .. " | Amount: " .. reward ..  "\n```"

        local embedData = {
            { 
                ['title'] = GetPlayerName(source) .. ' Proccessed Drugs: ', 
                ['color'] = 1146986,
                ['footer'] = { 
                    ['text'] = 'Posted On: ' .. os.date( "!%a %b %d, %H:%M", os.time() + 6 * 60 * 60 ), 
                },
                ['description'] = MsgData,
                ['author'] = { 
                    ['name'] = "process-log", 
                    ['icon_url'] = "", 
                },
            }
        }
        SendToDiscord(Hook, embedData)  
    else
        TriggerClientEvent('QBCore:Notify', source, "Something went wront", "error")
    end
end)


function SendToDiscord(hook, embedData)
    PerformHttpRequest(hook, function() end, 'POST', json.encode({ username = 'Kael BOT', embeds = embedData}), { ['Content-Type'] = 'application/json' })
end