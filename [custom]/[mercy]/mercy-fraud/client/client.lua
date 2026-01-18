local QBCore = exports[Config.Core]:GetCoreObject()
-- Manupulater Variables --
local EditMode = false
local SelectedObject = nil
local SelectedObjCoord = nil
local SelectedObjRot = {x = 0.0, y = 0.0, z = 0.0}
local Geni = nil
local GeniCoord = nil
local GeniFuel = 0
local GeniOn = false
local Laptop = nil 
local LaptopCoord = nil 
local Printer = nil 
local PrinterCoord = nil 
local Scaner = nil 
local ScanerCoord = nil
local CardInserted = false
local CarringItem = false
local ShoppingBag = nil
local BankerBusy = false 
local BankerState = 0
-- Manupulater Variables --

-- Fuel And DMG Bar -- 
dmgBarColour = true
dmgBarFull = "▓"
dmgBarEmpty = "░" 

local CurrentIMG = nil
local CurrentTexture = nil 
local CurrentRuntimeTexure = nil
-- Fuel And DMG Bar -- 

-- Pre Loading Stuff -- 
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.TriggerCallback("mercy-fraud:server:getfraudsetup", function(data)
        if data then 
            Init(data)
        end
    end)   
end)

RegisterNetEvent("onResourceStart", function(resource)
    if resource ~= GetCurrentResourceName() then return end
    QBCore.Functions.TriggerCallback("mercy-fraud:server:getfraudsetup", function(data)
        if data then 
            Init(data)
        end
    end)  
end)

function Init(data)
    if data.m_geni ~= '0' then 
        GeniCoord = json.decode(data.m_geni)
        GeniCoord = vector3(GeniCoord.x, GeniCoord.y, GeniCoord.z)
        QBCore.Functions.LoadModel(Config.GeniModel)        
        Geni = CreateObject(Config.GeniModel, GeniCoord, true, false, false)
        SetEntityHeading(Geni, tonumber(data.m_geni_heading) + 0.0)
        FreezeEntityPosition(Geni, true)
        exports[Config.Target]:AddTargetEntity(Geni, {
            options = { 
                {
                    num = 1,
                    type = "client",
                    event = "mercy-fraud:client:opengenimenu",
                    icon = 'fab fa-uncharted',
                    label = 'Open Settings',
                },
                {
                    num = 2,
                    type = "client",
                    event = "",
                    icon = 'fab fa-uncharted',
                    label = 'Pick Up Generator',
                    action = function(entity)
                        DeleteEntity(entity)
                        Geni = nil
                        GeniCoord = nil
                        GeniFuel = 0
                        GeniOn = false
                        TriggerServerEvent('mercy-fraud:server:pickupobjectadd', 'fraudgnei')
                        TriggerServerEvent('mercy-fraud:server:savegeni', '0', 0)
                    end,
                },
            },
            distance = 1.5,
        })
    end

    if data.m_laptop ~= '0' then 
        LaptopCoord = json.decode(data.m_laptop)
        LaptopCoord = vector3(LaptopCoord.x, LaptopCoord.y, LaptopCoord.z)
        QBCore.Functions.LoadModel(Config.LaptopModel)        
        Laptop = CreateObject(Config.LaptopModel, LaptopCoord, true, false, false)
        SetEntityHeading(Laptop, tonumber(data.m_laptop_heading) + 0.0)
        FreezeEntityPosition(Laptop, true)
        exports[Config.Target]:AddTargetEntity(Laptop, {
            options = { 
                {
                    num = 1,
                    type = "client",
                    event = "mercy-fraud:client:openlaptopmenu",
                    icon = 'fab fa-uncharted',
                    label = 'Open Laptop',
                },
                {
                    num = 2,
                    type = "client",
                    event = "",
                    icon = 'fab fa-uncharted',
                    label = 'Pick Up Laptop',
                    action = function(entity)
                        DeleteEntity(entity)
                        Laptop = nil
                        LaptopCoord = nil
                        TriggerServerEvent('mercy-fraud:server:pickupobjectadd', 'fraudlaptop')
                        TriggerServerEvent('mercy-fraud:server:savelaptop', '0', 0)
                    end,
                }
            },
            distance = 1.5,
        })
    end

    if data.m_printer ~= '0' then 
        PrinterCoord = json.decode(data.m_printer)
        PrinterCoord = vector3(PrinterCoord.x, PrinterCoord.y, PrinterCoord.z)
        QBCore.Functions.LoadModel(Config.PrinterModel)        
        Printer = CreateObject(Config.PrinterModel, PrinterCoord, true, false, false)
        SetEntityHeading(Printer, tonumber(data.m_printer_heading) + 0.0)
        FreezeEntityPosition(Printer, true)
        exports[Config.Target]:AddTargetEntity(Printer, {
            options = { 
                {
                    num = 1,
                    type = "client",
                    event = "mercy-fraud:client:openprintermenu",
                    icon = 'fab fa-uncharted',
                    label = 'Use Printer',
                },
                {
                    num = 2,
                    type = "client",
                    event = "",
                    icon = 'fab fa-uncharted',
                    label = 'Pick Up Printer',
                    action = function(entity)
                        DeleteEntity(entity)
                        Printer = nil
                        PrinterCoord = nil
                        TriggerServerEvent('mercy-fraud:server:pickupobjectadd', 'fraudprinter')
                        TriggerServerEvent('mercy-fraud:server:saveprinter', '0', 0)
                    end,
                }
            },
            distance = 1.5,
        }) 
    end

    if data.m_scanner ~= '0' then 
        ScanerCoord = json.decode(data.m_scanner)
        ScanerCoord = vector3(ScanerCoord.x, ScanerCoord.y, ScanerCoord.z)
        QBCore.Functions.LoadModel(Config.ScannerModel)        
        Scaner = CreateObject(Config.ScannerModel, ScanerCoord, true, false, false)
        SetEntityHeading(Scaner, tonumber(data.m_scanner_heading) + 0.0)
        FreezeEntityPosition(Scaner, true)
        exports[Config.Target]:AddTargetEntity(Scaner, {
            options = { 
                {
                    num = 1,
                    type = "client",
                    event = "mercy-fraud:client:openscannermenu",
                    icon = 'fab fa-uncharted',
                    label = 'Open Card Scanner',
                },
                {
                    num = 2,
                    type = "client",
                    event = "",
                    icon = 'fab fa-uncharted',
                    label = 'Pick Up Scanner',
                    action = function(entity)
                        DeleteEntity(entity)
                        Scaner = nil
                        ScanerCoord = nil
                        TriggerServerEvent('mercy-fraud:server:pickupobjectadd', 'fraudscaner')
                        TriggerServerEvent('mercy-fraud:server:savescanner', '0', 0)
                    end,
                }
            },
            distance = 1.5,
        }) 
    end
