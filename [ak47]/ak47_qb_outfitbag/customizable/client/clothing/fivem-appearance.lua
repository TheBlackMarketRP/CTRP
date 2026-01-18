if GetResourceState('fivem-appearance') ~= 'started' then return end

local Sequence = {
    top = {   
        anim = {
            dict = 'mp_cp_stolen_tut',
            clip = 'b_think',
            duration = 2000,
        },
        skin = {
            components = {1},
            props = {0, 1, 2},
        }
    },
    mid = {
        anim = {
            dict = 'mp_safehouseshower@male@',
            clip = 'male_shower_towel_dry_to_get_dressed',
            duration = 4000,
        },
        skin = {
            components = {3,8,11,7,9,10,5},
        }
    },
    bottom = {   
        anim = {
            dict = 'clothingshoes',
            clip = 'try_shoes_positive_d',
            duration = 4000,
        },
        skin = {
            components = {4,6},
        }
    },
}

local getComponentById = function(components, id)
    for i, v in pairs(components) do
        if v.component_id == id then
            return v
        end
    end
end

local getPropById = function(props, id)
    for i, v in pairs(props) do
        if v.prop_id == id then
            return v
        end
    end
end

SetOutfit = function(data)
    local sex = isMale() and 'male' or 'female'

    lib.requestAnimDict(Sequence.bottom.anim.dict)
    TaskPlayAnim(cache.ped, Sequence.bottom.anim.dict, Sequence.bottom.anim.clip, 2.0, 2.0, -1, 1)
    Wait(Sequence.bottom.anim.duration / 2)
    SetNaked.bottom(sex)
    Wait(Sequence.bottom.anim.duration / 2)

    if Sequence.bottom.skin.components then
        local components = {}
        for i, v in pairs(Sequence.bottom.skin.components) do
            table.insert(components, getComponentById(data.components, v))
        end
        exports['fivem-appearance']:setPedComponents(cache.ped, components)
    end
    if Sequence.bottom.skin.props then
        local props = {}
        for i, v in pairs(Sequence.bottom.skin.props) do
            table.insert(props, getPropById(data.props, v))
        end
        exports['fivem-appearance']:setPedProps(cache.ped, props)
    end

    lib.requestAnimDict(Sequence.mid.anim.dict)
    TaskPlayAnim(cache.ped, Sequence.mid.anim.dict, Sequence.mid.anim.clip, 2.0, 2.0, -1, 1)
    Wait(Sequence.mid.anim.duration / 2)
    SetNaked.mid(sex)
    Wait(Sequence.mid.anim.duration / 2)
    
    if Sequence.mid.skin.components then
        local components = {}
        for i, v in pairs(Sequence.mid.skin.components) do
            table.insert(components, getComponentById(data.components, v))
        end
        exports['fivem-appearance']:setPedComponents(cache.ped, components)
    end
    if Sequence.mid.skin.props then
        local props = {}
        for i, v in pairs(Sequence.mid.skin.props) do
            table.insert(props, getPropById(data.props, v))
        end
        exports['fivem-appearance']:setPedProps(cache.ped, props)
    end

    lib.requestAnimDict(Sequence.top.anim.dict)
    TaskPlayAnim(cache.ped, Sequence.top.anim.dict, Sequence.top.anim.clip, 2.0, 2.0, -1, 1)
    Wait(Sequence.top.anim.duration / 4)
    SetNaked.top(sex)
    Wait(Sequence.top.anim.duration / 2)
    
    if Sequence.top.skin.components then
        local components = {}
        for i, v in pairs(Sequence.top.skin.components) do
            table.insert(components, getComponentById(data.components, v))
        end
        exports['fivem-appearance']:setPedComponents(cache.ped, components)
    end
    if Sequence.top.skin.props then
        local props = {}
        for i, v in pairs(Sequence.top.skin.props) do
            table.insert(props, getPropById(data.props, v))
        end
        exports['fivem-appearance']:setPedProps(cache.ped, props)
    end

    ClearPedTasks(cache.ped)
    SaveSkin()
end

GetOutfits = function(meta)
    return lib.callback.await('ak47_qb_outfitbag:getoutfits', nil, meta)
end

AddOutfit = function(outfitid, name, bagid)
    local skin = {
        components = exports['fivem-appearance']:getPedComponents(cache.ped), 
        props = exports['fivem-appearance']:getPedProps(cache.ped)
    }
    TriggerServerEvent('ak47_qb_outfitbag:addoutfit', outfitid, name, skin, bagid, isMale(), Config.Bags[Bags[bagid].item].uniqueBag)
end

SaveSkin = function(data)
    TriggerServerEvent('fivem-appearance:server:saveAppearance', exports['fivem-appearance']:getPedAppearance(cache.ped))
end