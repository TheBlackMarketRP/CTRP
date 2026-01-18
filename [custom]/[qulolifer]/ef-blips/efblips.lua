if Config.blipsShow then
    CreateThread(function()
        for _,v in pairs(Config.Locations) do
            local blip = AddBlipForCoord(v.vector)
            SetBlipSprite(blip, v.sprite)
            SetBlipScale(blip, v.scale)
            SetBlipColour(blip, v.color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.text)
            EndTextCommandSetBlipName(blip)
        end
    end)
end

CreateThread(function()
    for _,v in pairs(Config.Safezones) do
        local ZoneBlip = AddBlipForRadius(v.coords, v.radius)                 
        SetBlipColour(ZoneBlip, v.color)
        SetBlipAlpha(ZoneBlip, v.alpha)  
    end
end)
