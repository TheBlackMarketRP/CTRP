local QBCore = exports[Config.Core]:GetCoreObject()
local Searched = {}


CreateThread(function()
    exports[Config.Target]:AddTargetModel(Config.DumpsterModels, { 
        options = { 
            { 
                event = "mercy-trashitems:client:opendumpster", 
                icon = "fas fa-dumpster", 
                label = 'Search Trash', 
            }, 
        }, 
        distance = 1.5 
    })
end)

RegisterNetEvent('mercy-trashitems:client:opendumpster', function(data)
    local Id = data.entity
    if Searched[Id] then 
        local Diff = (GetGameTimer() - Searched[Id]) / 1000
        if Diff <= Config.NewItemsInterval then 
            QBCore.Functions.Notify("Can't Search Yet", "error")
            return false
        end
        OpenDumpsterProgress(Id)
    else
        OpenDumpsterProgress(Id)
    end
end)

function OpenDumpsterProgress(Id)
    QBCore.Functions.Progressbar("opendumpstart", "Opening Trash...", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        anim = "machinic_loop_mechandplayer",
        flags = 51,
    }, {}, {}, function() -- Done 
        Searched[Id] = GetGameTimer()
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent("mercy-trashitems:server:opendumpster")
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
    end)
end


