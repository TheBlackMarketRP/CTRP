ClothingIds = {
    top = {
        mask    = {drawable = 1},
        hat     = {prop = 0},
        glass   = {prop = 1},
        ear     = {prop = 2},
    },
    mid = {
        arms    = {drawable = 3},
        tshirt  = {drawable = 8},
        torso   = {drawable = 11},
        chain   = {drawable = 7},
        vest    = {drawable = 9},
        decals  = {drawable = 10},
        bag     = {drawable = 5},
    },
    bottom = {
        pant    = {drawable = 4},
        shoes   = {drawable = 6},
    }
}

SetNaked = {
    top = function(sex)
        for i, v in pairs(ClothingIds.top) do
            if v.drawable then
                SetPedComponentVariation(cache.ped, v.drawable, Config.Defaults[sex][i], 0, 2)
            else
                ClearPedProp(cache.ped, v.prop)
            end
        end
    end,
    mid = function(sex)
        for i, v in pairs(ClothingIds.mid) do
            if v.drawable then
                SetPedComponentVariation(cache.ped, v.drawable, Config.Defaults[sex][i], 0, 2)
            else
                ClearPedProp(cache.ped, v.prop)
            end
        end
    end,
    bottom = function(sex)
        for i, v in pairs(ClothingIds.bottom) do
            if v.drawable then
                SetPedComponentVariation(cache.ped, v.drawable, Config.Defaults[sex][i], 0, 2)
            else
                ClearPedProp(cache.ped, v.prop)
            end
        end
    end,
}

isMale = function()
    local model = GetEntityModel(cache.ped)
    return model == `mp_m_freemode_01` and true or false
end

function calculateHeading(a, b)
    if not a or not b then
        return 0.0
    end
    if a.x == b.x and a.y == b.y then
        return 0.0
    end
    if #(a - b) < 1 then
        return 0.0
    end
    local theta = math.atan(b.x - a.x, a.y - b.y)
    if theta < 0.0 then
        theta = theta + (math.pi * 2)
    end
    return math.deg(theta) + 180 % 360
end

function faceCoords(targetCoords)
    local playerPed = cache.ped
    local playerPos = GetEntityCoords(playerPed)
    local heading = calculateHeading(playerPos, targetCoords)
    SetEntityHeading(playerPed, heading)
end

function generateRandomString()
    local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local result = ""
    for i = 1, 16 do
        local randIndex = math.random(1, #charset)
        result = result .. charset:sub(randIndex, randIndex)
    end
    return result
end

function playAnimBag(bagid)
    local dict, clip = 'amb@medic@standing@tendtodead@idle_a', 'idle_a'
    lib.requestAnimDict(dict)
    if bagid then
        faceCoords(GetEntityCoords(Bags[bagid].prop))
    end
    TaskPlayAnim(cache.ped, dict, clip, 4.0, 4.0, -1, 1)
end
