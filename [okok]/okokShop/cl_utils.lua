QBCore = exports["qb-core"]:GetCoreObject()
local peds = {}

RegisterNetEvent(Config.EventPrefix..":notification")
AddEventHandler(Config.EventPrefix..":notification", function(title, text, type, time)
	if Config.UseOkokNotify then
		exports['okokNotify']:Alert(title, text, time, type)
	else
		QBCore.Functions.Notify(text, type, time)
	end
end)

RegisterNetEvent(Config.EventPrefix..":giveKeys")
AddEventHandler(Config.EventPrefix..":giveKeys", function(vehicle)

	TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle)) -- qb-vehiclekeys
	
end)

RegisterNetEvent(Config.EventPrefix..":removeKeys")
AddEventHandler(Config.EventPrefix..":removeKeys", function(vehicle)

	-- Set here your key removal after the mission

end)

RegisterNetEvent(Config.EventPrefix..":setFuel")
AddEventHandler(Config.EventPrefix..":setFuel", function(vehicle)
	if Config.UseOkokGasStation then
        exports['okokGasStation']:SetFuel(vehicle, 100.0)
    else
        -- Set your fuel system here if not using okokGasStation
    end
end)

function TextUI(text, time, side)
	if Config.UseOkokTextUI then
		if text ~= nil then
			exports['okokTextUI']:Open(text, time, side)
		else
			exports['okokTextUI']:Close()
		end
	else
		if text ~= nil then
			exports['qb-core']:DrawText(text, side)
		else
			exports['qb-core']:HideText()
		end
	end
end

