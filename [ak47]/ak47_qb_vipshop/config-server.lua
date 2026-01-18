SteamWebAPIKey = '' -- change me for profile image

Webhooks = {
    PLAYER_PURCHASE_LOGS = 'https://discord.com/api/webhooks/1450501889991901194/Dwn-ML3HCb8-EZhD8hj_MsTGxQ78aAUlOdz_5JfYJPHjaXMBiWpAWhkeBmxnzQ5muazr', 
    CRATE_PURCHASE_LOGS = 'https://discord.com/api/webhooks/1450501889991901194/Dwn-ML3HCb8-EZhD8hj_MsTGxQ78aAUlOdz_5JfYJPHjaXMBiWpAWhkeBmxnzQ5muazr', 
    DAILY_REWAED_CLAIM_LOGS = 'https://discord.com/api/webhooks/1450501889991901194/Dwn-ML3HCb8-EZhD8hj_MsTGxQ78aAUlOdz_5JfYJPHjaXMBiWpAWhkeBmxnzQ5muazr',
    GIVE_COIN_LOGS = 'https://discord.com/api/webhooks/1450501889991901194/Dwn-ML3HCb8-EZhD8hj_MsTGxQ78aAUlOdz_5JfYJPHjaXMBiWpAWhkeBmxnzQ5muazr',
    REDEEM_LOGS = 'https://discord.com/api/webhooks/1450501889991901194/Dwn-ML3HCb8-EZhD8hj_MsTGxQ78aAUlOdz_5JfYJPHjaXMBiWpAWhkeBmxnzQ5muazr',
    CODE_GENERATE_LOGS = 'https://discord.com/api/webhooks/1450501889991901194/Dwn-ML3HCb8-EZhD8hj_MsTGxQ78aAUlOdz_5JfYJPHjaXMBiWpAWhkeBmxnzQ5muazr',
    ONLINE_PURCHASE_LOGS = 'https://discord.com/api/webhooks/1450501889991901194/Dwn-ML3HCb8-EZhD8hj_MsTGxQ78aAUlOdz_5JfYJPHjaXMBiWpAWhkeBmxnzQ5muazr',
}


function SendDiscordWebhook(webhookUrl, embedTitle, color, fields)
    if not webhookUrl or webhookUrl == '' or webhookUrl:find('YOUR_') then
        return
    end
    local embed = {
        {
            title = embedTitle,
            color = color,
            fields = fields,
            timestamp = os.date("!%Y-%m-%dT%H:%M:%S.000Z"),
            footer = { text = "VIP Shop Logger" }
        }
    }
    
    PerformHttpRequest(webhookUrl, function(errorCode, resultData, resultHeaders)
        if errorCode ~= 204 and errorCode ~= 200 then
            print(string.format('^1[VIPShop Discord Log] Error sending webhook (Code %s) to %s: %s^0', errorCode, embedTitle, resultData or 'Unknown Error'))
        end
    end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
end