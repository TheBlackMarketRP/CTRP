function HasDisallowedWeapon(shieldType)
    local shield = Config.shields[shieldType]
    if not shield then return true end

    local ped = PlayerPedId()
    local _, weaponHash = GetCurrentPedWeapon(ped, true)
    return not lib.table.contains(shield.weapons, weaponHash)
end

function Animation(dict, anim, flag)
    local self = {}

    self.dict = dict
    self.anim = anim
    self.flag = flag or 51
    self.isPlaying = false
    self.ped = PlayerPedId()

    self.play = function()
        if self.isPlaying then
            return self
        end
        self.isPlaying = true
        CreateThread(function()
            RequestAnimDict(self.dict)
            repeat Wait(0) until HasAnimDictLoaded(self.dict)
            TaskPlayAnim(self.ped, self.dict, self.anim, 8.0, 1.0, -1, self.flag, 0.0, false, false, false)
        end)

        return self
    end

    self.forceAnim = function()
        CreateThread(function()
            while self.isPlaying do
                if not IsEntityPlayingAnim(self.ped, self.dict, self.anim, 3) then
                    TaskPlayAnim(self.ped, self.dict, self.anim, 8.0, 1.0, -1, self.flag, 0.0, false, false, false)
                end
                Wait(500)
            end
        end)

        return self
    end

    self.stop = function(stopAfter)
        if not self.isPlaying then
            return self
        end
        self.isPlaying = false
        CreateThread(function()
            if stopAfter then
                Wait(stopAfter)
            end
            StopAnimTask(self.ped, self.dict, self.anim, 2.0)
            RemoveAnimDict(self.dict)
        end)

        return self
    end

    return self
end
