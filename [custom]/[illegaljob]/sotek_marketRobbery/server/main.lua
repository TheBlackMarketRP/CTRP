function SendWebHook(WebHook, Title, Description, Footer, Color)
    local embeds = {
        {
            ["title"] = Title,
            ["description"] = Description,
            ["footer"] = {
                ["text"] = Footer
            },
            ["color"] = Color
        }
    }
    PerformHttpRequest(WebHook, function(err, text, headers) end, 'POST', json.encode({username = "Market Robbery", embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

UUID = tostring(math.random(0000, 9999) .. math.random(0000, 9999) .. math.random(0000, 9999) .. math.random(0000, 9999))
local ped ={}
local function CreatePedsMyBitch()
    for i = 1, #Sup.Main do
        ped[i] = CreatePed(4, Sup.Main[i].ped.model, Sup.Main[i].ped.pos, true, true)
        ped[i] = NetworkGetNetworkIdFromEntity(ped[i])
    end
end

CreatePedsMyBitch()


CreateThread(function()
    while not Callback.RegisterServerCallback do Wait(1) end

    Callback.RegisterServerCallback("Sup:ILikePotatoesYouKnowWhyMeNo", function (source)

        return UUID
    end)
    Callback.RegisterServerCallback("Sup:GetPeds", function (source, password)
        if password == UUID then 
            return ped
        end
    end)

    Callback.RegisterServerCallback("Sup:GetSpecificPed", function (source, password, key)
        if password == UUID then 
            return ped[key]
        end
    end)
end)


RegisterNetEvent("Sup:StartRobbery")
AddEventHandler("Sup:StartRobbery", function(password, key)
    if password == UUID then
        TriggerClientEvent("Sup:StartRobbery", -1, key)
        SendWebHook(Sup.WebHook["start"].Link, Sup.WebHook["start"].Title, Sup.WebHook["start"].Description, Sup.WebHook["start"].Footer, Sup.WebHook["start"].Color)
    end
end)

RegisterNetEvent("Sup:StartRobberyMyBitch")
AddEventHandler("Sup:StartRobberyMyBitch", function(password, key, random)
    if password == UUID then
        TriggerClientEvent("Sup:StartRobberyMyBitch", -1, key, random)
    end
end)


RegisterNetEvent("Sup:DoneRobbery")
AddEventHandler("Sup:DoneRobbery", function(password, key)
    if password == UUID then
        TriggerClientEvent("Sup:DoneRobbery", -1, key)
        SendWebHook(Sup.WebHook["done"].Link, Sup.WebHook["done"].Title, Sup.WebHook["done"].Description, Sup.WebHook["done"].Footer, Sup.WebHook["done"].Color)
    end
end)