end

CreateThread(function()
    QBCore.Functions.LoadModel('mp_m_shopkeep_01')
    local Buyer = CreatePed(0, 'mp_m_shopkeep_01', Config.Buyer.Coords, false, true)
    SetBlockingOfNonTemporaryEvents(Buyer, true)
    SetEntityInvincible(Buyer, true)
    FreezeEntityPosition(Buyer, true)

    if Config.Buyer.Blip.Enabled then 
        local BuyerBlip = AddBlipForEntity(Buyer)
        SetBlipSprite(BuyerBlip, Config.Buyer.Blip.Icon)
        SetBlipColour(BuyerBlip, Config.Buyer.Blip.Color)
        SetBlipDisplay(BuyerBlip, 4)
        SetBlipScale(BuyerBlip, Config.Buyer.Blip.Size)
        SetBlipAsShortRange(BuyerBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Buyer.Blip.Legend)
        EndTextCommandSetBlipName(BuyerBlip)
    end

    exports[Config.Target]:AddTargetEntity(Buyer, { 
        options = { 
            { 
                icon = 'fas fa-credit-card', 
                label = 'Sell Stuff',  
                event = "mercy-fraud:client:buyermenu",
            },
        },
        distance = 1.5, 
    })

    QBCore.Functions.LoadModel('a_f_y_business_04')
    Banker = CreatePed(0, 'a_f_y_business_04', Config.Banker.Coords, false, true)
    SetBlockingOfNonTemporaryEvents(Banker, true)
    SetEntityInvincible(Banker, true)
    FreezeEntityPosition(Banker, true)

    if Config.Banker.Blip.Enabled then 
        local BankerBlip = AddBlipForEntity(Banker)
        SetBlipSprite(BankerBlip, Config.Banker.Blip.Icon)
        SetBlipColour(BankerBlip, Config.Banker.Blip.Color)
        SetBlipDisplay(BankerBlip, 4)
        SetBlipScale(BankerBlip, Config.Banker.Blip.Size)
        SetBlipAsShortRange(BankerBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Banker.Blip.Legend)
        EndTextCommandSetBlipName(BankerBlip)
    end

    exports[Config.Target]:AddTargetEntity(Banker, { 
        options = { 
            { 
                icon = 'fas fa-money-bill-1', 
                label = 'Hand Over Cheque',  
                event = "mercy-fraud:client:chequefraud",
                item = 'fraudcheque',
            },
        },
        distance = 5.5, 
    })

    if Config.AtmFraud then 
        exports[Config.Target]:AddTargetModel(Config.AtmModels, { 
            options = { 
                { 
                    icon = 'fas fa-credit-card', 
                    label = 'Use Cloned Card',  
                    event = "mercy-fraud:client:atmfraud",
                    item = 'clonedcard',
                },
            },
            distance = 1.5, 
        })
    end
end)


