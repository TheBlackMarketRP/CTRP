Callback = {}


function Callback.RegisterServerCallback(eventName, fn)
    assert(type(eventName) == 'string', 'Invalid Lua type at argument #1, expected string, got ' .. type(eventName))
    assert(type(fn) == 'function', 'Invalid Lua type at argument #2, expected function, got ' .. type(fn))
    AddEventHandler((GetCurrentResourceName()..'server__pmc_callback:%s'):format(eventName), function(cb, s, ...)
        local result = { fn(s, ...) }
        cb(table.unpack(result))
    end)
end

function Callback.TriggerClientCallback(src, eventName, ...)
    assert(type(src) == 'number', 'Invalid Lua type at argument #1, expected number, got ' .. type(src))
    assert(type(eventName) == 'string', 'Invalid Lua type at argument #2, expected string, got ' .. type(eventName))

    local p = promise.new()

    RegisterNetEvent(tostring(GetCurrentResourceName()..'pmc_callback:server:' .. eventName))
    local e = AddEventHandler(tostring(GetCurrentResourceName()..'pmc_callback:server:' .. eventName), function(...)
        local s = source
        if src == s then
            p:resolve({ ... })
        end
    end)

    TriggerClientEvent(tostring(GetCurrentResourceName()..'pmc_callback:client'), src, eventName, ...)

    local result = Citizen.Await(p)
    RemoveEventHandler(e)
    return table.unpack(result)
end

local stored = {}
RegisterNetEvent(tostring(GetCurrentResourceName()..'pmc_callback:server'))
AddEventHandler(tostring(GetCurrentResourceName()..'pmc_callback:server'), function(eventName, ticket, ...)

    stored[ticket] = true
    local s = source
    local p = promise.new()

    TriggerEvent(tostring(GetCurrentResourceName()..'server__pmc_callback:' .. eventName), function(...)
        p:resolve({ ... })
    end, s, ...)

    local result = Citizen.Await(p)
    TriggerClientEvent(tostring((GetCurrentResourceName()..'pmc_callback:client:%s:%s'):format(eventName, ticket)), s, table.unpack(result))

end)


exports('Callback_S', function()
    return Callback_S
end)
