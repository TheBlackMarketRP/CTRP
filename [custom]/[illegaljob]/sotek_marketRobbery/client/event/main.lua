RegisterNetEvent("Sup:StartRobbery")
AddEventHandler("Sup:StartRobbery", function(key)
    Sup.Main[key].started = true
end)

RegisterNetEvent("Sup:DoneRobbery")
AddEventHandler("Sup:DoneRobbery", function(key)
    Sup.Main[key].done = true
    Modules.UI.RealWait(Sup.ResetTime * 60000)
    Sup.Main[key].started = false
    Sup.Main[key].done = false
    ClearPedTasks(Sup.Peds[key])

end)