CreateThread(function()   
    local Sleep = 2000 
    while true do 
        if Geni and Laptop then             
            DrawLine(LaptopCoord.x, LaptopCoord.y, LaptopCoord.z, GeniCoord.x, GeniCoord.y, GeniCoord.z + 0.2, 255, 50, 50, 255)
            Sleep = 0
        end        
        if Geni and Printer then             
            DrawLine(PrinterCoord.x, PrinterCoord.y, PrinterCoord.z, GeniCoord.x, GeniCoord.y, GeniCoord.z + 0.2, 255, 50, 50, 255)
            Sleep = 0
        end               
        if Geni and Scaner then             
            DrawLine(ScanerCoord.x, ScanerCoord.y, ScanerCoord.z, GeniCoord.x, GeniCoord.y, GeniCoord.z + 0.2, 255, 50, 50, 255)
            Sleep = 0
        end               
        Wait(Sleep)
    end
end)

RegisterNetEvent('mercy-fraud:client:spawnobj', function(item)
    if EditMode then return end
    local Model = ''
    if item == 'fraudgnei' then 
        if Geni then return end
        Model = Config.GeniModel
    elseif item == 'fraudlaptop' then 
        if Laptop then return end
        Model = Config.LaptopModel
    elseif item == 'fraudprinter' then 
        if Printer then return end
        Model = Config.PrinterModel
    elseif item == 'fraudscaner' then 
        if Scaner then return end
        Model = Config.ScannerModel
    end
    local PlayerPed = PlayerPedId()
    QBCore.Functions.LoadModel(Model)
    SelectedObjCoord = GetOffsetFromEntityInWorldCoords(PlayerPed, 0.0, 2.0, 0.0)
    SelectedObject = CreateObject(Model, SelectedObjCoord, false, false, false)
    FreezeEntityPosition(SelectedObject, true)
    EditMode = true 
    while true do 
        if EditMode then 
            PlaceObjects()  
        end            
        if IsControlJustReleased(0, 191) then 
            if not Geni and item ~= 'fraudgnei' then 
                DeleteEntity(SelectedObject)
                SelectedObject = nil 
                SelectedObjCoord = nil 
                EditMode = false
                exports['okokNotify']:Alert('Fraud', 'Place Your Power Sournce First', 2000, 'error')
                break
            end
            if Geni and item ~= 'fraudgnei' then 
                local Distance = GetDistanceBetweenCoords(SelectedObjCoord, GetEntityCoords(Geni))
                if Distance > 5.0 then 
                    DeleteEntity(SelectedObject)
                    SelectedObject = nil 
                    SelectedObjCoord = nil 
                    EditMode = false
                    exports['okokNotify']:Alert('Fraud', 'You Cant Put Far From your power source', 2000, 'error')
                    break
                end
            end           
            FinishPuttingObj(item)
            break
        end        
        Wait(0)
    end
end)

function PlaceObjects()
    local xVect = 0.015
    local yVect = 0.015
    local zVect = 0.015
    
    SetEntityDrawOutline(SelectedObject, true)
    SetEntityDrawOutlineColor(255, 0, 0, 255)

    if IsControlPressed(1, 27) or IsDisabledControlPressed(1, 27) then -- Up Arrow
		SelectedObjCoord = GetOffsetFromEntityInWorldCoords(SelectedObject, 0, -yVect, 0)
    end

    if IsControlPressed(1, 173) or IsDisabledControlPressed(1, 173) then -- Down Arrow
		SelectedObjCoord = GetOffsetFromEntityInWorldCoords(SelectedObject, 0, yVect, 0)
    end

    if IsControlPressed(1, 174) or IsDisabledControlPressed(1, 174) then -- Left Arrow
		SelectedObjCoord = GetOffsetFromEntityInWorldCoords(SelectedObject, xVect, 0, 0)
    end

    if IsControlPressed(1, 175) or IsDisabledControlPressed(1, 175) then -- Right Arrow
		SelectedObjCoord = GetOffsetFromEntityInWorldCoords(SelectedObject, -xVect, 0, 0)
    end

    if IsControlPressed(1, 10) or IsDisabledControlPressed(1, 10) then -- Page Up
		SelectedObjCoord = GetOffsetFromEntityInWorldCoords(SelectedObject, 0, 0, zVect)
    end

    if IsControlPressed(1, 11) or IsDisabledControlPressed(1, 11) then -- Page Down
		SelectedObjCoord = GetOffsetFromEntityInWorldCoords(SelectedObject, 0, 0, -zVect)
    end

    if IsControlPressed(1, 181) or IsDisabledControlPressed(1, 181) then -- Scroll Up
		SelectedObjRot.z = SelectedObjRot.z + 5.5
    end

    if IsControlPressed(1, 180) or IsDisabledControlPressed(1, 180) then -- Scroll Down
		SelectedObjRot.z = SelectedObjRot.z - 5.5
    end

    SetEntityRotation(SelectedObject, SelectedObjRot.x, SelectedObjRot.y, SelectedObjRot.z)
	SetEntityCoords(SelectedObject, SelectedObjCoord.x, SelectedObjCoord.y, SelectedObjCoord.z)
end

