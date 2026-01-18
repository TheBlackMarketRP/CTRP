CreateThread(function()

    if Sup.Framework == "esx" then
        ESX = {}
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
    end

    if Sup.Framework == "esx1.9" then
        ESX = exports['es_extended']:getSharedObject()
    end

    if Sup.Framework == "qbcore" then
        QBCore = {}
        QBCore = exports["qb-core"]:GetCoreObject()
    end
    if Sup.Framework == "vrp" then
        local Proxy = module("vrp", "lib/Proxy")
        VRP = Proxy.getInterface("vRP")
    end
    if Sup.Framework == "vrpex" then
        local Proxy = module("vrp", "lib/Proxy")
        VRPex = Proxy.getInterface("vRP")
    end
    if Sup.Framework == "standalone" then
        --import your framework
    end

end)




---GetItem
CreateThread(function()
    while Callback.RegisterServerCallback == nil do Wait(1)  end
    Callback.RegisterServerCallback("Sup:GetItem", function(player, password, item_name)
        if password == UUID then 
            if Sup.Framework == "esx" or Sup.Framework == "esx1.9" then
                local xPlayer = ESX.GetPlayerFromId(player)

                local item = xPlayer.hasItem(item_name)
                if xPlayer.getInventoryItem(item_name) ~= nil then if xPlayer.getInventoryItem(item_name).count >= 1 then
                        return true
                    else
                        return false
                    end
                end

                if item then
                    return true
                end
                return false
            elseif Sup.Framework == "qbcore" then
                local xPlayer = QBCore.Functions.GetPlayer(player)

                if xPlayer.Functions.GetItemByName(item_name) ~= nil then
                    if xPlayer.Functions.GetItemByName(item_name).amount then
                        return true
                    end
                end
                return false
            elseif Sup.Framework == "standalone" then
                print(player)
            elseif Sup.Framework == "vrp" then
                local user_id = VRP.getUserId({ player })


                if VRP.getInventoryItemAmount({ user_id, item_name }) >= 1 then
                    return true
                else
                    return true
                end


            elseif Sup.Framework == "vrpex" then
                local user_id = VRPex.getUserId(player)

                if VRPex.getInventoryItemAmount(user_id, item_name) >= 1 then
                    return true
                else
                    return false
                end

            end
        else
            --- AC DETECTION
            DropPlayer(source, "BROOOOO WHY")
            return false
        end
        return false
    end)
    Callback.RegisterServerCallback("Sup:GiveMoney", function(player, password, money, count)
        if password == UUID then
            if Sup.Framework == "esx" or Sup.Framework == "esx1.9" then 
                local xPlayer = ESX.GetPlayerFromId(player)
                if money == "money" then
                    xPlayer.addAccountMoney("money", count)
                elseif money == "black_money" then
                    xPlayer.addAccountMoney("black_money", count)
                else
                    xPlayer.addInventoryItem(money, count)
                end
                return true

            elseif Sup.Framework == "qbcore" then
                local xPlayer = QBCore.Functions.GetPlayer(player)
                if money == "money" then
                    xPlayer.Functions.AddMoney("cash", count)
                elseif money == "black_money" then
                    xPlayer.Functions.AddMoney("blackmoney", count)
                else
                    xPlayer.Functions.AddItem(money, count)
                end
                return true
            elseif Sup.Framework == "standalone" then
                if money == "money" then
                    return true
                elseif money == "black_money" then
                    return true
                else
                    return true

                end
                return false
            elseif Sup.Framework == "vrp" then
                local user_id = VRP.getUserId({ player })
                if item_name == "money" then
                    VRP.giveMoney({ user_id, count })
                    return true
                elseif money == "black_money" then
                    VRP.giveMoney({ user_id, count })
                    return true
                end
                return false

            elseif Sup.Framework == "vrpex" then
                local user_id = VRPex.getUserId(player)
                if item_name == "money" then
                    VRPex.giveMoney(user_id, count)
                    return true
                elseif money == "black_money" then
                    VRPex.giveMoney({ user_id, count })
                    return true
                end
                return false
            end
        else
            --AC DETECTION
            DropPlayer(player, "WHAT BRO SERIOUSLY ??")
        end
        return false
    end)


    Callback.RegisterServerCallback("Sup:CheckForPolice", function(player, password)
        if password == UUID then
            if Sup.Framework == "esx" or Sup.Framework == "esx1.9" then 
                local xPlayers = ESX.GetPlayers()

                local cops = 0
                for i = 1, #xPlayers, 1 do 
                    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                    if xPlayer.job.name == Sup.PoliceJob  then
                        cops = cops + 1
                    end
                end
                if cops >= Sup.PoliceNeeded then
                    return true
                end
                return false
            elseif Sup.Framework == "qbcore" then
                local xPlayers = QBCore.Functions.GetQBPlayers()

                local cops = 0
                for k, v in pairs(xPlayers) do
                    if v.PlayerData.job.name == Sup.PoliceJob and v.PlayerData.job.onduty then
                        cops = cops + 1
                    end
                end
                if cops >= Sup.PoliceNeeded then
                    return true
                end
                return false
            elseif Sup.Framework == "vrp" then
                local cops = VRP.getUsersByPermission({ Sup.PoliceJob })
                if #cops >= Sup.PoliceNeeded then
                    return true
                else
                    return false
                end

            elseif Sup.Framework == "vrpex" then
                local cops = VRPex.getUsersByPermission(Sup.PoliceJob)
                if #cops >= Sup.PoliceNeeded then
                    return true
                else
                    return false
                end

            elseif Sup.Framework == "standalone" then
                print("standalone")
                local getCops = exports["PoliceEMSActivity"]:GetCopsDuty()
                print(#getCops, "Number of cops with export")
                if #getCops >= Sup.PoliceNeeded then 
                    return true 
                else
                    return false
                end
                return false 
            end
        else
            --AC DETECTION
            DropPlayer(source, "WHY BRO")
        end
        return false
    end)
end)

RegisterNetEvent("Sup:CallCops")
AddEventHandler("Sup:CallCops", function(key, name, coords)
    if key == UUID then
        local pos = vector3(coords.x, coords.y, coords.z)
        if Sup.Policenotify then
            if Sup.Framework == "esx" or Sup.Framework == "esx1.9" then local xPlayers = ESX.GetPlayers()
                for i = 1, #xPlayers, 1 do
                    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                    if xPlayer.job.name == Sup.PoliceJob then
                        TriggerClientEvent("Sup:CallCops", xPlayers[i], name, pos,
                            Sup.PoliceMessage)
                    end
                end
            elseif Sup.Framework == "qbcore" then
                local xPlayers = QBCore.Functions.GetQBPlayers()
                for k, v in pairs(xPlayers) do
                    if v.PlayerData.job.name == Sup.PoliceJob and v.PlayerData.job.onduty then
                        TriggerClientEvent("Sup:CallCops", k, name, pos, Sup.PoliceMessage)
                    end
                end
            elseif Sup.Framework == "vrp" then
                local cops = VRP.getUsersByPermission({ Sup.PoliceJob })
                for k, v in pairs(cops) do
                    TriggerClientEvent("Sup:CallCops", v, name, pos, Sup.PoliceMessage)
                end

            elseif Sup.Framework == "vrpex" then
                local cops = VRPex.getUsersByPermission(Sup.PoliceJob)
                for k, v in pairs(cops) do
                    TriggerClientEvent("Sup:CallCops", v, name, pos, Sup.PoliceMessage)
                end


            elseif Sup.Framework == "standalone" then
                local getCops = exports["PoliceEMSActivity"]:GetCopsDuty()
                for kk, value in pairs(getCops) do
                    TriggerClientEvent("Sup:CallCops", kk, name, pos, Sup.PoliceMessage)
                end
            end
        end
    else
        --AC DETECTION
        DropPlayer(source, "CHUPAPI MUNANYO")
    end
end)
