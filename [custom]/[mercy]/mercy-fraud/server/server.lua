local QBCore = exports[Config.Core]:GetCoreObject()

QBCore.Functions.CreateUseableItem('fraudgnei', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent('mercy-fraud:client:spawnobj', src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem('fraudlaptop', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent('mercy-fraud:client:spawnobj', src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem('fraudprinter', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent('mercy-fraud:client:spawnobj', src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem('fraudscaner', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent('mercy-fraud:client:spawnobj', src, item.name)
    end
end)

RegisterNetEvent('mercy-fraud:server:removespawnditem', function(item) 
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName(item)
    if item then 
        Player.Functions.RemoveItem(item, 1)
        -- TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "remove", 1)
    end
end)

RegisterNetEvent('mercy-fraud:server:pickupobjectadd', function(item) 
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem(item, 1)
    -- TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add", 1)
end)

QBCore.Functions.CreateCallback("mercy-fraud:server:giverewarditems", function(source, cb, items)
    local Player = QBCore.Functions.GetPlayer(source)
    -- for k, v in pairs(items) do 
    --     Player.Functions.AddItem(v, 1)
    --     TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[v], "add", 1)
    -- end
    local RandomItem = items[math.random(#items)]
    Player.Functions.AddItem(RandomItem, 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[RandomItem], "add", 1)
    cb(true)
end)

QBCore.Functions.CreateCallback("mercy-fraud:server:sellitemtobuyer", function(source, cb, item, price)
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName(item)
    local Amount = Item.amount
    if Item then 
        local Price = Amount * price
        Player.Functions.RemoveItem(item, Amount)
        -- TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "remove", Amount)
        Player.Functions.AddMoney(Config.Buyer.MoneyType, Price)
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('mercy-fraud:server:removevisaafterfail', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName(Config.FakeCardItem)
    if Item then 
        Player.Functions.RemoveItem(Config.FakeCardItem, 1)
        -- TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.FakeCardItem], "remove", 1)
    end
end)

RegisterNetEvent('mercy-fraud:server:giveatmreward', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local Money = math.random(Config.AtmFraudReward.min, Config.AtmFraudReward.max)
    Player.Functions.AddMoney('cash', Money, "atm fraud")

    if math.random(100) <= Config.LoseCardChance then 
        Player.Functions.RemoveItem(Config.FakeCardItem, 1)
    end
end)

RegisterNetEvent('mercy-fraud:server:givecheckreward', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local Money = math.random(Config.ChequeReward.min, Config.ChequeReward.max)
    Player.Functions.AddMoney('cash', Money, "cheque fraud")
end)


-- Saving Stuff Database -- 

QBCore.Functions.CreateCallback('mercy-fraud:server:getfraudsetup', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Owner = Player.PlayerData.citizenid
    local Find = MySQL.query.await('SELECT * FROM `kael_fraud` WHERE m_owner = ?', { Owner })
    if Find ~= nil and Find[1] ~= nil then
        cb(Find[1])
    else
        cb(false)
    end
end)

RegisterNetEvent('mercy-fraud:server:savegeni', function(genicoords, heading)
    local Player = QBCore.Functions.GetPlayer(source)
    local Owner = Player.PlayerData.citizenid
    local Find = MySQL.query.await('SELECT * FROM `kael_fraud` WHERE m_owner = ?', { Owner })
    if Find ~= nil and Find[1] ~= nil then
        MySQL.query.await('UPDATE `kael_fraud` SET m_geni = ?, m_geni_heading = ? WHERE m_owner = ?', { genicoords, heading, Owner })
    else
        MySQL.query.await('INSERT INTO `kael_fraud` (`m_owner`, `m_geni`, `m_geni_heading`, `m_laptop`, `m_laptop_heading`, `m_printer`, `m_printer_heading`, `m_scanner`, `m_scanner_heading`) VALUES(?,?,?,?,?,?,?,?,?)', { Owner, genicoords, heading, 0, 0, 0, 0, 0, 0})
    end
end)

RegisterNetEvent('mercy-fraud:server:savelaptop', function(coords, heading)
    local Player = QBCore.Functions.GetPlayer(source)
    local Owner = Player.PlayerData.citizenid
    local Find = MySQL.query.await('SELECT * FROM `kael_fraud` WHERE m_owner = ?', { Owner })
    if Find ~= nil and Find[1] ~= nil then
        MySQL.query.await('UPDATE `kael_fraud` SET m_laptop = ?, m_laptop_heading = ? WHERE m_owner = ?', { coords, heading, Owner })
    end
end)

RegisterNetEvent('mercy-fraud:server:saveprinter', function(coords, heading)
    local Player = QBCore.Functions.GetPlayer(source)
    local Owner = Player.PlayerData.citizenid
    local Find = MySQL.query.await('SELECT * FROM `kael_fraud` WHERE m_owner = ?', { Owner })
    if Find ~= nil and Find[1] ~= nil then
        MySQL.query.await('UPDATE `kael_fraud` SET m_printer = ?, m_printer_heading = ? WHERE m_owner = ?', { coords, heading, Owner })
    end
end)

RegisterNetEvent('mercy-fraud:server:savescanner', function(coords, heading)
    local Player = QBCore.Functions.GetPlayer(source)
    local Owner = Player.PlayerData.citizenid
    local Find = MySQL.query.await('SELECT * FROM `kael_fraud` WHERE m_owner = ?', { Owner })
    if Find ~= nil and Find[1] ~= nil then
        MySQL.query.await('UPDATE `kael_fraud` SET m_scanner = ?, m_scanner_heading = ? WHERE m_owner = ?', { coords, heading, Owner })
    end
end)


RegisterNetEvent('police:server:policeAlert', function(text)
    local src = source
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local players = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(players) do
        if v and v.PlayerData.job.type == 'leo' and v.PlayerData.job.onduty then
            local alertData = { title = "Fraud Alert", coords = { x = coords.x, y = coords.y, z = coords.z }, description = text }
            TriggerClientEvent('police:client:policeAlert', v.PlayerData.source, coords, text)
        end
    end
end)