function FinishPuttingObj(item)
    SetEntityDrawOutline(SelectedObject, false)
    local HasObjItem = QBCore.Functions.HasItem(item)
    if HasObjItem then 
        if item == 'fraudgnei' then 
            Geni = SelectedObject
            GeniCoord = SelectedObjCoord
            TriggerServerEvent('mercy-fraud:server:savegeni', json.encode(GeniCoord), GetEntityHeading(Geni))
            exports[Config.Target]:AddTargetEntity(Geni, {
                options = { 
                    {
                        num = 1,
                        type = "client",
                        event = "mercy-fraud:client:opengenimenu",
                        icon = 'fab fa-uncharted',
                        label = 'Open Settings',
                    },
                    {
                        num = 2,
                        type = "client",
                        event = "",
                        icon = 'fab fa-uncharted',
                        label = 'Pick Up Generator',
                        action = function(entity)
                            DeleteEntity(entity)
                            Geni = nil
                            GeniCoord = nil
                            GeniFuel = 0
                            GeniOn = false
                            TriggerServerEvent('mercy-fraud:server:pickupobjectadd', 'fraudgnei')
                            TriggerServerEvent('mercy-fraud:server:savegeni', '0', 0)
                        end,
                    },
                },
                distance = 1.5,
            })
        elseif item == 'fraudlaptop' then 
            Laptop = SelectedObject
            LaptopCoord = SelectedObjCoord
            TriggerServerEvent('mercy-fraud:server:savelaptop', json.encode(LaptopCoord), GetEntityHeading(Laptop))
            exports[Config.Target]:AddTargetEntity(Laptop, {
                options = { 
                    {
                        num = 1,
                        type = "client",
                        event = "mercy-fraud:client:openlaptopmenu",
                        icon = 'fab fa-uncharted',
                        label = 'Open Laptop',
                    },
                    {
                        num = 2,
                        type = "client",
                        event = "",
                        icon = 'fab fa-uncharted',
                        label = 'Pick Up Laptop',
                        action = function(entity)
                            DeleteEntity(entity)
                            Laptop = nil
                            LaptopCoord = nil
                            TriggerServerEvent('mercy-fraud:server:pickupobjectadd', 'fraudlaptop')
                            TriggerServerEvent('mercy-fraud:server:savelaptop', '0', 0)
                        end,
                    }
                },
                distance = 1.5,
            })
        elseif item == 'fraudprinter' then 
            Printer = SelectedObject
            PrinterCoord = SelectedObjCoord      
            TriggerServerEvent('mercy-fraud:server:saveprinter', json.encode(PrinterCoord), GetEntityHeading(Printer))      
            exports[Config.Target]:AddTargetEntity(Printer, {
                options = { 
                    {
                        num = 1,
                        type = "client",
                        event = "mercy-fraud:client:openprintermenu",
                        icon = 'fab fa-uncharted',
                        label = 'Use Printer',
                    },
                    {
                        num = 2,
                        type = "client",
                        event = "",
                        icon = 'fab fa-uncharted',
                        label = 'Pick Up Printer',
                        action = function(entity)
                            DeleteEntity(entity)
                            Printer = nil
                            PrinterCoord = nil
                            TriggerServerEvent('mercy-fraud:server:pickupobjectadd', 'fraudprinter')
                            TriggerServerEvent('mercy-fraud:server:saveprinter', '0', 0)
                        end,
                    }
                },
                distance = 1.5,
            }) 
        elseif item == 'fraudscaner' then 
            Scaner = SelectedObject
            ScanerCoord = SelectedObjCoord     
            TriggerServerEvent('mercy-fraud:server:savescanner', json.encode(ScanerCoord), GetEntityHeading(Scaner))          
            exports[Config.Target]:AddTargetEntity(Scaner, {
                options = { 
                    {
                        num = 1,
                        type = "client",
                        event = "mercy-fraud:client:openscannermenu",
                        icon = 'fab fa-uncharted',
                        label = 'Open Card Scanner',
                    },
                    {
                        num = 2,
                        type = "client",
                        event = "",
                        icon = 'fab fa-uncharted',
                        label = 'Pick Up Scanner',
                        action = function(entity)
                            DeleteEntity(entity)
                            Scaner = nil
                            ScanerCoord = nil
                            TriggerServerEvent('mercy-fraud:server:pickupobjectadd', 'fraudscaner')
                            TriggerServerEvent('mercy-fraud:server:savescanner', '0', 0)
                        end,
                    }
                },
                distance = 1.5,
            }) 
        end 
        SelectedObject = nil 
        SelectedObjCoord = nil 
        EditMode = false           
        TriggerServerEvent('mercy-fraud:server:removespawnditem', item) 
    else
        DeleteEntity(SelectedObject)
        SelectedObject = nil 
        SelectedObjCoord = nil 
        EditMode = false
        exports['okokNotify']:Alert('Fraud', 'You dont have the item in your pocket', 2000, 'error')
    end      
end

