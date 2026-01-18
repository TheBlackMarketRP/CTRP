if GetResourceState('qb-clothing')          ~= 'started' then return end
if GetResourceState('illenium-appearance')  == 'started' then return end
if GetResourceState('codem-appearance')     == 'started' then return end

local Sequence = {
    top = {   
        anim = {
            dict = 'mp_cp_stolen_tut',
            clip = 'b_think',
            duration = 2000,
        },
        skin = {
            'mask', 'hat', 'glass', 'makeup',
            'makeup_color', 'lipstick', 
            'lipstick_color', 'ear',
            'blush', 'blush_color',
        }
    },
    mid = {
        anim = {
            dict = 'mp_safehouseshower@male@',
            clip = 'male_shower_towel_dry_to_get_dressed',
            duration = 4000,
        },
        skin = {
            't-shirt', 'torso2', 'decals',
            'arms', 'vest', 'accessory', 'bag',
        }
    },
    bottom = {   
        anim = {
            dict = 'clothingshoes',
            clip = 'try_shoes_positive_d',
            duration = 4000,
        },
        skin = {
            'pants', 'shoes',
        }
    },
    
}

local Saveables = {
    't-shirt', 'torso2', 'decals',
    'arms', 'pants', 'shoes', 'mask',
    'vest', 'accessory', 'hat',
    'glass', 'watch', 'bracelet',
    'bag', 'makeup',
    'makeup_color', 'lipstick', 
    'lipstick_color', 'ear',
    'blush', 'blush_color',
}

SetOutfit = function(data)
    local sex = isMale() and 'male' or 'female'
    
    lib.requestAnimDict(Sequence.bottom.anim.dict)
    TaskPlayAnim(cache.ped, Sequence.bottom.anim.dict, Sequence.bottom.anim.clip, 2.0, 2.0, -1, 1)
    Wait(Sequence.bottom.anim.duration / 2)
    SetNaked.bottom(sex)
    Wait(Sequence.bottom.anim.duration / 2)
    
    local skin = {}
    for i, v in pairs(Sequence.bottom.skin) do
        skin[v] = data[v]
    end
    TriggerEvent('qb-clothing:client:loadOutfit', {
        outfitData = skin
    })

    lib.requestAnimDict(Sequence.mid.anim.dict)
    TaskPlayAnim(cache.ped, Sequence.mid.anim.dict, Sequence.mid.anim.clip, 2.0, 2.0, -1, 1)
    Wait(Sequence.mid.anim.duration / 2)
    SetNaked.mid(sex)
    Wait(Sequence.mid.anim.duration / 2)

    local skin = {}
    for i, v in pairs(Sequence.mid.skin) do
        skin[v] = data[v]
    end
    TriggerEvent('qb-clothing:client:loadOutfit', {
        outfitData = skin
    })

    lib.requestAnimDict(Sequence.top.anim.dict)
    TaskPlayAnim(cache.ped, Sequence.top.anim.dict, Sequence.top.anim.clip, 2.0, 2.0, -1, 1)
    Wait(Sequence.top.anim.duration / 4)
    SetNaked.top(sex)
    Wait(Sequence.top.anim.duration / 2)

    local skin = {}
    for i, v in pairs(Sequence.top.skin) do
        skin[v] = data[v]
    end
    TriggerEvent('qb-clothing:client:loadOutfit', {
        outfitData = skin
    })

    ClearPedTasks(cache.ped)
    SaveSkin()
end

GetOutfits = function(meta)
    return lib.callback.await('ak47_qb_outfitbag:getoutfits', nil, meta)
end

AddOutfit = function(outfitid, name, bagid)
    local outfit = {}
    local skin = lib.callback.await('ak47_qb_outfitbag:getskin')
    for i, v in pairs(Saveables) do
        if skin[v] then
            outfit[v] = skin[v]
        end
    end
    TriggerServerEvent('ak47_qb_outfitbag:addoutfit', outfitid, name, outfit, bagid, isMale(), Config.Bags[Bags[bagid].item].uniqueBag)
end

SaveSkin = function(data)
    
end