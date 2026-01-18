local QBCore = exports["qb-core"]:GetCoreObject()


QBCore.Functions.CreateCallback("mercy-id:server:getplayergang", function(source, cb, Players)
    local ReturnData = {}
    for _, player in pairs(Players) do
        ReturnData[#ReturnData + 1] = {
            PlayerId = player.PlayerId,
            PlayerPed = player.PlayerPed,
            PlayerName = player.PlayerName,
            PlayerCoords = player.PlayerCoords,
            gang = exports['ak47_qb_territories']:GetPlayerGang(player.PlayerId),
        }       
    end
    cb(ReturnData)
end)