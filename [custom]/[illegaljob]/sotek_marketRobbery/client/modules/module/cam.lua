Modules.Cam = {
    inAnimationCam = false,
    cams = {},

    RemoveAll = function()
        for k, v in pairs(Modules.Cam.cams) do
            Modules.Cam.delete(k)
        end
        DestroyAllCams(0)
        DestroyAllCams(1)
    end,

    Get = function(name)
        return Modules.Cam.cams[name]
    end,

    isActive = function(name)
        if Modules.Cam.cams[name] ~= nil then
            return IsCamActive(Modules.Cam.cams[name])
        else
            print("^2WARNING: ^7La cam " .. name .. " n'éxiste pas ! (delete)")
        end
    end,

    create = function(name)
        if Modules.Cam.cams[name] ~= nil then
            Modules.Cam.delete(name)
            print("^2WARNING: ^7Cam already existed, deleting it before creating it again (" .. name .. ")")
        end
        local c = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
        Modules.Cam.cams[name] = c
    end,

    delete = function(name)
        if Modules.Cam.cams[name] ~= nil then
            RenderScriptCams(0, 0, 0, 0, 1)
            SetCamActive(Modules.Cam.cams[name], false)
            DestroyCam(Modules.Cam.cams[name], false)
            ClearFocus()
            Modules.Cam.cams[name] = nil
        else
            print("^2WARNING: ^7La cam " .. name .. " n'éxiste pas ! (delete)")
        end
    end,

    setActive = function(name, bool)
        if Modules.Cam.cams[name] ~= nil then
            SetCamActive(Modules.Cam.cams[name], bool)
        else
            print("^2WARNING: ^7La cam " .. name .. " n'éxiste pas ! (setActive)")
        end
    end,

    setPos = function(name, pos)
        if Modules.Cam.cams[name] ~= nil then
            SetFocusPosAndVel(pos.xyz, 0.0, 0.0, 0.0)
            SetCamCoord(Modules.Cam.cams[name], pos.xyz)
        else
            print("^2WARNING: ^7La cam " .. name .. " n'éxiste pas ! (setPos)")
        end
    end,

    setFov = function(name, fov)
        if Modules.Cam.cams[name] ~= nil then
            SetCamFov(Modules.Cam.cams[name], fov)
        else
            print("^2WARNING: ^7La cam " .. name .. " n'éxiste pas ! (setFov)")
        end
    end,

    shake = function(name, type, amplitude)
        if Modules.Cam.cams[name] ~= nil then
            ShakeCam(Modules.Cam.cams[name], type, amplitude)
        else
            print("^2WARNING: ^7La cam " .. name .. " n'éxiste pas ! (lookAtCoords)")
        end

    end,
    lookAtCoords = function(name, pos)
        if Modules.Cam.cams[name] ~= nil then
            PointCamAtCoord(Modules.Cam.cams[name], pos.xyz)
        else
            print("^2WARNING: ^7La cam " .. name .. " n'éxiste pas ! (lookAtCoords)")
        end
    end,

    render = function(name, render, animation, time)
        if Modules.Cam.cams[name] ~= nil then
            SetCamActive(Modules.Cam.cams[name], true)
            RenderScriptCams(render, animation, time, 1, 1)
            if not render then
                ClearFocus()
            end
        else
            print("^2WARNING: ^7La cam " .. name .. " n'éxiste pas ! (render)")
        end
    end,


}
