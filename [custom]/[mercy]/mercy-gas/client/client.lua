local QBCore = exports[Config.Core]:GetCoreObject()
Config.AnimDir = "mp_player_intdrink"
Config.Animation = "loop_bottle"
local GasProp = nil
local Boost = {
    onHealth = false,
    HealthTimer = 0,
    HealthTimerrMax = 0,
    onArmor = false,
    ArmorTimer = 0,
    ArmorTimerrMax = 0,
    onStamina = false,
    StaminaTimer = 0,
    StaminaTimerrMax = 0,
    onStress = false,
    SterssTimer = 0,
    SterssTimerMax = 0,
}



RegisterCommand("gas", function(_, args)    
    TriggerEvent("mgas:client:gasmenu")
end)

RegisterNetEvent("mgas:client:gasmenu", function()
    local BottleMenu = {
        {
            header = "Gas Bottle Menu",
            icon = 'fas fa-bottle-water',
            txt = "",
            isMenuHeader = true,
        },
    }

    for k, v in pairs(Config.Bottles)  do 
        BottleMenu[#BottleMenu + 1] = {
            icon = v.item,
            header = v.label,
            txt = "",
            params = {
                event = 'mgas:client:setcurrentbottle',
                args = {
                    prop = v.prop,                                   
                }
            }
        }
    end

    BottleMenu[#BottleMenu + 1] = {
        header = "Close",
        icon = "fas fa-xmark",
        txt = "",
        params = {
            event = '',
        }
    }

    exports[Config.Menu]:openMenu(BottleMenu)
end)

RegisterNetEvent("mgas:client:setcurrentbottle", function(data)
    Config.CurerntProp = data.prop
end)

RegisterNetEvent("mgas:client:usinggasbottle", function()
    MainInit()
end)

function MainInit()
    MakingBottleProp(Config.CurerntProp)
    UsingGasAnim() 
    MakingSmokeForGas()
    Wait(4000)
    StopGasAnim()
    RemoveBottleProp()
    Boost.onStamina = true 
    Boost.StaminaTimerrMax = Config.BoostTime 
    Boost.StaminaTimer = Config.BoostTime 
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
    SetSwimMultiplierForPlayer(PlayerId(), 1.49)
    CreateThread(function()
        while true do         
            if IsEntityDead(PlayerPedId()) then 
                Boost.onStamina = false 
                Boost.StaminaTimer = 0
                SendNUIMessage({
                    action = 'StaminaOff',
                })
                break
            end
            if Boost.StaminaTimer <= 0 then 
                Boost.onStamina = false 
                Boost.StaminaTimer = 0
                SendNUIMessage({
                    action = 'StaminaOff',
                })
                break
            else
                Boost.StaminaTimer = Boost.StaminaTimer - 1
                SendNUIMessage({
                    action = 'StaminaUI',
                    left = (Boost.StaminaTimer / Boost.StaminaTimerrMax) * 100 
                })
                if math.random(1, 100) < 20 then
                    RestorePlayerStamina(PlayerId(), 1.0)
                end
            end                
            Wait(1000)
        end
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
        SetSwimMultiplierForPlayer(PlayerId(), 1.0)
    end)
end

function MakingBottleProp(prop) 
    QBCore.Functions.LoadModel(prop)
    local ProSpawnCoords = GetEntityCoords(PlayerPedId())
    GasProp = CreateObject(prop, ProSpawnCoords.x, ProSpawnCoords.y, ProSpawnCoords.z + 100, false, true, false)
    SetEntityCollision(GasProp, false)
    AttachEntityToEntity(GasProp, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.12, 0.008, 0.03, 240.0, -60.0, 0.0, 20.0, true, true, false, true, 1, true)
end  

function UsingGasAnim() 
    QBCore.Functions.RequestAnimDict(Config.AnimDir)
    TaskPlayAnim(PlayerPedId(), Config.AnimDir, Config.Animation, 5.0, 5.0, -1, 51, 0, false, false, false)
end

function MakingSmokeForGas()
    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10.0, "mgas", 1.0)
    local ped = PlayerPedId()
	local pos = GetEntityCoords(ped)
	local pedNet = PedToNet(ped)
    TriggerServerEvent("mgas:server:syncSmoke", pedNet, pos)
end

function StopGasAnim()
    ClearPedTasks(PlayerPedId())
end

function RemoveBottleProp()
    DeleteEntity(GasProp)
end

RegisterNetEvent("mgas:client:syncSmoke", function(netPed, pos)
	local ped = PlayerPedId()
	local plyPos = GetEntityCoords(ped)
	local pedNet = NetToPed(netPed)
	if #(plyPos - pos) < 150.0 then
		PtfxThis("scr_agencyheistb")
		vapeClouds = StartNetworkedParticleFxLoopedOnEntityBone("scr_agency3b_elec_box", pedNet, -0.0290, 0.0070, -0.0050, 91.0, 270.0, -360.0, GetPedBoneIndex(pedNet, 31086), 1.2, 0.0, 0.0, 0.0)
		SetParticleFxLoopedAlpha(vapeClouds, 0.3) 
        SetParticleFxLoopedColour(vapeClouds, 255.0, 10.0, 10.0, false)
		SetTimeout(5000, function()
			StopParticleFxLooped(vapeClouds, 0)
			RemoveParticleFxFromEntity(pedNet)
			RemoveParticleFx("scr_agency3b_elec_box", true)
		end)
	end
end)

function PtfxThis(asset)
    while not HasNamedPtfxAssetLoaded(asset) do
        RequestNamedPtfxAsset(asset)
        Wait(10)
    end
    UseParticleFxAsset(asset)
end


AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
    DeleteEntity(GasProp)
end)