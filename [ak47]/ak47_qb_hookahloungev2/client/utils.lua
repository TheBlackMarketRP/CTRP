QBCore = exports['qb-core']:GetCoreObject()
PlayerData = {}

Citizen.CreateThread(function()
    while QBCore == nil do
        Citizen.Wait(1000)
    end
    while QBCore.Functions == nil do
        Citizen.Wait(100)
    end
    while QBCore.Functions.GetPlayerData() == nil do
        Citizen.Wait(100)
    end
    PlayerData = QBCore.Functions.GetPlayerData()
    createBlip()
end)

function createBlip()
    local coords = Config.Blip.pos
    local radius = Config.Blip.radius + 0.00
    local blipRd = AddBlipForRadius(coords, radius)
    SetBlipHighDetail(blipRd, true)
    SetBlipColour(blipRd, Config.Blip.color)
    SetBlipAlpha (blipRd, 128)
    SetBlipAsShortRange(blipRd, true)
    local blip = AddBlipForCoord(coords)
    SetBlipHighDetail(blip, true)
    SetBlipSprite (blip, Config.Blip.id)
    SetBlipScale  (blip, Config.Blip.size)
    SetBlipColour (blip, Config.Blip.color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.Blip.name)
    EndTextCommandSetBlipName(blip)
end

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('ak47_qb_hookahloungev2:notify')
AddEventHandler('ak47_qb_hookahloungev2:notify', function(msg, type)
    QBCore.Functions.Notify(msg, type)
end)

RegisterNetEvent('ak47_qb_hookahloungev2:progress')
AddEventHandler('ak47_qb_hookahloungev2:progress', function(msg, time)
    QBCore.Functions.Progressbar(msg, msg, time, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done

    end, function()

    end)
end)

local effectid = 0
function effectHookah()
    local effectnow = effectid
    SetTimecycleModifierStrength(0.0)
    SetTimecycleModifier('spectator6')
    SetPedMotionBlur(PlayerPedId(), true)
    Citizen.Wait(5000)
    if effectid ~= effectnow then return end
    SetTimecycleModifierStrength(0.66)
    Citizen.Wait(3000)
    if effectid ~= effectnow then return end
    ShakeGameplayCam('DRUNK_SHAKE', 0.3)
    Citizen.Wait(3000)
    if effectid ~= effectnow then return end
    AddArmourToPed(PlayerPedId(), 25)
    RequestClipSet('MOVE_M@DRUNK@SLIGHTLYDRUNK')
    while not HasClipSetLoaded('MOVE_M@DRUNK@SLIGHTLYDRUNK') do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), 'MOVE_M@DRUNK@SLIGHTLYDRUNK', true)
    TriggerServerEvent('hud:server:RelieveStress', math.random(20, 25))
    Citizen.Wait(30000)
    if effectid ~= effectnow then return end
    ClearTimecycleModifier()
    Citizen.Wait(15000)
    if effectid ~= effectnow then return end
    ShakeGameplayCam('DRUNK_SHAKE', 0.0)
    SetPedMotionBlur(PlayerPedId(), false)
    Citizen.Wait(15000)
    if effectid ~= effectnow then return end
    ResetPedMovementClipset(PlayerPedId(), 0)
end

local effectRunning = false
AddEventHandler('ak47_qb_hookahloungev2:smoke', function()
    if not effectRunning then
        effectRunning = true
        effectHookah()
        effectRunning = false
    end
end)

--bar effect
AddEventHandler('ak47_qb_hookahloungev2:ondrink:cocktail', function()
    effectid += 1
    effectHookah()
end)
AddEventHandler('ak47_qb_hookahloungev2:ondrink:champagne', function()
    effectid += 1
    effectHookah()
end)
AddEventHandler('ak47_qb_hookahloungev2:ondrink:daiquiri', function()
    effectid += 1
    effectHookah()
end)
AddEventHandler('ak47_qb_hookahloungev2:ondrink:redwine', function()
    effectid += 1
    effectHookah()
end)
AddEventHandler('ak47_qb_hookahloungev2:ondrink:whitewine', function()
    effectid += 1
    effectHookah()
end)
AddEventHandler('ak47_qb_hookahloungev2:ondrink:whisky', function()
    effectid += 1
    effectHookah()
end)
AddEventHandler('ak47_qb_hookahloungev2:ondrink:tequilashots', function()
    effectid += 1
    effectHookah()
end)
AddEventHandler('ak47_qb_hookahloungev2:ondrink:mojito', function()
    effectid += 1
    effectHookah()
end)
AddEventHandler('ak47_qb_hookahloungev2:ondrink:leaflatte', function()
    effectid += 1
    effectHookah()
end)

function playAnim(dir, anim, blendIn, blendOut, duration, flag, playbackRate)
    local playerPed = PlayerPedId()
    RequestAnimDict(dir)
    while not HasAnimDictLoaded(dir) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(playerPed, dir, anim, blendIn + 0.0, blendOut + 0.0, duration, flag, playbackRate, 0, 0, 0)
end

DrawTxt3D = function(coords, text)
    local str = text
    AddTextEntry(GetCurrentResourceName(), str)
    BeginTextCommandDisplayHelp(GetCurrentResourceName())
    EndTextCommandDisplayHelp(2, false, false, -1)
    SetFloatingHelpTextWorldPosition(1, coords)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
end