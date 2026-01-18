Modules.Player = {}
Modules.Player.IsDead = false


function Modules.Player.GetPed()
    return PlayerPedId()
end

function Modules.Player.GetPos()
    return GetEntityCoords(Modules.Player.GetPed())
end
