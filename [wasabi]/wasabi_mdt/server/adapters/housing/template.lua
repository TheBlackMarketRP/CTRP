--[[
    HOUSING ADAPTER TEMPLATE for wasabi_mdt

    This template shows how to integrate your housing script with wasabi_mdt.
    Replace "YourHousingScript" with your actual housing script name.
]]

-- STEP 1: Map your housing property types to MDT property types
-- MDT types: house, apartment, business, warehouse, garage, office, store, industrial, land, other
local function mapPropertyType(yourPropertyType)
    local typeMap = {
        -- Map your housing script's property types to MDT types
        -- Examples:
        ['small_house'] = 'house',
        ['medium_house'] = 'house',
        ['large_house'] = 'house',
        ['apartment'] = 'apartment',
        ['motel'] = 'apartment',
        ['office'] = 'office',
        ['warehouse'] = 'warehouse',
        ['shop'] = 'store',
        -- Add your mappings here...
    }

    local mappedType = typeMap[yourPropertyType] or 'other'

    -- Validate that the type exists in Config
    if Config and Config.PropertyTypes then
        local typeExists = false
        for _, propType in ipairs(Config.PropertyTypes) do
            if propType.type == mappedType then
                typeExists = true
                break
            end
        end

        -- If type doesn't exist, use the first available type
        if not typeExists and #Config.PropertyTypes > 0 then
            Debug('Housing adapter: Type "%s" not found in Config, using default', mappedType)
            mappedType = Config.PropertyTypes[1].type
        end
    end

    return mappedType
end

-- STEP 2: Convert your housing property data to MDT format
local function convertPropertyToMDT(property)
    if not property then
        return nil
    end

    -- Parse coordinates if they're stored as JSON string
    local coords = property.coords  -- Adjust field name to match your script
    if type(coords) == 'string' then
        coords = json.decode(coords or '{}')
    end

    -- Ensure coordinates are properly formatted
    if coords and type(coords) == 'table' then
        coords.x = tonumber(coords.x) or 0.0
        coords.y = tonumber(coords.y) or 0.0
        coords.z = tonumber(coords.z) or 0.0
    else
        coords = { x = 0.0, y = 0.0, z = 0.0 }
    end

    -- Return the MDT-formatted property
    return {
        id = property.id,                                          -- Property ID (required)
        address = property.label or property.name or 'Unknown',   -- Property address/name (required)
        property_type = mapPropertyType(property.type),            -- MDT property type (required)
        owner_id = property.owner or property.owner_identifier,    -- Owner's identifier
        coords = coords,                                           -- Coordinates table {x, y, z}
        metadata = {
            -- Add any extra data you want to store
            -- This is preserved but not required
            original_type = property.type,
            price = property.price,
            garage = property.garage,
            -- Add more fields as needed...
            fromHousing = true  -- Flag to indicate this is from housing system
        },
        created_at = property.created_at or os.time(),
        updated_at = property.updated_at or os.time()
    }
end

-- Helper function to handle both indexed arrays and key-value tables
local function convertTableToArray(tbl)
    if not tbl or type(tbl) ~= 'table' then
        return {}
    end

    local array = {}
    local count = 0

    -- Try to detect if it's already an indexed array
    if #tbl > 0 then
        -- It's an indexed array, use it directly
        return tbl
    else
        -- It's a key-value table, convert to array
        for key, value in pairs(tbl) do
            count = count + 1
            table.insert(array, value)
        end
        return array
    end
end

-- REQUIRED FUNCTION: Get a single property by ID
function GetPropertyFromHousing(id)
    -- Try using your housing script's export to get all properties
    -- Then find the specific one (more reliable than single property exports)
    local success, allProperties = pcall(function()
        return exports['YourHousingScript']:GetAllProperties()  -- Adjust export name
    end)

    if success and allProperties and type(allProperties) == 'table' then
        -- Handle both key-value and indexed tables
        local property = allProperties[id] or allProperties[tostring(id)]

        if property then
            return convertPropertyToMDT(property)
        end

        -- If not found by key, search through all properties
        for _, prop in pairs(allProperties) do
            if prop and (prop.id == id or tostring(prop.id) == tostring(id)) then
                return convertPropertyToMDT(prop)
            end
        end
    end

    -- Fallback: Query database directly if export fails
    -- Adjust table name and columns to match your housing script
    local property = MySQL.single.await('SELECT * FROM your_housing_table WHERE id = ?', { id })
    if property then
        return convertPropertyToMDT(property)
    end

    return nil
end

-- REQUIRED FUNCTION: Get a property by address/name
function GetPropertyByAddress(address)
    -- Query your housing database
    -- Adjust table name and column names to match your script
    local property = MySQL.single.await(
        'SELECT * FROM your_housing_table WHERE label = ? OR name = ?',
        { address, address }
    )

    if property then
        return convertPropertyToMDT(property)
    end

    return nil
