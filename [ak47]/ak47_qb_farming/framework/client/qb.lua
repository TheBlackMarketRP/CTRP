QBCore = exports['qb-core']:GetCoreObject()
PlayerLoaded = false

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        local data = QBCore.Functions.GetPlayerData()
        if data and data.job then
            PlayerData = data
            PlayerLoaded = true
        end
    end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
    createlandLordBlip()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    while not QBCore.Functions.GetPlayerData().job do Wait(1000) end
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerLoaded = true
end)

RegisterNetEvent('ak47_qb_farming:notify', function(type, msg)
    Notify(type, msg)
end)

function ShowHelpNotification(msg, thisFrame, beep, duration)
    AddTextEntry("ak47_qb_farmingHelpNotification", msg)
    if thisFrame then
        DisplayHelpTextThisFrame("ak47_qb_farmingHelpNotification", false)
    else
        BeginTextCommandDisplayHelp("ak47_qb_farmingHelpNotification")
        EndTextCommandDisplayHelp(0, false, beep == nil or beep, duration or -1)
    end
end

function GetHeadingFromPoints(a, b)
    if not a or not b then
        return 0.0
    end
    if a.x == b.x and a.y == b.y then
        return 0.0
    end
    if #(a - b) < 1 then
        return 0.0
    end
    local theta = math.atan(b.x - a.x,a.y - b.y)
    if theta < 0.0 then
        theta = theta + (math.pi * 2)
    end
    return math.deg(theta) + 180 % 360
end

function DrawText3D(coords, text, size, font)
    local onScreen, x, y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local camCoords      = GetGameplayCamCoords()
    local dist           = GetDistanceBetweenCoords(camCoords, coords.x, coords.y, coords.z, true)
    local size           = size

    if size == nil then
        size = 1
    end

    local scale = (size / dist) * 2
    local fov   = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov

    if onScreen then
        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextFont(font)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry('STRING')
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(x, y)
    end
end

DrawTxt3D = function(coords, text)
    local str = text
    AddTextEntry(GetCurrentResourceName(), str)
    BeginTextCommandDisplayHelp(GetCurrentResourceName())
    EndTextCommandDisplayHelp(2, false, false, -1)
    SetFloatingHelpTextWorldPosition(1, coords)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
end