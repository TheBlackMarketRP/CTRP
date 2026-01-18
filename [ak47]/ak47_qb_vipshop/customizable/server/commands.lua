RegisterCommand(Config.OpenShopCommand, function(source, args, rawCommand)
    TriggerClientEvent('ak47_qb_vipshop:client:openShop', source)
end, false)
