if Config.Logs ~= 'discord' then return end

local discordWebhook = 'https://discord.com/api/webhooks/1450498253144588511/LRR90dfOhsCxVlJ7ByV69rvAqko0fu2BsXglLAPgnT2ODn76LAsVLXmfZhSPRYCSivFi'

local discord = {
    send = function(title, description, color)
        local embed = {
            {
                ["title"] = title,
                ["description"] = description,
                ["color"] = color,
                ["footer"] = {
                    ["text"] = 'TeamsGG Development',
                },
            }
        }
        PerformHttpRequest(discordWebhook, function(err, text, headers) end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
    end
}

Logs = {
    TransferVehicle = function(buyer, seller, vehModel, vehDescription, vehPrice, plate)
        discord.send('VEHICLE SALE',
            ('**Vehicle model:** %s \n**Vehicle description:** %s \n**Plate:** %s \n**Buyer identifier:** %s \n**Seller identifier:** %s \n**Price:** $%s'):format(vehModel, vehDescription, plate, buyer, seller, vehPrice), 65280)
    end,
}
