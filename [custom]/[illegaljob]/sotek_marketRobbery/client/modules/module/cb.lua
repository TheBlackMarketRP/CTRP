Callback = {}

function Callback.TriggerServerCallback(eventName, ...)
	assert(type(eventName) == 'string', 'Invalid Lua type at argument #1, expected string, got ' .. type(eventName))

	local p = promise.new()
	local ticket = GetGameTimer()

	RegisterNetEvent((GetCurrentResourceName()..'pmc_callback:client:%s:%s'):format(eventName, ticket))
	local e = AddEventHandler((GetCurrentResourceName()..'pmc_callback:client:%s:%s'):format(eventName, ticket), function(...)
		p:resolve({ ... })
	end)

	TriggerServerEvent(GetCurrentResourceName()..'pmc_callback:server', eventName, ticket, ...)

	local result = Citizen.Await(p)
	RemoveEventHandler(e)
	return table.unpack(result)
end

function Callback.RegisterClientCallback(eventName, fn)
	assert(type(eventName) == 'string', 'Invalid Lua type at argument #1, expected string, got ' .. type(eventName))
	assert(type(fn) == 'function', 'Invalid Lua type at argument #2, expected function, got ' .. type(fn))

	AddEventHandler((GetCurrentResourceName()..'client__pmc_callback:%s'):format(eventName), function(cb, ...)
		cb(fn(...))
	end)
end

RegisterNetEvent(GetCurrentResourceName()..'pmc_callback:client')
AddEventHandler(GetCurrentResourceName()..'pmc_callback:client', function(eventName, ...)
	local p = promise.new()

	TriggerEvent((GetCurrentResourceName()..'client__pmc_callback:%s'):format(eventName), function(...)
		p:resolve({ ... })
	end, ...)

	local result = Citizen.Await(p)
	TriggerServerEvent((GetCurrentResourceName()..'pmc_callback:server:%s'):format(eventName), table.unpack(result))
end)

