--[[
    RxHousing Adapter for wasabi_mdt
    Maps RxHousing properties to MDT property structure
    Uses RxHousing exports where available
]]

-- This adapter is loaded on-demand when housing functions are called

local function mapPropertyType(rxType)
    local typeMap = {
        ['shell'] = 'apartment',
        ['ipl'] = 'apartment',
        ['mlo'] = 'house',
        ['apartment'] = 'apartment'
    }

    local mappedType = typeMap[rxType] or 'other'

    if Config and Config.PropertyTypes then
        local typeExists = false
        for _, propType in ipairs(Config.PropertyTypes) do
            if propType.type == mappedType then
                typeExists = true
                break
            end
        end

        if not typeExists and #Config.PropertyTypes > 0 then
            Debug('RxHousing adapter: Type "%s" not found in Config, using default "%s"', mappedType, Config.PropertyTypes[1].type)
            mappedType = Config.PropertyTypes[1].type
        end
    end

    return mappedType
end

local function convertPropertyToMDT(property)
    if not property then
        return nil
    end

    -- Parse JSON fields if they're strings
    local coords = property.coords
    if type(coords) == 'string' then
        coords = json.decode(coords or '{}')
    end

    local keyholders = property.keyholders
    if type(keyholders) == 'string' then
        keyholders = json.decode(keyholders or '[]')
    end

    -- Ensure coords are properly formatted
    if coords and type(coords) == 'table' then
        -- Ensure numeric values
        coords.x = tonumber(coords.x) or 0.0
        coords.y = tonumber(coords.y) or 0.0
        coords.z = tonumber(coords.z) or 0.0
    else
        coords = { x = 0.0, y = 0.0, z = 0.0 }
    end

    local result = {
        id = property.id,
        address = property.label or 'Unknown Property',
        property_type = mapPropertyType(property.propertyType),
        owner_id = property.owner,
        coords = coords,
        metadata = {
            shell = property.shell,
            iplName = property.iplName,
            stashGrade = property.stashGrade,
            security = property.security,
            stashId = property.stashId,
            doorModel = property.doorModel,
            isRentable = property.isRentable,
            rentalPrice = property.rentalPrice,
            rentalInterval = property.rentalInterval,
            rentalPaidUntil = property.rentalPaidUntil,
            furnitureLimit = property.furnitureLimit,
            furnishable = property.furnishable,
            apartment = property.apartment,
            keyholders = keyholders,
            fromHousing = true
        },
        created_at = os.time(),
        updated_at = os.time()
    }

    return result
end

function GetPropertyFromHousing(id)
    -- Try getting all properties and finding the one we need
    -- since GetProperty export might not exist or work differently
    local success, allProperties = pcall(function()
        return exports['RxHousing']:GetAllProperties()
    end)

    if success and allProperties and type(allProperties) == 'table' then
        -- Look for the property in the key-value table
        -- Try both numeric and string keys since RxHousing might use either
        local property = allProperties[id] or allProperties[tostring(id)]

        if property then
            return convertPropertyToMDT(property)
        end

        -- If not found by key, search through all properties by id field
        for key, prop in pairs(allProperties) do
            if prop and prop.id == id then
                return convertPropertyToMDT(prop)
            end
        end
    end

    -- Fallback to database query if export didn't work
    local property = MySQL.single.await('SELECT * FROM rx_housing WHERE id = ?', { id })
    if not property then
        return nil
    end

    return convertPropertyToMDT(property)
end

-- Get a property by address/label (using database since export might not exist for this)
function GetPropertyByAddress(address)
    local property = MySQL.single.await('SELECT * FROM rx_housing WHERE label = ?', { address })
    if not property then
        return nil
    end

    return convertPropertyToMDT(property)
end