end

-- REQUIRED FUNCTION: Get all properties with pagination
function GetAllPropertiesFromHousing(offset, limit)
    offset = offset or 0
    limit = limit or 30

    -- Try using your housing script's export
    local success, allProperties = pcall(function()
        return exports['YourHousingScript']:GetAllProperties()  -- Adjust export name
    end)

    if success and allProperties and type(allProperties) == 'table' then
        -- Convert to array if it's a key-value table
        local propertyArray = convertTableToArray(allProperties)

        -- Sort for consistent ordering (optional)
        table.sort(propertyArray, function(a, b)
            return (a.label or a.name or '') < (b.label or b.name or '')
        end)

        -- Apply pagination
        local results = {}
        local startIdx = offset + 1
        local endIdx = math.min(offset + limit, #propertyArray)

        for i = startIdx, endIdx do
            if propertyArray[i] then
                table.insert(results, convertPropertyToMDT(propertyArray[i]))
            end
        end

        return results
    end

    -- Fallback: Query database directly if export fails
    Debug('Housing adapter: Export failed, using database fallback')

    local properties = MySQL.query.await(
        'SELECT * FROM your_housing_table ORDER BY label LIMIT ? OFFSET ?',
        { limit, offset }
    )

    local results = {}
    for _, property in ipairs(properties or {}) do
        table.insert(results, convertPropertyToMDT(property))
    end

    return results
end

-- REQUIRED FUNCTION: Search properties by query
function SearchPropertiesFromHousing(query)
    query = '%' .. query:upper() .. '%'

    -- Search in your housing database
    -- Adjust table names and columns to match your script
    local properties = MySQL.query.await([[
        SELECT h.*, c.firstname, c.lastname
        FROM your_housing_table h
        LEFT JOIN wsb_mdt_citizens c ON h.owner = c.identifier
        WHERE UPPER(h.label) LIKE ?
           OR UPPER(h.owner) LIKE ?
           OR UPPER(CONCAT(c.firstname, ' ', c.lastname)) LIKE ?
        LIMIT 50
    ]], { query, query, query })

    local results = {}
    for _, property in ipairs(properties or {}) do
        table.insert(results, convertPropertyToMDT(property))
    end

    return results
end

-- REQUIRED FUNCTION: Get properties owned by a specific citizen
function GetPropertiesByOwner(identifier)
    -- Try using your housing script's export if available
    local success, ownedProperties = pcall(function()
        return exports['YourHousingScript']:GetPlayerProperties(identifier)  -- Adjust export name
    end)

    if success and ownedProperties and type(ownedProperties) == 'table' then
        local results = {}

        -- Handle both array and key-value formats
        for _, property in pairs(ownedProperties) do
            table.insert(results, convertPropertyToMDT(property))
        end

        return results
    end

    -- Fallback: Query database directly
    Debug('Housing adapter: Export failed, using database fallback')

    local properties = MySQL.query.await(
        'SELECT * FROM your_housing_table WHERE owner = ?',
        { identifier }
    )

    local results = {}
    for _, property in ipairs(properties or {}) do
        table.insert(results, convertPropertyToMDT(property))
    end

    return results
end

-- REQUIRED FUNCTION: Get total count of properties
function GetPropertiesCountFromHousing()
    -- Try using export to get all properties and count them
    local success, allProperties = pcall(function()
        return exports['YourHousingScript']:GetAllProperties()  -- Adjust export name
    end)

    if success and allProperties and type(allProperties) == 'table' then
        -- Count properties (works for both arrays and key-value tables)
        local count = 0
        for _ in pairs(allProperties) do
            count = count + 1
        end
        return count
    end

    -- Fallback: Query database for count
    local count = MySQL.scalar.await('SELECT COUNT(*) FROM your_housing_table')
    return count or 0
end

-- Log successful loading
Debug('Housing adapter loaded successfully')

--[[
    INTEGRATION CHECKLIST:

    1. Replace "YourHousingScript" with your actual resource name
    2. Update the property type mappings in mapPropertyType()
    3. Adjust field names in convertPropertyToMDT() to match your database schema
    4. Update all SQL queries to use your housing table name and columns
    5. Modify export names to match what your housing script provides
    6. Test with Config.SyncData.housing = 'YourHousingScript' in config.lua

    COMMON ISSUES & SOLUTIONS:

    - Properties not showing: Check if exports return key-value table vs array
    - Wrong property types: Update the typeMap in mapPropertyType()
    - Missing coordinates: Ensure coords are properly parsed and formatted
    - Export not working: Check export names and that housing script is started
]]