-- Add target locations
function SetTargetLocations()

    for k,v in pairs(peds) do
        DeleteEntity(v)
    end

    if Config.UseTarget then
        if Config.TargetSystem == 'ox-target' then
            for k, v in pairs(Config.Stores) do

                if Config.TargetSystem == 'ox-target' then
                    exports.ox_target:removeZone("store_buy"..v.id)
                elseif Config.TargetSystem == 'qb-target' then
                    exports['qb-target']:RemoveZone("store_buy"..v.id)
                end

                if Config.TargetSystem == 'ox-target' then
                    exports.ox_target:removeZone("store_owner"..v.id)
                elseif Config.TargetSystem == 'qb-target' then
                    exports['qb-target']:RemoveZone("store_owner"..v.id)
                end

                RequestModel(v.targetNpc)
                while not HasModelLoaded(v.targetNpc) do Wait(0) end
                local shopOptions = {}
                local coords = v.targetCoords
                local shopPed = CreatePed(0, v.targetNpc, coords.x, coords.y, coords.z-1, coords.w, false, false)

                FreezeEntityPosition(shopPed, true)
                SetEntityInvincible(shopPed, true)
                SetBlockingOfNonTemporaryEvents(shopPed, true)

                shopOptions = {
                    name = 'okokshop_open_menu' .. v.id,
                    event = Config.EventPrefix..':openClientMenu',
                    shopid  = v.id,
                    icon = 'fa-solid fa-cart-shopping',
                    label = _okok('translations').open .. ' '..v.name,
                    canInteract = function(k, distance)
                        return distance < 2.5
                    end
                }
                exports.ox_target:addLocalEntity(shopPed, shopOptions)
                table.insert(peds, shopPed)
            end

            for k, v in pairs(Config.Stores) do

                if Config.TargetSystem == 'ox-target' then
                    exports.ox_target:removeZone("store_buy"..v.id)
                elseif Config.TargetSystem == 'qb-target' then
                    exports['qb-target']:RemoveZone("store_buy"..v.id)
                end

                if Config.TargetSystem == 'ox-target' then
                    exports.ox_target:removeZone("store_owner"..v.id)
                elseif Config.TargetSystem == 'qb-target' then
                    exports['qb-target']:RemoveZone("store_owner"..v.id)
                end

                local isEmployee = false

                local employees = json.decode(v.employees)
                if employees then
                    for k2, v2 in pairs(employees) do
                        if k2 == v.ownid then
                            isEmployee = true
                        end
                    end
                end

                if v.typeShop == "owned" and v.ownerid == v.ownid or v.typeShop == "owned" and isEmployee then
                    exports.ox_target:addSphereZone({
                        name = "store_owner".. v.id,
                        coords = vector3(v.ownerCoords.x, v.ownerCoords.y, v.ownerCoords.z),
                        radius = 1.0,
                        debug = false,
                        options = {
                            {
                                event = Config.EventPrefix..':openMenu',
                                icon = 'fa-solid fa-cart-shopping',
                                label = _okok('translations').manage .. ' '..v.name,
                                shopid  = v.id,
                            },
                        },
                        distance = 2.5,
                        useZ = true
                    })
                    v.zoneAdded = true
                elseif v.hasOwner and v.typeShop == "unowned" then
                    exports.ox_target:addSphereZone({
                        name = "store_buy".. v.id,
                        coords = vector3(v.ownerCoords.x, v.ownerCoords.y, v.ownerCoords.z),
                        radius = 1.0,
                        debug = false,
                        options = {
                            {
                                event = Config.EventPrefix..':buyShopViaTarget',
                                icon = 'fa-solid fa-cart-shopping',
                                label = _okok('translations').buybutton .. ' '..v.name ..  ' ' .. _okok('translations').buyfor .. ' ' .. v.price .. Config.Currency,
                                id = v.id,
                                priceShop = v.price,
                                name = v.name,
                            },
                        },
                        distance = 2.5,
                        useZ = true
                    })
                end
            end

        elseif Config.TargetSystem == 'qb-target' then

            for k, v in pairs(Config.Stores) do

                if Config.TargetSystem == 'ox-target' then
                    exports.ox_target:removeZone("store_buy"..v.id)
                elseif Config.TargetSystem == 'qb-target' then
                    exports['qb-target']:RemoveZone("store_buy"..v.id)
                end

                if Config.TargetSystem == 'ox-target' then
                    exports.ox_target:removeZone("store_owner"..v.id)
                elseif Config.TargetSystem == 'qb-target' then
                    exports['qb-target']:RemoveZone("store_owner"..v.id)
                end

                RequestModel(v.targetNpc)
                while not HasModelLoaded(v.targetNpc) do Wait(0) end
                local shopOptions = {}
                local coords = v.targetCoords
                local shopPed = CreatePed(0, v.targetNpc, coords.x, coords.y, coords.z-1, coords.w, false, false)

                FreezeEntityPosition(shopPed, true)
                SetEntityInvincible(shopPed, true)
                SetBlockingOfNonTemporaryEvents(shopPed, true)

                exports['qb-target']:AddTargetEntity(shopPed, {
                    options = {
                        {
                            event = Config.EventPrefix..':openClientMenu',
                            icon = 'fa-solid fa-cart-shopping',
                            label = _okok('translations').open .. ' '..v.name,
                            shopid  = v.id,
                        }
                    },
                    distance = 2.5,
                })

                table.insert(peds, shopPed)
            end

            for k, v in pairs(Config.Stores) do

                if Config.TargetSystem == 'ox-target' then
                    exports.ox_target:removeZone("store_buy"..v.id)
                elseif Config.TargetSystem == 'qb-target' then
                    exports['qb-target']:RemoveZone("store_buy"..v.id)
                end

                if Config.TargetSystem == 'ox-target' then
                    exports.ox_target:removeZone("store_owner"..v.id)
                elseif Config.TargetSystem == 'qb-target' then
                    exports['qb-target']:RemoveZone("store_owner"..v.id)
                end

                local isEmployee = false

                local employees = json.decode(v.employees)
                if employees then
                    for k2, v2 in pairs(employees) do
                        if k2 == v.ownid then
                            isEmployee = true
                        end
                    end
                end

                if v.typeShop == "owned" and v.ownerid == v.ownid or v.typeShop == "owned" and isEmployee then
                    exports['qb-target']:AddCircleZone("store_owner".. v.id, v.ownerCoords, 1, {
                        name = "store_owner".. v.id,
                        debugPoly = false,
                        useZ = true
                    }, {
                        options = {
                            {
                                type = "client",
                                event = Config.EventPrefix..':openMenu',
                                icon = 'fa-solid fa-cart-shopping',
                                label = _okok('translations').manage .. ' '..v.name,
                                shopid  = v.id,
                            },
                        },
                        distance = 2.5
                    })
                    v.zoneAdded = true
                elseif v.hasOwner and v.typeShop == "unowned" then

                    exports['qb-target']:AddCircleZone("store_buy".. v.id, v.ownerCoords, 1, {
                        name = "store_buy".. v.id,
                        debugPoly = false,
                        useZ = true
                    }, {
                        options = {
                            {
                                type = "client",
                                event = Config.EventPrefix..':buyShopViaTarget',
                                icon = 'fa-solid fa-cart-shopping',
                                label = _okok('translations').buybutton .. ' '..v.name ..  ' ' .. _okok('translations').buyfor .. ' ' .. v.price .. Config.Currency,
                                id = v.id,
                                priceShop = v.price,
                                name = v.name,
                            },
                        },
                        distance = 2.5
                    })
                end
            end
        end
    end
end