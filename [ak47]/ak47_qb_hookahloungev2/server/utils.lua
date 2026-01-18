QBCore = exports['qb-core']:GetCoreObject()

function getSocietyMoney()
    if GetResourceState('okokBanking') == 'started' then
        return exports['okokBanking']:GetAccount('hookahloungev2')
    end
    if GetResourceState('crm-banking') == 'started' then
        return exports["crm-banking"]:crm_get_money('hookahloungev2')
    end
    if Config.SocietyInManagement then
        return exports['qb-management']:GetAccount('hookahloungev2')
    else
        return exports['qb-banking']:GetAccountBalance('hookahloungev2')
    end
end

function addSocietyMoney(money)
    if GetResourceState('okokBanking') == 'started' then
        exports['okokBanking']:AddMoney('hookahloungev2', money)
        return
    end
    if GetResourceState('crm-banking') == 'started' then
        exports["crm-banking"]:crm_add_money('hookahloungev2', money)
        return
    end
    if Config.SocietyInManagement then
        exports['qb-management']:AddMoney('hookahloungev2', money)
    else
        exports['qb-banking']:AddMoney('hookahloungev2', money)
    end
end

function removeSocietyMoney(money)
    if GetResourceState('okokBanking') == 'started' then
        exports['okokBanking']:RemoveMoney('hookahloungev2', money)
        return
    end
    if GetResourceState('crm-banking') == 'started' then
        exports["crm-banking"]:crm_remove_money('hookahloungev2', money)
        return
    end
    if Config.SocietyInManagement then
        exports['qb-management']:RemoveMoney('hookahloungev2', money)
    else
        exports['qb-banking']:RemoveMoney('hookahloungev2', money)
    end
end

function CanCarryItem(id, item, amount)
	return true -- There is no way to check can caryy item in latest qb.
end

function hasEnoughItem(source, item, quantity)
    local quantity = quantity or 1
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local inv = xPlayer.Functions.GetItemByName(item)
    if inv and ((inv.amount and inv.amount >= quantity) or (inv.count and inv.count >= quantity)) then
        return true
    end
    return false
end

function GetItemLabel(item)
    if QBCore.Shared and QBCore.Shared.Items and QBCore.Shared.Items[item] then
	   return QBCore.Shared.Items[item].label
    else
        print('^1Item: ^3['..item..']^1 missing in qb-core/shared/items.lua^0')
        return item
    end
end

function GetPlayerFromId(id)
	return QBCore.Functions.GetPlayer(id).Functions
end

function getMoney(id)
	local xPlayer = QBCore.Functions.GetPlayer(id)
	return xPlayer.PlayerData.money['cash']
end

RegisterServerEvent('ak47_qb_hookahloungev2:PlayWithinDistance')
AddEventHandler('ak47_qb_hookahloungev2:PlayWithinDistance', function(coords , maxDistance, soundFile)
    TriggerClientEvent('ak47_qb_hookahloungev2:PlayWithinDistance', -1, coords, maxDistance, soundFile)
end)

function PlayerCanPay(xPlayer, price, payment)
    if payment == 'cash' then
        return xPlayer.PlayerData.money['cash'] >= price
    else
        return xPlayer.PlayerData.money['bank'] >= price
    end
end

function PayTheBill(xPlayer, payment, price)
    if payment == 'cash' then
        xPlayer.Functions.RemoveMoney('cash', price)
    else
        xPlayer.Functions.RemoveMoney('bank', price)
    end
end

GetName = function(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    return xPlayer.PlayerData.charinfo.firstname..' '..xPlayer.PlayerData.charinfo.lastname
end

function hasEnoughItem(source, item, quantity)
    local quantity = quantity or 1
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local inv = xPlayer.Functions.GetItemByName(item)
    if inv and ((inv.amount and inv.amount >= quantity) or (inv.count and inv.count >= quantity)) then
        return true
    end
    return false
end