-- Get all properties with pagination using export
function GetAllPropertiesFromHousing(offset, limit)
    offset = offset or 0
    limit = limit or 30

    -- Try using RxHousing export
    local success, allProperties = pcall(function()
        return exports['RxHousing']:GetAllProperties()
    end)

    if not success then
        Debug('RxHousing adapter: Export failed, using database fallback')

        -- Fallback to database query
        local properties = MySQL.query.await(
            'SELECT * FROM rx_housing ORDER BY label LIMIT ? OFFSET ?',
            { limit, offset }
        )

        local results = {}
        for _, property in ipairs(properties or {}) do
            table.insert(results, convertPropertyToMDT(property))
        end

        return results
    end

    if not allProperties then
        -- Check if database has any properties
        local dbCount = MySQL.scalar.await('SELECT COUNT(*) FROM rx_housing')

        if dbCount and dbCount > 0 then
            local properties = MySQL.query.await(
                'SELECT * FROM rx_housing ORDER BY label LIMIT ? OFFSET ?',
                { limit, offset }
            )

            local results = {}
            for _, property in ipairs(properties or {}) do
                table.insert(results, convertPropertyToMDT(property))
            end

            return results
        end

        return {}
    end

    -- Check if it's a table and has content
    if type(allProperties) == 'table' then
        -- RxHousing returns a key-value table, not an indexed array
        -- We need to convert it to an indexed array for pagination
        local propertyList = {}
        local propertyCount = 0

        for key, property in pairs(allProperties) do
            propertyCount = propertyCount + 1
            table.insert(propertyList, property)
        end

        if propertyCount == 0 then
            -- Check database to see if it's an export issue
            local dbCount = MySQL.scalar.await('SELECT COUNT(*) FROM rx_housing')

            if dbCount and dbCount > 0 then
                local properties = MySQL.query.await(
                    'SELECT * FROM rx_housing ORDER BY label LIMIT ? OFFSET ?',
                    { limit, offset }
                )

                local results = {}
                for _, property in ipairs(properties or {}) do
                    table.insert(results, convertPropertyToMDT(property))
                end

                return results
            end

            return {}
        end

        -- Sort properties by label for consistent ordering
        table.sort(propertyList, function(a, b)
            return (a.label or '') < (b.label or '')
        end)

        -- Apply pagination to the results
        local results = {}
        local startIdx = offset + 1
        local endIdx = math.min(offset + limit, propertyCount)

        for i = startIdx, endIdx do
            if propertyList[i] then
                local converted = convertPropertyToMDT(propertyList[i])
                table.insert(results, converted)
            end
        end

        return results
    end

    -- If we get here, something unexpected happened
    Debug('RxHousing adapter: Unexpected data type from export, using database fallback')
    local properties = MySQL.query.await(
        'SELECT * FROM rx_housing ORDER BY label LIMIT ? OFFSET ?',
        { limit, offset }
    )

    local results = {}
    for _, property in ipairs(properties or {}) do
        table.insert(results, convertPropertyToMDT(property))
    end

    return results
end

-- Search properties by query (database only as export likely doesn't support searching)
function SearchPropertiesFromHousing(query)
    query = '%' .. query:upper() .. '%'

    -- Search in label and owner fields
    local properties = MySQL.query.await([[
        SELECT rx_housing.*, wsb_mdt_citizens.firstname, wsb_mdt_citizens.lastname
        FROM rx_housing
        LEFT JOIN wsb_mdt_citizens ON rx_housing.owner = wsb_mdt_citizens.identifier
        WHERE UPPER(rx_housing.label) LIKE ?
           OR UPPER(rx_housing.owner) LIKE ?
           OR UPPER(CONCAT(wsb_mdt_citizens.firstname, ' ', wsb_mdt_citizens.lastname)) LIKE ?
        LIMIT 50
    ]], { query, query, query })

    local results = {}
    for _, property in ipairs(properties or {}) do
        table.insert(results, convertPropertyToMDT(property))
    end

    return results
end

-- Get properties owned by a specific citizen using export
function GetPropertiesByOwner(identifier)
    -- Try using RxHousing export
    local success, ownedProperties = pcall(function()
        return exports['RxHousing']:GetOwnedProperties(identifier)
    end)

    if not success then
        Debug('RxHousing adapter: Export failed, using database fallback')

        -- Fallback to database query
        local properties = MySQL.query.await(
            'SELECT * FROM rx_housing WHERE owner = ?',
            { identifier }
        )

        local results = {}
        for _, property in ipairs(properties or {}) do
            table.insert(results, convertPropertyToMDT(property))
        end

        return results
    end

    if not ownedProperties then
        return {}
    end

    local results = {}

    -- Check if it's a key-value table or indexed array
    if type(ownedProperties) == 'table' then
        -- Try pairs first (works for both key-value and indexed)
        local count = 0
        for key, property in pairs(ownedProperties) do
            count = count + 1
            table.insert(results, convertPropertyToMDT(property))
        end
    end

    return results
end

-- Get total count of properties
function GetPropertiesCountFromHousing()
    -- Try using export to get all properties and count them
    local success, allProperties = pcall(function()
        return exports['RxHousing']:GetAllProperties()
    end)

    if success and allProperties and type(allProperties) == 'table' then
        -- Count properties in key-value table
        local count = 0
        for _ in pairs(allProperties) do
            count = count + 1
        end
        return count
    end

    -- Fallback to database count
    local count = MySQL.scalar.await('SELECT COUNT(*) FROM rx_housing')
    return count or 0
end

-- Adapter functions are available globally when this file is loaded
Debug('RxHousing adapter: Functions registered successfully')