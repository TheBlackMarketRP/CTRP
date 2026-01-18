if GetResourceState('codem-appearance') ~= 'started' then return end

local Sequence = {
    top = {   
        anim = {
            dict = 'mp_cp_stolen_tut',
            clip = 'b_think',
            duration = 2000,
        },
        skin = {
            'mask_1', 'mask_2', 'helmet_1', 'helmet_2',
            'glasses_1', 'glasses_2', 'makeup_1', 'makeup_2', 'makeup_2', 'makeup_3',
            'makeup_4', 'lipstick_1', 'lipstick_2', 'lipstick_3', 'lipstick_4', 'ears_1',
            'ears_2', 'blush_1', 'blush_2', 'blush_3',
        }
    },
    mid = {
        anim = {
            dict = 'mp_safehouseshower@male@',
            clip = 'male_shower_towel_dry_to_get_dressed',
            duration = 4000,
        },
        skin = {
            'tshirt_1', 'tshirt_2', 'torso_1', 'torso_2', 'torso_2', 'decals_1', 'decals_2',
            'arms', 'arms_2', 'bproof_1', 'bproof_2', 'chain_1', 'chain_2', 'chain_2',
            'watches_1', 'watches_2', 'bracelets_1', 'bracelets_2', 'bags_1', 'bags_2',
        }
    },
    bottom = {   
        anim = {
            dict = 'clothingshoes',
            clip = 'try_shoes_positive_d',
            duration = 4000,
        },
        skin = {
            'pants_1', 'pants_2', 'shoes_1', 'shoes_2',
        }
    },
    
}

local Saveables = {
    'tshirt_1', 'tshirt_2', 'torso_1', 'torso_2', 'torso_2', 'decals_1', 'decals_2',
    'arms', 'arms_2', 'pants_1', 'pants_2', 'shoes_1', 'shoes_2', 'mask_1', 'mask_2',
    'bproof_1', 'bproof_2', 'chain_1', 'chain_2', 'chain_2', 'helmet_1', 'helmet_2',
    'glasses_1', 'glasses_2', 'watches_1', 'watches_2', 'bracelets_1', 'bracelets_2',
    'bags_1', 'bags_2', 'makeup_1', 'makeup_2', 'makeup_2', 'makeup_3',
    'makeup_4', 'lipstick_1', 'lipstick_2', 'lipstick_3', 'lipstick_4', 'ears_1',
    'ears_2', 'blush_1', 'blush_2', 'blush_3',
}

SetOutfit = function(data)
    local sex = isMale() and 'male' or 'female'

    lib.requestAnimDict(Sequence.bottom.anim.dict)
    TaskPlayAnim(cache.ped, Sequence.bottom.anim.dict, Sequence.bottom.anim.clip, 2.0, 2.0, -1, 1)
    Wait(Sequence.bottom.anim.duration / 2)
    SetNaked.bottom(sex)
    Wait(Sequence.bottom.anim.duration / 2)
    TriggerEvent('skinchanger:getSkin', function(playerSkin)
        local skin = {}
        for i, v in pairs(Sequence.bottom.skin) do
            skin[v] = data[v]
        end
        TriggerEvent('skinchanger:loadClothes', playerSkin, skin)
    end)

    lib.requestAnimDict(Sequence.mid.anim.dict)
    TaskPlayAnim(cache.ped, Sequence.mid.anim.dict, Sequence.mid.anim.clip, 2.0, 2.0, -1, 1)
    Wait(Sequence.mid.anim.duration / 2)
    SetNaked.mid(sex)
    Wait(Sequence.mid.anim.duration / 2)
    TriggerEvent('skinchanger:getSkin', function(playerSkin)
        local skin = {}
        for i, v in pairs(Sequence.mid.skin) do
            skin[v] = data[v]
        end
        TriggerEvent('skinchanger:loadClothes', playerSkin, skin)
    end)

    lib.requestAnimDict(Sequence.top.anim.dict)
    TaskPlayAnim(cache.ped, Sequence.top.anim.dict, Sequence.top.anim.clip, 2.0, 2.0, -1, 1)
    Wait(Sequence.top.anim.duration / 4)
    SetNaked.top(sex)
    Wait(Sequence.top.anim.duration / 2)
    TriggerEvent('skinchanger:getSkin', function(playerSkin)
        local skin = {}
        for i, v in pairs(Sequence.top.skin) do
            skin[v] = data[v]
        end
        TriggerEvent('skinchanger:loadClothes', playerSkin, skin)
    end)

    ClearPedTasks(cache.ped)

    SaveSkin()
end

GetOutfits = function(meta)
    return lib.callback.await('ak47_qb_outfitbag:getoutfits', nil, meta)
end

AddOutfit = function(outfitid, name, bagid)
    local skin = {}
    TriggerEvent('skinchanger:getSkin', function(playerSkin)
        for i, v in pairs(Saveables) do
            if playerSkin[v] then
                skin[v] = playerSkin[v]
            end
        end
        TriggerServerEvent('ak47_qb_outfitbag:addoutfit', outfitid, name, skin, bagid, isMale(), Config.Bags[Bags[bagid].item].uniqueBag)
    end)
end

SaveSkin = function(data)
    Wait(1000)
    TriggerEvent('skinchanger:getSkin', function(playerSkin)
        TriggerServerEvent('esx_skin:save', playerSkin)
    end)
end