RegisterNetEvent('mercy-fraud:client:opengenimenu', function()
    exports[Config.Menu]:openMenu({
        {
            header = "Power Settings",
            isMenuHeader = true, 
            icon = "fas fa-car-battery", 
        },
        { 
            disabled = (GeniFuel == 100),
            icon = "fas fa-gas-pump", 
            header = "Generator Fuel", 
            txt = dmgBar(GeniFuel), 
            params = { 
                event = "mercy-fraud:client:fuelgeni", 
            } 
        },    	
        { 
            disabled = GeniOn or not (GeniFuel > 0),
            icon = "fas fa-power-off", 
            header = "Turn On", 
            txt = '', 
            params = { 
                event = "mercy-fraud:client:poweron", 
            } 
        },    	
        { 
            disabled = not GeniOn,
            icon = "fas fa-power-off", 
            header = "Turn Off", 
            txt = '', 
            params = { 
                event = "mercy-fraud:client:poweron", 
            } 
        },    	
        {
             header = "Close (ESC)",
             icon = "fas fa-circle-xmark", 
             params = { 
                 event = ""
             } 
        },		
   })
end)

RegisterNetEvent('mercy-fraud:client:fuelgeni', function()
    local PlayerPed = PlayerPedId()
    local JerrycanProp = CreateObject(joaat('w_am_jerrycan'), 1.0, 1.0, 1.0, true, true, false)
    local lefthand = GetPedBoneIndex(PlayerPed, 18905)
    AttachEntityToEntity(JerrycanProp, PlayerPed, lefthand, 0.11, 0.0, 0.25, 15.0, 170.0, 90.42, 0, 1, 0, 1, 0, 1)				
    QBCore.Functions.Progressbar('fuelinggeni', 'Fueling Generator ..', 10000, false, true, { 
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, { 
        animDict = 'weapon@w_sp_jerrycan',
        anim = 'fire',
        flags = 17,
    }, {}, {}, function() -- Play When Done
        DeleteObject(JerrycanProp)
        StopAnimTask(PlayerPed, 'weapon@w_sp_jerrycan', 'fire', 1.0)    
        GeniFuel = 100
        TriggerEvent('mercy-fraud:client:opengenimenu')    
    end, function() -- Play When Cancel
        DeleteObject(JerrycanProp)
        StopAnimTask(PlayerPed, 'weapon@w_sp_jerrycan', 'fire', 1.0)
    end)    
end)

RegisterNetEvent('mercy-fraud:client:poweron', function()
    GeniOn = not GeniOn
end)

RegisterNetEvent('mercy-fraud:client:openlaptopmenu', function()
    if not GeniOn then 
        exports['okokNotify']:Alert('Fraud', 'Turn On The Power.', 2000, 'error')
        return false
    end
    if not Scaner then 
        exports['okokNotify']:Alert('Fraud', 'Conenct Card Scanner.', 2000, 'error')
        return false
    end
    exports[Config.Menu]:openMenu({
        {
            header = "Hacking Computer",
            isMenuHeader = true, 
            icon = "fas fa-laptop-code", 
        },
        { 
            disabled = not CardInserted or not QBCore.Functions.HasItem('emptychip'),
            icon = "fas fa-floppy-disk", 
            header = "ReWrite Empty Chip", 
            txt = '', 
            params = { 
                event = "mercy-fraud:client:rewriteemtpychip", 
            } 
        }, 
        {
             header = "Close (ESC)",
             icon = "fas fa-circle-xmark", 
             params = { 
                 event = ""
             } 
        },		
   })
end)

RegisterNetEvent('mercy-fraud:client:openscannermenu', function()
    if not GeniOn then 
        exports['okokNotify']:Alert('Fraud', 'Turn On The Power.', 2000, 'error')
        return false
    end
    if not Laptop then 
        exports['okokNotify']:Alert('Fraud', 'You Need To Connect Computer.', 2000, 'error')
        return false
    end
    exports[Config.Menu]:openMenu({
        {
            header = "Car Writing Device",
            isMenuHeader = true, 
            icon = "fas fa-barcode", 
        },
        { 
            disabled = not QBCore.Functions.HasItem('emptycard'),
            icon = "fas fa-floppy-disk", 
            header = "Insert Empty Card", 
            txt = '', 
            params = { 
                event = "mercy-fraud:client:putemptycardinscanner", 
            } 
        }, 
        {
             header = "Close (ESC)",
             icon = "fas fa-circle-xmark", 
             params = { 
                 event = ""
             } 
        },		
   })
end)


RegisterNetEvent('mercy-fraud:client:openprintermenu', function()
    if not GeniOn then 
        exports['okokNotify']:Alert('Fraud', 'Turn On The Power.', 2000, 'error')
        return false
    end
    if not Laptop then         
        exports['okokNotify']:Alert('Fraud', 'You Need To Connect Computer', 2000, 'error')
        return false
    end
    exports[Config.Menu]:openMenu({
        {
            header = "Printing Options",
            isMenuHeader = true, 
            icon = "fas fa-print", 
        },
        { 
            disabled = not QBCore.Functions.HasItem('emptyslip'),
            icon = "fas fa-floppy-disk", 
            header = "Print Empty Cheque", 
            txt = '', 
            params = { 
                event = "mercy-fraud:client:printcheque", 
            } 
        }, 
        {
             header = "Close (ESC)",
             icon = "fas fa-circle-xmark", 
             params = { 
                 event = ""
             } 
        },		
   })
end)

RegisterNetEvent('mercy-fraud:client:rewriteemtpychip', function()
    QBCore.Functions.Progressbar('wretingchip', 'Setting Up Chip ..', 10000, false, true, { 
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, { 
        animDict = 'anim@heists@prison_heiststation@cop_reactions',
        anim = 'cop_b_idle',
        flags = 17,
    }, {}, {}, function() -- Play When Done
        CardInserted = false
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('mercy-fraud:server:removespawnditem', 'emptychip')
        TriggerServerEvent('mercy-fraud:server:pickupobjectadd', 'clonedcard')
    end, function() -- Play When Cancel
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent('mercy-fraud:client:putemptycardinscanner', function()
    QBCore.Functions.Progressbar('puttingcardinscanner', 'Setting Up Cards ..', 3000, false, true, { 
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, { 
        animDict = 'amb@prop_human_parking_meter@male@base',
        anim = 'base',
        flags = 17,
    }, {}, {}, function() -- Play When Done
        CardInserted = true
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('mercy-fraud:server:removespawnditem', 'emptycard')
    end, function() -- Play When Cancel
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent('mercy-fraud:client:printcheque', function()
    QBCore.Functions.Progressbar('pritingslip', 'Printing Cheque ..', 3000, false, true, { 
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, { 
        animDict = 'amb@prop_human_parking_meter@male@base',
        anim = 'base',
        flags = 17,
    }, {}, {}, function() -- Play When Done
        CardInserted = true
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('mercy-fraud:server:removespawnditem', 'emptyslip')
        TriggerServerEvent('mercy-fraud:server:pickupobjectadd', 'fraudcheque')
    end, function() -- Play When Cancel
        ClearPedTasks(PlayerPedId())
    end)
end)



CreateThread(function()
    while not LocalPlayer.state.isLoggedIn do
        Wait(500)
    end
    while true do 
        if CheckItemsInThePocket() then 
            CarringItem = true
        else
            CarringItem = false
        end
        if CarringItem and not IsEntityPlayingAnim(PlayerPedId(), Config.AnimDir, Config.Animation, 3) then 
            DoAnimationForShoppingBag() 
        elseif not CarringItem and IsEntityPlayingAnim(PlayerPedId(), Config.AnimDir, Config.Animation, 3) then
            ClearPedTasks(PlayerPedId())
        end
        Wait(1500)
    end
end)

CreateThread(function()
    while not LocalPlayer.state.isLoggedIn do
        Wait(500)
    end
    while true do 
        if CarringItem and not DoesEntityExist(ShoppingBag) then 
            MakeShoppingBag()
        elseif not CarringItem and DoesEntityExist(ShoppingBag) then
            DeleteEntity(ShoppingBag)
        end
        Wait(1500)
    end
end)

CreateThread(function()
    for k, v in pairs(Config.Zones) do 
        exports[Config.Target]:AddBoxZone("mercy-fraudingzone-" .. k, v.Zone.Coords, v.Zone.Length, v.Zone.Width, {
            name = "mercy-fraudingzone-" .. k,
            heading = v.Zone.Heading,
            minZ = v.Zone.MinZ,
            maxZ = v.Zone.MaxZ,        
            debugPoly = true,
       }, {
            options = {
                 {
                    type = "client",
                    event = "mercy-fraud:client:usecard",
                    icon = "fas fa-credit-card",
                    label = "Shop",
                    ZoneID = k,
                    item = Config.FakeCardItem,
                    canInteract = function(entity, distance, data) 
                        if Config.Zones[k].Used then return false end 
                        return true
                    end,
                 },
            },
            distance = 2,
       })
    end
end)


RegisterNetEvent('mercy-fraud:client:usecard', function(data)
    local ZoneID = data.ZoneID
    local success = exports.ox_lib:skillCheck({'easy', 'easy', 'hard'}, {'e'})
    if success then  
        QBCore.Functions.TriggerCallback("mercy-fraud:server:giverewarditems", function(data)
            -- nothing to do here --
        end, Config.Zones[ZoneID].Rewards)
    else
        Config.Zones[ZoneID].Used = true
        TriggerServerEvent('mercy-fraud:server:removevisaafterfail')
        -- Plice Call -- 
        TriggerServerEvent('police:server:policeAlert', "Some one Shop Lifting..")
        -- Plice Call -- 
    end

end)

RegisterNetEvent('mercy-fraud:client:atmfraud', function()
    local success = exports.ox_lib:skillCheck({'easy', 'easy', 'hard'}, {'e'})
    if success then  
        TriggerServerEvent('mercy-fraud:server:giveatmreward')
    else
        TriggerServerEvent('mercy-fraud:server:removevisaafterfail')
        -- Plice Call -- 
        TriggerServerEvent('police:server:policeAlert', "Some one Frauding ATM..")
        -- Plice Call -- 
    end
end)

RegisterNetEvent('mercy-fraud:client:chequefraud', function()
    BankerBusy = true 
    TriggerServerEvent('mercy-fraud:server:removespawnditem', 'fraudcheque')

    QBCore.Functions.RequestAnimDict('anim@heists@prison_heiststation@cop_reactions')
    TaskPlayAnim(Banker, "anim@heists@prison_heiststation@cop_reactions", "cop_b_idle", 5.0, -1, -1, 1, 0, false, false, false)

    TriggerEvent("InteractSound_CL:PlayOnOne", "fprocessing", 0.3)
    CurrentIMG = 'state_images/process.png'
    CurrentTexture = CreateRuntimeTxd('banker_txr') 
    CurrentRuntimeTexure = CreateRuntimeTextureFromImage(CurrentTexture, 'banker_state', CurrentIMG)
    Wait(9000)
    if math.random(1, 100) <= Config.ChequeFraudSuccessChance then 
        TriggerEvent("InteractSound_CL:PlayOnOne", "fsuccess", 0.3)
        CurrentIMG = 'state_images/success.png'
        CurrentTexture = CreateRuntimeTxd('banker_txr') 
        CurrentRuntimeTexure = CreateRuntimeTextureFromImage(CurrentTexture, 'banker_state', CurrentIMG)
        TriggerServerEvent('mercy-fraud:server:givecheckreward')
        Wait(1000)
    else
        -- Plice Call -- 
        TriggerServerEvent('police:server:policeAlert', "Some one Frauding Cheques..")
        -- Plice Call -- 
        
        CurrentIMG = 'state_images/warning.png'
        CurrentTexture = CreateRuntimeTxd('banker_txr') 
        CurrentRuntimeTexure = CreateRuntimeTextureFromImage(CurrentTexture, 'banker_state', CurrentIMG)

        TriggerEvent("InteractSound_CL:PlayOnOne", "fdetected", 0.3)
        Wait(1500)
        TriggerEvent("InteractSound_CL:PlayOnOne", "fdetected", 0.3)
        Wait(2000)

        ClearPedTasks(Banker)
        QBCore.Functions.LoadModel('prop_npc_phone_02')
        PhoneProp = CreateObject('prop_npc_phone_02', GetEntityCoords(PlayerPedId()), true, true, false)
        AttachEntityToEntity(PhoneProp, Banker, GetPedBoneIndex(PlayerPedId(), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 20.0, true, true, false, true, 1, true)

        QBCore.Functions.RequestAnimDict('cellphone@')
        TaskPlayAnim(Banker, "cellphone@", "cellphone_call_listen_base", 5.0, -1, -1, 1, 0, false, false, false)
        TriggerEvent("InteractSound_CL:PlayOnOne", "callingcops", 0.3)

        CurrentIMG = 'state_images/callcop.png'
        CurrentTexture = CreateRuntimeTxd('banker_txr') 
        CurrentRuntimeTexure = CreateRuntimeTextureFromImage(CurrentTexture, 'banker_state', CurrentIMG)
        Wait(5000)
    end

    DeleteEntity(PhoneProp)
    BankerBusy = false
    ClearPedTasks(Banker)
end)

function DrawCustomState(x, y, z)
    SetDrawOrigin(x, y, z, 0)
    DrawRect(0.0, 0.0, 0.05, 0.08, 0, 0, 0, 50)
    DrawSprite("banker_txr", "banker_state", 0, 0, 0.038, 0.06, 0, 255, 255, 255, 255)
    ClearDrawOrigin()
end

CreateThread(function()
    while true do 
        local Sleep = 1000
        if BankerBusy then 
            local PlayerCoords = GetEntityCoords(PlayerPedId())
            local BankerCoords = GetEntityCoords(Banker)
            local BoneCoord = GetPedBoneCoords(Banker, 31086)
            local Dis = GetDistanceBetweenCoords(PlayerCoords, BankerCoords)
            if Dis <= 5 then 
                DrawCustomState(BoneCoord.x, BoneCoord.y, BoneCoord.z + 0.43)
                Sleep = 0
            end
        end
        Wait(Sleep)
    end
end)

function CheckItemsInThePocket()
    local HasItems = false
    local PlayerItems = QBCore.Functions.GetPlayerData().items
    for k, v in pairs(Config.Zones) do
        for j, l in pairs(v.Rewards) do
            for i, r in pairs(PlayerItems) do
                if r.name == l then 
                    HasItems = true     
                    break                   
                end
            end 
        end 
    end 
    return HasItems
end

function MakeShoppingBag() 
    QBCore.Functions.LoadModel(Config.Prop)
    ShoppingBag = CreateObject(Config.Prop, GetEntityCoords(PlayerPedId()), true, true, false)
    AttachEntityToEntity(ShoppingBag, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), Config.Bone), 0.05, 0.02, 0.00, 178.80, 91.19, 9.97, 20.0, true, true, false, true, 1, true)
end  

function DoAnimationForShoppingBag() 
    QBCore.Functions.RequestAnimDict(Config.AnimDir)
    TaskPlayAnim(PlayerPedId(), Config.AnimDir, Config.Animation, 5.0, 5.0, -1, 51, 0, false, false, false)
end

RegisterNetEvent('mercy-fraud:client:buyermenu', function()
    local Items = {
        {
            header = 'Buyer Menu',
            icon = 'fas fa-utensils',
            txt = "",
            isMenuHeader = true,
        },
    }    
    for k, i in pairs(Config.Buyer.Items) do
        Items[#Items + 1] = {
            disabled = not HasItem(k),
            header = "<h3>" .. QBCore.Shared.Items[k].label .. "</h3>",
            icon = k,
            txt = 'Price: $' .. i,
            params = {
                event = 'mercy-fraud:client:sellitemstobuyer',
                args = {
                    item = k,  
                    price = i,                                            
                }
            } 
        }
    end
    exports[Config.Menu]:openMenu(Items)
end)

RegisterNetEvent('mercy-fraud:client:sellitemstobuyer', function(data)
    local Item = data.item
    local Price = data.price
    QBCore.Functions.TriggerCallback("mercy-fraud:server:sellitemtobuyer", function(Sold)
        if Sold then 
            exports['okokNotify']:Alert('Fraud', "You Sold An Item .. " .. QBCore.Shared.Items[Item].label, 2000, 'success')
        end
    end, Item, Price)
end)


function HasItem(item)
    local Found = false
    for k, v in pairs(QBCore.Functions.GetPlayerData().items) do
        if item == v.name then
            Found = true 
            break
        end
    end
    if Found then 
        return true 
    else 
        return false 
    end
end

RegisterNetEvent('police:client:policeAlert', function(coords, text)
    local street1, street2 = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street1name = GetStreetNameFromHashKey(street1)
    local street2name = GetStreetNameFromHashKey(street2)
    exports['okokNotify']:Alert('Fraud alert', text, 2000, 'error')
    PlaySound(-1, 'Lose_1st', 'GTAO_FM_Events_Soundset', 0, 0, 1)
    local transG = 250
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    local blip2 = AddBlipForCoord(coords.x, coords.y, coords.z)
    local blipText = text
    SetBlipSprite(blip, 60)
    SetBlipSprite(blip2, 161)
    SetBlipColour(blip, 1)
    SetBlipColour(blip2, 1)
    SetBlipDisplay(blip, 4)
    SetBlipDisplay(blip2, 8)
    SetBlipAlpha(blip, transG)
    SetBlipAlpha(blip2, transG)
    SetBlipScale(blip, 0.8)
    SetBlipScale(blip2, 2.0)
    SetBlipAsShortRange(blip, false)
    SetBlipAsShortRange(blip2, false)
    PulseBlip(blip2)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(blipText)
    EndTextCommandSetBlipName(blip)
    while transG ~= 0 do
        Wait(180 * 4)
        transG = transG - 1
        SetBlipAlpha(blip, transG)
        SetBlipAlpha(blip2, transG)
        if transG == 0 then
            RemoveBlip(blip)
            return
        end
    end
end)

function dmgBar(level)
	local full, empty = dmgBarFull, dmgBarEmpty
	if dmgBarColour then green, yellow, red, grey = table.unpack({"green", "yellow", "red", "grey"})
	else green, yellow, red, grey = table.unpack({"white", "white", "white", "grey"}) end
	local bartable = {}
	for i = 1, 10 do bartable[i] = "<span style='color:"..green.."'>"..full.."</span>" end
	if level <= 91 then bartable[10] = "<span style='color:"..grey.."'>"..empty.."</span>" end
	if level <= 81 then bartable[9] = "<span style='color:"..grey.."'>"..empty.."</span>" end
	if level <= 71 then bartable[8] = "<span style='color:"..grey.."'>"..empty.."</span>" for i = 1, 7 do bartable[i] = "<span style='color:"..yellow.."'>"..full.."</span>" end end
	if level <= 61 then bartable[7] = "<span style='color:"..grey.."'>"..empty.."</span>" end
	if level <= 51 then bartable[6] = "<span style='color:"..grey.."'>"..empty.."</span>" end
	if level <= 41 then bartable[5] = "<span style='color:"..grey.."'>"..empty.."</span>" end
	if level <= 31 then bartable[4] = "<span style='color:"..grey.."'>"..empty.."</span>" for i = 1, 3 do bartable[i] = "<span style='color:"..red.."'>"..full.."</span>" end end
	if level <= 21 then bartable[3] = "<span style='color:"..grey.."'>"..empty.."</span>" end
	if level <= 11 then bartable[2] = "<span style='color:"..grey.."'>"..empty.."</span>" end
	if level <= 1 then bartable[1] = "<span style='color:"..grey.."'>"..empty.."</span>" end
	local bar = ""
	for i = 1, 10 do bar = bar..bartable[i] end
	return bar
end

RegisterNetEvent("onResourceStop", function(resource)
    if resource ~= GetCurrentResourceName() then return end
    DeleteEntity(Geni)
    DeleteEntity(Printer)
    DeleteEntity(Laptop)
    DeleteEntity(Scaner)
end)




