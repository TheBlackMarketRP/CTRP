

local Webhooks = {
    ['default'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['testwebhook'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['playermoney'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['playerinventory'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['robbing'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['cuffing'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['drop'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['trunk'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['stash'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['glovebox'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['banking'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['vehicleshop'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['vehicleupgrades'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['shops'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['dealers'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['storerobbery'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['bankrobbery'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['powerplants'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['death'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['joinleave'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['ooc'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['report'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['me'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['pmelding'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['112'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['bans'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['anticheat'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['weather'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['moneysafes'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['bennys'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['bossmenu'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['robbery'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['casino'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['traphouse'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['911'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['palert'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['house'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
    ['qbjobs'] = 'https://discord.com/api/webhooks/1450499512362864744/vUllcjvKz1AdrmhmTX92cUBDiUoZZ_YNqqh81BQScmz7Aag07irDO7m0cVPXA4JPZHnn',
}

local colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ['lightgreen'] = 65309,
}

local logQueue = {}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone, imageUrl)
    local tag = tagEveryone or false

    if Config.Logging == 'discord' then
        if not Webhooks[name] then
            print('Tried to call a log that isn\'t configured with the name of ' .. name)
            return
        end
        local webHook = Webhooks[name] ~= '' and Webhooks[name] or Webhooks['default']
        local embedData = {
            {
                ['title'] = title,
                ['color'] = colors[color] or colors['default'],
                ['footer'] = {
                    ['text'] = os.date('%c'),
                },
                ['description'] = message,
                ['author'] = {
                    ['name'] = 'QBCore Logs',
                    ['icon_url'] = 'https://raw.githubusercontent.com/GhzGarage/qb-media-kit/main/Display%20Pictures/Logo%20-%20Display%20Picture%20-%20Stylized%20-%20Red.png',
                },
                ['image'] = imageUrl and imageUrl ~= '' and { ['url'] = imageUrl } or nil,
            }
        }

        if not logQueue[name] then logQueue[name] = {} end
        logQueue[name][#logQueue[name] + 1] = { webhook = webHook, data = embedData }

        if #logQueue[name] >= 10 then
            local postData = { username = 'QB Logs', embeds = {} }

            if tag then
                postData.content = '@everyone'
            end

            for i = 1, #logQueue[name] do postData.embeds[#postData.embeds + 1] = logQueue[name][i].data[1] end
            PerformHttpRequest(logQueue[name][1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
            logQueue[name] = {}
        end
    elseif Config.Logging == 'fivemanage' then
        local FiveManageAPIKey = GetConvar('FIVEMANAGE_LOGS_API_KEY', 'false')
        if FiveManageAPIKey == 'false' then
            print('You need to set the FiveManage API key in your server.cfg')
            return
        end
        local extraData = {
            level = tagEveryone and 'warn' or 'info', -- info, warn, error or debug
            message = title,                          -- any string
            metadata = {                              -- a table or object with any properties you want
                description = message,
                playerId = source,
                playerLicense = GetPlayerIdentifierByType(source, 'license'),
                playerDiscord = GetPlayerIdentifierByType(source, 'discord')
            },
            resource = GetInvokingResource(),
        }
        PerformHttpRequest('https://api.fivemanage.com/api/logs', function(statusCode, response, headers)
            -- Uncomment the following line to enable debugging
            -- print(statusCode, response, json.encode(headers))
        end, 'POST', json.encode(extraData), {
            ['Authorization'] = FiveManageAPIKey,
            ['Content-Type'] = 'application/json',
        })
    end
end)

Citizen.CreateThread(function()
    local timer = 0
    while true do
        Wait(1000)
        timer = timer + 1
        if timer >= 60 then -- If 60 seconds have passed, post the logs
            timer = 0
            for name, queue in pairs(logQueue) do
                if #queue > 0 then
                    local postData = { username = 'QB Logs', embeds = {} }
                    for i = 1, #queue do
                        postData.embeds[#postData.embeds + 1] = queue[i].data[1]
                    end
                    PerformHttpRequest(queue[1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
                    logQueue[name] = {}
                end
            end
        end
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
