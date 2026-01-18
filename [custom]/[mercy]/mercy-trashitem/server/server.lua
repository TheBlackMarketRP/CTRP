local QBCore = exports[Config.Core]:GetCoreObject()

RegisterNetEvent("mercy-trashitems:server:opendumpster", function()
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then 
        for k, v in pairs(Config.CommonIetms) do 
            Player.Functions.AddItem(k, math.random(v.amount.min, v.amount.max))
        end

        for k, v in pairs(Config.RareIetms) do 
            if math.random(100) <= v.chance then
                Player.Functions.AddItem(k, math.random(v.amount.min, v.amount.max))
            end
        end
    end
end)



