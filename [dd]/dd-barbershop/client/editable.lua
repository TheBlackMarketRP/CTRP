--<< only qb
RegisterNetEvent("dd-barbershop:qb:setCivilianClothes", function()
    --insert your function to set job clothes

    --THIS IS AN EXAMPLE IF YOU ARE USING QB-CLOTHING
    TriggerServerEvent("qb-clothes:loadPlayerSkin")
    TriggerServerEvent("qb-clothing:loadPlayerSkin")
end)

RegisterNetEvent("dd-barbershop:qb:setJobClothes", function()
    --insert your function to set job clothes

    --THIS IS AN EXAMPLE IF YOU ARE USING QB-CLOTHING
    local sex = GetEntityModel(GetPlayerPed(GetPlayerFromServerId(id))) == `mp_m_freemode_01` and "M" or "F"
    TriggerEvent("qb-clothing:client:loadOutfit", {
        outfitData = { 
            ["t-shirt"] = {item = CONFIG.SKINS[sex].tshirt_1, texture = CONFIG.SKINS[sex].tshirt_2},
            ["torso2"] = {item = CONFIG.SKINS[sex].torso_1, texture = CONFIG.SKINS[sex].torso_2},
            ["decals"] = {item = CONFIG.SKINS[sex].decals_1, texture = CONFIG.SKINS[sex].decals_2},
            ["arms"] = {item = CONFIG.SKINS[sex].arms, texture = -1},
            ["pants"] = {item = CONFIG.SKINS[sex].pants_1, texture = CONFIG.SKINS[sex].pants_2},
            ["shoes"] = {item = CONFIG.SKINS[sex].shoes_1,texture = CONFIG.SKINS[sex].shoes_2},
            ["hat"] = {item = CONFIG.SKINS[sex].helmet_1,texture = CONFIG.SKINS[sex].helmet_2,}
        }
    })
end)
--<< only qb

RegisterNetEvent("dd-barbershop:spawnVehicle", function(data)
    local hash = GetHashKey(data.model)
    if not IsModelInCdimage(hash) then return end
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(0)
    end
    local ped = PlayerPedId()
    local veh = CreateVehicle(hash, GetEntityCoords(ped), GetEntityHeading(ped), true, false)
    SetModelAsNoLongerNeeded(hash)
    TaskWarpPedIntoVehicle(ped, veh, -1)

    if DD.FRAMEWORK == "qb" then 
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
    else 
        --insert here if you use a vehicle keys script in esx
    end 
end)

function customBillingSystem() 
    --insert your function
end 


function customSkinScriptSave(skin)
    --[[ insert your function to save the skin. 
        the skin var contains this data: 
            - hair_1   //hair type 1
            - hair_2   //hair type 2
            - hair_3   //hair color 1
            - hair_4   //hair color 2
            - beard_1  //beard type
            - beard_2  //beard opacity
            - beard_3  //beard color 1
            - beard_4  //beard color 2
    ]]
end 

function customSkinScriptGet() 
    --[[ insert your function to get the current skin. 
        return the data formatted like this:
        skin = {
            hair_1  = your_retrieved_value,
            hair_2  = your_retrieved_value,
            hair_3  = your_retrieved_value,
            hair_4  = your_retrieved_value,
            beard_1 = your_retrieved_value,
            beard_2 = your_retrieved_value,
            beard_3 = your_retrieved_value,
            beard_4 = your_retrieved_value
        }
    ]]
end 