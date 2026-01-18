-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

Config.DiscordWebhook = ''
local esx = 'es_extended'
local qbcore = 'qb-core'
ESX, QBCore = nil, nil

local function convertDateToUS(dateStr)
    if not dateStr or dateStr == 'Unknown' or dateStr == '' then
        return 'Unknown'
    end

    -- Try DD/MM/YYYY format
    local day, month, year = dateStr:match("(%d+)/(%d+)/(%d+)")
    if day and month and year then
        return string.format("%02d/%02d/%04d", tonumber(month), tonumber(day), tonumber(year))
    end

    -- Try YYYY-MM-DD format
    local year2, month2, day2 = dateStr:match("(%d+)-(%d+)-(%d+)")
    if year2 and month2 and day2 then
        return string.format("%02d/%02d/%04d", tonumber(month2), tonumber(day2), tonumber(year2))
    end

    -- Try MM-DD-YYYY format
    local month3, day3, year3 = dateStr:match("(%d+)-(%d+)-(%d+)")
    if month3 and day3 and year3 and tonumber(year3) > 1900 then
        return string.format("%02d/%02d/%04d", tonumber(month3), tonumber(day3), tonumber(year3))
    end

    return dateStr
end

--[[
    API KEY (https://refer.fivemanage.com/wasabi)
    DO NOT SHARE THIS WITH ANYONE, EVER!

    REQUIRES: screenshot-basic (https://github.com/citizenfx/screenshot-basic)
--]]
Config.FIVEMANAGE_API_KEY = ''

function IsStaff(src)
    for i = 1, #Config.StaffGroups do
        if wsb.hasPermission(src, Config.StaffGroups[i]) then
            return true
        end
    end

    if IsPlayerAceAllowed(src, 'mdt.staff') then return true end

    return false
end

function IsPhotoServiceAvailable()
    -- Check if API key is configured
    if not Config.FIVEMANAGE_API_KEY or Config.FIVEMANAGE_API_KEY == '' then
        return false, 'FiveManage API key not configured'
    end

    -- Check if screenshot-basic is available
    if not SCREENBASIC then
        return false, 'screenshot-basic resource not started'
    end

    return true, nil
end

function TakeScreenshot(src)
    local success, err = IsPhotoServiceAvailable()
    if not success then
        Error(err)
        return false
    end

    local url = promise.new()

    if Config.FIVEMANAGE_API_KEY then
        local headers = {
            ['User-Agent'] = 'wasabi_mdt',
            ['Authorization'] = Config.FIVEMANAGE_API_KEY
        }

        PerformHttpRequest('https://api.fivemanage.com/api/presigned-url?fileType=image',
            function(statusCode, resultData, resultHeaders, errorData)
                if statusCode ~= 200 then
                    Error('Failed to get presigned URL from Fivemanage')
                    return url:resolve(false)
                end

                resultData = json.decode(resultData)
                if not resultData or not resultData.presignedUrl then
                    Error('Failed to get presigned URL from Fivemanage')
                    return url:resolve(false)
                end

                local res = wsb.awaitClientCallback('wasabi_mdt:takeScreenshot', src, resultData.presignedUrl)

                if res then
                    url:resolve(res)
                else
                    url:resolve(false)
                end
            end, 'GET', nil, headers)
    end

    return Citizen.Await(url)
end

function DeleteImageFromCloud(imageId)
    local success, err = IsPhotoServiceAvailable()
    if not success then
        Error(err)
        return false
    end

    local deleted = promise.new()

    if Config.FIVEMANAGE_API_KEY then
        local headers = {
            ['Authorization'] = Config.FIVEMANAGE_API_KEY,
        }

        PerformHttpRequest('https://fmapi.net/api/image/delete/' .. imageId,
            function(statusCode, resultData, resultHeaders, errorData)
                if statusCode == 200 then
                    deleted:resolve(true)
                else
                    Error('Failed to delete image from FiveManage. Status: ' .. statusCode)
                    if errorData then
                        Error('Error: ' .. tostring(errorData))
                    end
                    deleted:resolve(false)
                end
            end,
            'DELETE',
            '',
            headers
        )
    end

    return Citizen.Await(deleted)
end

function GetPlayersFromDatabase(query)
    local results = {}
    query = query:lower()

    if GetResourceState('es_extended') == "started" then
        local players = MySQL.query.await([[
            SELECT identifier, firstname, lastname, dateofbirth, phone_number, sex, job, job_grade
            FROM users
            WHERE LOWER(CONCAT(firstname, ' ', lastname)) LIKE ?
            LIMIT 10
        ]], { '%' .. query .. '%' })

        if players then
            for _, player in ipairs(players) do
                results[#results + 1] = {
                    identifier = player.identifier,
                    firstname = player.firstname,
                    lastname = player.lastname,
                    dob = convertDateToUS(player.dateofbirth),
                    phone = player.phone_number or 'Unknown',
                    job = player.job,
                    job_grade = player.job_grade or 0,
                    gender = player.sex == 'm' and 'male' or player.sex == 'f' and 'female' or 'other',
                    isRegistered = MDTCitizen.get(player.identifier) ~= nil
                }
            end
        end
    elseif GetResourceState('qb-core') == "started" then
        local players = MySQL.query.await([[
            SELECT citizenid, JSON_EXTRACT(charinfo, '$.firstname') as firstname,
                   JSON_EXTRACT(charinfo, '$.lastname') as lastname,
                   JSON_EXTRACT(charinfo, '$.birthdate') as birthdate,
                   JSON_EXTRACT(charinfo, '$.phone') as phone,
                   JSON_EXTRACT(charinfo, '$.gender') as gender,
                   JSON_EXTRACT(charinfo, '$.job') as job,
                   JSON_EXTRACT(charinfo, '$.job_grade') as job_grade
            FROM players
            WHERE LOWER(CONCAT(JSON_EXTRACT(charinfo, '$.firstname'), ' ', JSON_EXTRACT(charinfo, '$.lastname'))) LIKE ?
            LIMIT 10
        ]], { '%' .. query .. '%' })

        if players then
            for _, player in ipairs(players) do
                local firstname = player.firstname and player.firstname:gsub('"', '') or 'Unknown'
                local lastname = player.lastname and player.lastname:gsub('"', '') or 'Unknown'
                local gender = player.gender and player.gender:gsub('"', '') or 'other'
                local birthdate = player.birthdate and player.birthdate:gsub('"', '') or 'Unknown'

                results[#results + 1] = {
                    identifier = player.citizenid,
                    name = firstname .. ' ' .. lastname,
                    firstname = firstname,
                    lastname = lastname,
                    dob = convertDateToUS(birthdate),
                    phone = player.phone or 'Unknown',
                    gender = gender == '0' and 'male' or gender == '1' and 'female' or 'other',
                    job = player.job_name and player.job_name:gsub('"', '') or nil,
                    job_grade = tonumber(player.job_grade) or 0,
                    isRegistered = MDTCitizen.get(player.citizenid) ~= nil
                }
            end
        end
    end

    return results
end

function GetCitizenFromFramework(identifier)
    if not Config.SyncData or not Config.SyncData.enabled or not Config.SyncData.citizens then
        return nil
    end

    if GetResourceState('es_extended') == "started" then
        local player = MySQL.single.await([[
            SELECT identifier, firstname, lastname, dateofbirth, phone_number, sex, job, job_grade
            FROM users
            WHERE identifier = ?
        ]], { identifier })

        if player then
            return {
                identifier = player.identifier,
                firstname = player.firstname,
                lastname = player.lastname,
                dob = convertDateToUS(player.dateofbirth),
                phone = player.phone_number or 'Unknown',
                job = player.job,
                job_grade = player.job_grade or 0,
                gender = player.sex == 'm' and 'male' or player.sex == 'f' and 'female' or 'other'
            }
        end
    elseif GetResourceState('qb-core') == "started" or GetResourceState('qbx_core') == "started" then
        local player = MySQL.single.await([[
            SELECT citizenid, JSON_EXTRACT(charinfo, '$.firstname') as firstname,
                   JSON_EXTRACT(charinfo, '$.lastname') as lastname,
                   JSON_EXTRACT(charinfo, '$.birthdate') as birthdate,
                   JSON_EXTRACT(charinfo, '$.phone') as phone,
                   JSON_EXTRACT(charinfo, '$.gender') as gender,
                   JSON_EXTRACT(job, '$.name') as job_name,
                   JSON_EXTRACT(job, '$.grade.level') as job_grade
            FROM players
            WHERE citizenid = ?
        ]], { identifier })

        if player then
            local firstname = player.firstname and player.firstname:gsub('"', '') or 'Unknown'
            local lastname = player.lastname and player.lastname:gsub('"', '') or 'Unknown'
            local gender = player.gender and player.gender:gsub('"', '') or 'other'
            local birthdate = player.birthdate and player.birthdate:gsub('"', '') or 'Unknown'

            return {
                identifier = player.citizenid,
                firstname = firstname,
                lastname = lastname,
                dob = convertDateToUS(birthdate),
                phone = player.phone and player.phone:gsub('"', '') or 'Unknown',
                gender = gender == '0' and 'male' or gender == '1' and 'female' or 'other',
                job = player.job_name and player.job_name:gsub('"', '') or nil,
                job_grade = tonumber(player.job_grade) or 0
            }
        end
    end

    return nil
end

function SearchCitizensFromFramework(query)
    if not Config.SyncData or not Config.SyncData.enabled or not Config.SyncData.citizens then
        return {}
    end

    local results = {}
    query = query:lower()

    if GetResourceState('es_extended') == "started" then
        local players = MySQL.query.await([[
            SELECT identifier, firstname, lastname, dateofbirth, phone_number, sex, job, job_grade
            FROM users
            WHERE LOWER(CONCAT(firstname, ' ', lastname)) LIKE ?
               OR LOWER(firstname) LIKE ?
               OR LOWER(lastname) LIKE ?
               OR LOWER(identifier) LIKE ?
               OR LOWER(phone_number) LIKE ?
            LIMIT 50
        ]], { '%' .. query .. '%', '%' .. query .. '%', '%' .. query .. '%', '%' .. query .. '%', '%' .. query .. '%' })

        if players then
            for _, player in ipairs(players) do
                results[#results + 1] = {
                    identifier = player.identifier,
                    firstname = player.firstname,
                    lastname = player.lastname,
                    dob = convertDateToUS(player.dateofbirth),
                    phone = player.phone_number or 'Unknown',
                    job = player.job,
                    job_grade = player.job_grade or 0,
                    gender = player.sex == 'm' and 'male' or player.sex == 'f' and 'female' or 'other'
                }
            end
        end
    elseif GetResourceState('qb-core') == "started" or GetResourceState('qbx_core') == "started" then
        local players = MySQL.query.await([[
        WITH extracted AS (
            SELECT
                citizenid,
                JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.firstname')) AS firstname,
                JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.lastname')) AS lastname,
                JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.birthdate')) AS birthdate,
                JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.phone')) AS phone,
                JSON_EXTRACT(charinfo, '$.gender') AS gender,
                JSON_UNQUOTE(JSON_EXTRACT(job, '$.name')) AS job_name,
                JSON_EXTRACT(job, '$.grade') AS job_grade
            FROM players
        )
        SELECT * FROM extracted
        WHERE LOWER(CONCAT(TRIM(firstname), ' ', TRIM(lastname))) LIKE ?
           OR LOWER(TRIM(firstname)) LIKE ?
           OR LOWER(TRIM(lastname)) LIKE ?
           OR LOWER(citizenid) LIKE ?
           OR LOWER(TRIM(phone)) LIKE ?
        LIMIT 50
        ]], {
            '%' .. query .. '%',
            '%' .. query .. '%',
            '%' .. query .. '%',
            '%' .. query .. '%',
            '%' .. query .. '%'
        })

        if players then
            for _, player in ipairs(players) do
                results[#results + 1] = {
                    identifier = player.citizenid,
                    firstname = player.firstname or 'Unknown',
                    lastname = player.lastname or 'Unknown',
                    dob = convertDateToUS(player.birthdate or 'Unknown'),
                    phone = player.phone or 'Unknown',
                    gender = player.gender == '0' and 'male' or player.gender == '1' and 'female' or 'other',
                    job = player.job_name or 'Unknown',
                    job_grade = tonumber(player.job_grade) or 0
                }
            end
        end
    end

    return results
end

function GetAllCitizensFromFramework(offset, limit)
    if not Config.SyncData or not Config.SyncData.enabled or not Config.SyncData.citizens then
        return {}
    end

    local results = {}
    offset = offset or 0
    limit = limit or 30

    if GetResourceState('es_extended') == "started" then
        local players = MySQL.query.await([[
            SELECT identifier, firstname, lastname, dateofbirth, phone_number, sex, job, job_grade
            FROM users
            ORDER BY firstname, lastname
            LIMIT ? OFFSET ?
        ]], { limit, offset })

        if players then
            for _, player in ipairs(players) do
                results[#results + 1] = {
                    identifier = player.identifier,
                    firstname = player.firstname,
                    lastname = player.lastname,
                    dob = convertDateToUS(player.dateofbirth),
                    phone = player.phone_number or 'Unknown',
                    job = player.job,
                    job_grade = player.job_grade or 0,
                    gender = player.sex == 'm' and 'male' or player.sex == 'f' and 'female' or 'other'
                }
            end
        end
    elseif GetResourceState('qb-core') == "started" or GetResourceState('qbx_core') == "started" then
        local players = MySQL.query.await([[
            SELECT citizenid, JSON_EXTRACT(charinfo, '$.firstname') as firstname,
                   JSON_EXTRACT(charinfo, '$.lastname') as lastname,
                   JSON_EXTRACT(charinfo, '$.birthdate') as birthdate,
                   JSON_EXTRACT(charinfo, '$.phone') as phone,
                   JSON_EXTRACT(charinfo, '$.gender') as gender,
                   JSON_EXTRACT(job, '$.name') as job_name,
                   JSON_EXTRACT(job, '$.grade.level') as job_grade
            FROM players
            ORDER BY JSON_EXTRACT(charinfo, '$.firstname'), JSON_EXTRACT(charinfo, '$.lastname')
            LIMIT ? OFFSET ?
        ]], { limit, offset })

        if players then
            for _, player in ipairs(players) do
                local firstname = player.firstname and player.firstname:gsub('"', '') or 'Unknown'
                local lastname = player.lastname and player.lastname:gsub('"', '') or 'Unknown'
                local gender = player.gender and player.gender:gsub('"', '') or 'other'
                local birthdate = player.birthdate and player.birthdate:gsub('"', '') or 'Unknown'

                results[#results + 1] = {
                    identifier = player.citizenid,
                    firstname = firstname,
                    lastname = lastname,
                    dob = convertDateToUS(birthdate),
                    phone = player.phone and player.phone:gsub('"', '') or 'Unknown',
                    gender = gender == '0' and 'male' or gender == '1' and 'female' or 'other',
                    job = player.job_name and player.job_name:gsub('"', '') or nil,
                    job_grade = tonumber(player.job_grade) or 0
                }
            end
        end
    end

    return results
end

function GetVehicleFromFramework(plate)
    if not Config.SyncData or not Config.SyncData.enabled or not Config.SyncData.vehicles then
        return nil
    end

    local normalizedPlate = plate:gsub("%s+", ""):upper()

    if GetResourceState('es_extended') == "started" then
        local vehicle = MySQL.single.await([[
            SELECT plate, vehicle, owner
            FROM owned_vehicles
            WHERE UPPER(REPLACE(plate, ' ', '')) = ?
        ]], { normalizedPlate })

        if vehicle then
            local vehicleData = json.decode(vehicle.vehicle)
            local modelHash = vehicleData and vehicleData.model

            return {
                plate = vehicle.plate,
                model = modelHash or 'Unknown',
                owner_id = vehicle.owner,
                vehicle_type = 'car' -- Default, can be enhanced
            }
        end
    elseif GetResourceState('qb-core') == "started" or GetResourceState('qbx_core') == "started" then
        local vehicle = MySQL.single.await([[
            SELECT plate, vehicle, mods, citizenid
            FROM player_vehicles
            WHERE UPPER(REPLACE(plate, ' ', '')) = ?
        ]], { normalizedPlate })

        if vehicle then
            local vehicleData = vehicle.mods and json.decode(vehicle.mods) or {}
            local modelName = vehicle.vehicle

            return {
                plate = vehicle.plate,
                model = modelName or vehicleData.model or 'Unknown',
                owner_id = vehicle.citizenid,
                vehicle_type = 'car' -- Default, can be enhanced
            }
        end
    end

    return nil
end

function SearchVehiclesFromFramework(query, modelHash)
    if not Config.SyncData or not Config.SyncData.enabled or not Config.SyncData.vehicles then
        return {}
    end

    local results = {}
    local resultMap = {}
    local normalizedQuery = query:gsub("%s+", ""):upper()
    local lowerQuery = query:lower()

    if GetResourceState('es_extended') == "started" then
        local plateVehicles = MySQL.query.await([[
            SELECT plate, vehicle, owner
            FROM owned_vehicles
            WHERE UPPER(REPLACE(plate, ' ', '')) LIKE ?
            LIMIT 50
        ]], { '%' .. normalizedQuery .. '%' })

        local ownerVehicles = {}
        local matchingUsers = MySQL.query.await([[
            SELECT identifier FROM users
            WHERE firstname LIKE ? OR lastname LIKE ?
            LIMIT 50
        ]], { '%' .. lowerQuery .. '%', '%' .. lowerQuery .. '%' })

        if matchingUsers and #matchingUsers > 0 then
            for _, user in ipairs(matchingUsers) do
                local userVehicles = MySQL.query.await([[
                    SELECT plate, vehicle, owner FROM owned_vehicles
                    WHERE owner = ? LIMIT 10
                ]], { user.identifier })

                if userVehicles then
                    for _, v in ipairs(userVehicles) do
                        table.insert(ownerVehicles, v)
                        if #ownerVehicles >= 50 then break end
                    end
                end
                if #ownerVehicles >= 50 then break end
            end
        end

        local modelVehicles = {}
        if modelHash then
            local vehicles = MySQL.query.await([[
                SELECT plate, vehicle, owner FROM owned_vehicles
                WHERE JSON_EXTRACT(vehicle, '$.model') = ?
                LIMIT 50
            ]], { modelHash })

            if vehicles then
                modelVehicles = vehicles
            end
        end

        -- Process plate results
        if plateVehicles then
            for _, vehicle in ipairs(plateVehicles) do
                local vehicleData = json.decode(vehicle.vehicle)
                local modelHash = vehicleData and vehicleData.model

                if not resultMap[vehicle.plate] then
                    resultMap[vehicle.plate] = {
                        plate = vehicle.plate,
                        model = modelHash or 'Unknown',
                        owner_id = vehicle.owner,
                        vehicle_type = 'car'
                    }
                end
            end
        end

        -- Process owner results
        if ownerVehicles then
            for _, vehicle in ipairs(ownerVehicles) do
                if not resultMap[vehicle.plate] then
                    local vehicleData = json.decode(vehicle.vehicle)
                    local modelHash = vehicleData and vehicleData.model

                    resultMap[vehicle.plate] = {
                        plate = vehicle.plate,
                        model = modelHash or 'Unknown',
                        owner_id = vehicle.owner,
                        vehicle_type = 'car'
                    }
                end
            end
        end

        -- Process model results
        if modelVehicles then
            for _, vehicle in ipairs(modelVehicles) do
                if not resultMap[vehicle.plate] then
                    local vehicleData = json.decode(vehicle.vehicle)
                    local modelHash = vehicleData and vehicleData.model

                    resultMap[vehicle.plate] = {
                        plate = vehicle.plate,
                        model = modelHash or 'Unknown',
                        owner_id = vehicle.owner,
                        vehicle_type = 'car'
                    }
                end
            end
        end

        -- Convert map to array
        for _, vehicle in pairs(resultMap) do
            table.insert(results, vehicle)
            if #results >= 50 then break end
        end

    elseif GetResourceState('qb-core') == "started" or GetResourceState('qbx_core') == "started" then
        -- Query 1: Search by plate
        local plateVehicles = MySQL.query.await([[
            SELECT plate, vehicle, mods, citizenid
            FROM player_vehicles
            WHERE UPPER(REPLACE(plate, ' ', '')) LIKE ?
            LIMIT 50
        ]], { '%' .. normalizedQuery .. '%' })

        -- Query 2: Search by vehicle model
        local modelVehicles = MySQL.query.await([[
            SELECT plate, vehicle, mods, citizenid
            FROM player_vehicles
            WHERE UPPER(vehicle) LIKE ?
            LIMIT 50
        ]], { '%' .. normalizedQuery .. '%' })

        local ownerVehicles = {}
        local matchingPlayers = MySQL.query.await([[
            SELECT citizenid FROM players
            WHERE JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.firstname')) LIKE ?
               OR JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.lastname')) LIKE ?
            LIMIT 50
        ]], { '%' .. lowerQuery .. '%', '%' .. lowerQuery .. '%' })

        if matchingPlayers and #matchingPlayers > 0 then
            for _, player in ipairs(matchingPlayers) do
                local playerVehicles = MySQL.query.await([[
                    SELECT plate, vehicle, mods, citizenid FROM player_vehicles
                    WHERE citizenid = ? LIMIT 10
                ]], { player.citizenid })

                if playerVehicles then
                    for _, v in ipairs(playerVehicles) do
                        table.insert(ownerVehicles, v)
                        if #ownerVehicles >= 50 then break end
                    end
                end
                if #ownerVehicles >= 50 then break end
            end
        end

        -- Process plate results
        if plateVehicles then
            for _, vehicle in ipairs(plateVehicles) do
                local vehicleData = vehicle.mods and json.decode(vehicle.mods) or {}
                local modelName = vehicle.vehicle

                if not resultMap[vehicle.plate] then
                    resultMap[vehicle.plate] = {
                        plate = vehicle.plate,
                        model = modelName or vehicleData.model or 'Unknown',
                        owner_id = vehicle.citizenid,
                        vehicle_type = 'car'
                    }
                end
            end
        end

        -- Process model results
        if modelVehicles then
            for _, vehicle in ipairs(modelVehicles) do
                if not resultMap[vehicle.plate] then
                    local vehicleData = vehicle.mods and json.decode(vehicle.mods) or {}
                    local modelName = vehicle.vehicle

                    resultMap[vehicle.plate] = {
                        plate = vehicle.plate,
                        model = modelName or vehicleData.model or 'Unknown',
                        owner_id = vehicle.citizenid,
                        vehicle_type = 'car'
                    }
                end
            end
        end

        -- Process owner results
        if ownerVehicles then
            for _, vehicle in ipairs(ownerVehicles) do
                if not resultMap[vehicle.plate] then
                    local vehicleData = vehicle.mods and json.decode(vehicle.mods) or {}
                    local modelName = vehicle.vehicle

                    resultMap[vehicle.plate] = {
                        plate = vehicle.plate,
                        model = modelName or vehicleData.model or 'Unknown',
                        owner_id = vehicle.citizenid,
                        vehicle_type = 'car'
                    }
                end
            end
        end

        -- Convert map to array
        for _, vehicle in pairs(resultMap) do
            table.insert(results, vehicle)
            if #results >= 50 then break end
        end
    end

    return results
end

function GetAllVehiclesFromFramework(offset, limit, identifier)
    if not Config.SyncData or not Config.SyncData.enabled or not Config.SyncData.vehicles then
        return {}
    end

    local results = {}
    offset = offset or 0
    limit = limit or 30

    if GetResourceState('es_extended') == "started" then
        local vehicles = identifier and MySQL.query.await([[
            SELECT plate, vehicle, owner
            FROM owned_vehicles
            WHERE owner = ?
            ORDER BY plate
            LIMIT ? OFFSET ?
        ]], { identifier, limit, offset })
        or MySQL.query.await([[
            SELECT plate, vehicle, owner
            FROM owned_vehicles
            ORDER BY plate
            LIMIT ? OFFSET ?
        ]], { limit, offset })

        if vehicles then
            for _, vehicle in ipairs(vehicles) do
                local vehicleData = json.decode(vehicle.vehicle)
                local modelHash = vehicleData and vehicleData.model

                results[#results + 1] = {
                    plate = vehicle.plate,
                    model = modelHash or 'Unknown',
                    owner_id = vehicle.owner,
                    vehicle_type = 'car'
                }
            end
        end
    elseif GetResourceState('qb-core') == "started" or GetResourceState('qbx_core') == "started" then
        local vehicles = identifier and MySQL.query.await([[
            SELECT plate, vehicle, mods, citizenid
            FROM player_vehicles
            WHERE citizenid = ?
            ORDER BY plate
            LIMIT ? OFFSET ?
        ]], { identifier, limit, offset })
        or MySQL.query.await([[
            SELECT plate, vehicle, mods, citizenid
            FROM player_vehicles
            ORDER BY plate
            LIMIT ? OFFSET ?
        ]], { limit, offset })

        if vehicles then
            for _, vehicle in ipairs(vehicles) do
                local vehicleData = vehicle.mods and json.decode(vehicle.mods) or {}
                local modelName = vehicle.vehicle

                results[#results + 1] = {
                    plate = vehicle.plate,
                    model = modelName or vehicleData.model or 'Unknown',
                    owner_id = vehicle.citizenid,
                    vehicle_type = 'car'
                }
            end
        end
    end

    return results
end

function GetVehiclesFromDatabase(query)
    local results = {}
    local normalizedQuery = query:gsub("%s+", ""):upper()

    if GetResourceState('es_extended') == "started" then
        local vehicles = MySQL.query.await([[
            SELECT plate, vehicle, owner
            FROM owned_vehicles
            WHERE UPPER(REPLACE(plate, ' ', '')) LIKE ?
            LIMIT 10
        ]], { '%' .. normalizedQuery .. '%' })

        if vehicles then
            for _, vehicle in ipairs(vehicles) do
                local vehicleData = json.decode(vehicle.vehicle)
                local modelHash = vehicleData and vehicleData.model

                results[#results + 1] = {
                    plate = vehicle.plate, -- Keep original plate format
                    model = modelHash or 'Unknown',
                    owner = vehicle.owner,
                    isRegistered = MDTVehicle.getByPlate(vehicle.plate) ~= nil
                }
            end
        end
    elseif GetResourceState('qb-core') == "started" then
        local vehicles = MySQL.query.await([[
            SELECT plate, vehicle, mods, citizenid
            FROM player_vehicles
            WHERE UPPER(REPLACE(plate, ' ', '')) LIKE ?
            LIMIT 10
        ]], { '%' .. normalizedQuery .. '%' })

        if vehicles then
            for _, vehicle in ipairs(vehicles) do
                local vehicleData = vehicle.mods and json.decode(vehicle.mods) or {}
                local modelName = vehicle.vehicle

                results[#results + 1] = {
                    plate = vehicle.plate, -- Keep original plate format
                    model = modelName or vehicleData.model or 'Unknown',
                    owner = vehicle.citizenid,
                    isRegistered = MDTVehicle.getByPlate(vehicle.plate) ~= nil
                }
            end
        end
    end

    return results
end

function GetJobsAndGrades()
    local jobs = {}

    -- For ESX
    if GetResourceState('es_extended') == "started" then
        if not ESX then
            ESX = exports['es_extended']:getSharedObject()
        end

        for jobName, jobData in pairs(ESX.GetJobs()) do
            if not table.contains(Config.IgnoredJobs, jobName) then
                local grades = {}
                for gradeNum, gradeData in pairs(jobData.grades) do
                    table.insert(grades, {
                        label = gradeData.label,
                        value = tonumber(gradeNum)
                    })
                end
                -- Sort grades by value
                table.sort(grades, function(a, b) return a.value < b.value end)

                jobs[jobName] = {
                    label = jobData.label,
                    name = jobName,
                    grades = grades
                }
            end
        end
        -- For QBCore
    elseif GetResourceState('qb-core') == "started" then
        if not QBCore then
            QBCore = exports['qb-core']:GetCoreObject()
        end
        for jobName, jobData in pairs(QBCore.Shared.Jobs) do
            if not table.contains(Config.IgnoredJobs, jobName) then
                local grades = {}
                for gradeNum, gradeData in pairs(jobData.grades) do
                    table.insert(grades, {
                        label = gradeData.name,
                        value = tonumber(gradeNum)
                    })
                end
                -- Sort grades by value
                table.sort(grades, function(a, b) return a.value < b.value end)

                jobs[jobName] = {
                    label = jobData.label,
                    name = jobName,
                    grades = grades
                }
            end
        end
    end

    Debug('server/opensource.lua:GetJobsAndGrades: %s', json.encode(jobs, { indent = true }))

    return jobs
end

function GetJobLabel(jobName)
    if not jobName then return nil end

    if GetResourceState('es_extended') == "started" then
        if not ESX then
            ESX = exports['es_extended']:getSharedObject()
        end

        local job = ESX.GetJobs()[jobName]
        return job and job.label or jobName
    elseif GetResourceState('qb-core') == "started" then
        if not QBCore then
            QBCore = exports['qb-core']:GetCoreObject()
        end

        local job = QBCore.Shared.Jobs[jobName]
        return job and job.label or jobName
    end

    return jobName
end

function GetJobGradeLabel(jobName, gradeNumber)
    if not jobName or not gradeNumber then return nil end

    -- For ESX
    if GetResourceState('es_extended') == "started" then
        if not ESX then
            ESX = exports['es_extended']:getSharedObject()
        end

        local job = ESX.GetJobs()[jobName]
        if job and job.grades and job.grades[tostring(gradeNumber)] then
            return job.grades[tostring(gradeNumber)].label
        end

        -- For QBCore
    elseif GetResourceState('qb-core') == "started" then
        if not QBCore then
            QBCore = exports['qb-core']:GetCoreObject()
        end

        local job = QBCore.Shared.Jobs[jobName]
        if job and job.grades and job.grades[tostring(gradeNumber)] then
            return job.grades[tostring(gradeNumber)].name
        end
    end

    return "Grade " .. tostring(gradeNumber)
end

--[[
    CUSTOMIZABLE EVENTS FOR CHARGE LINKING/UNLINKING (SERVER-SIDE)

    These events are called when police officers link charges to players.
    You can customize these events to integrate with your billing and jail systems.

    Parameters:
    - chargeData: Table containing charge information (id, title, description, jail_time, fine, category, etc.)
    - primaryIdentifier: The primary identifier of the citizen
    - incidentData: Table containing incident information (id, title, description, etc.)
    - officerData: Table containing officer information (identifier, name, etc.)
    - adjustments: Table containing any charge adjustments (adjusted_fine, adjusted_jail, etc.)
]]

-- On charge linked
AddEventHandler('wasabi_mdt:onChargeLinked', function(chargeData, primaryIdentifier, incidentData, officerData, adjustments)
    Debug('wasabi_mdt:onChargeLinked: %s - %s - %s - %s - %s', chargeData.title, primaryIdentifier, incidentData.id, officerData.identifier, adjustments)

    -- Is there a fine?
    if chargeData.fine and chargeData.fine > 0 then
        -- Example implementation:
        -- exports['your_billing_script']:addBill(primaryIdentifier, chargeData.fine, 'MDT Charge: ' .. chargeData.title)

        -- Log the charge for debugging
        Debug('Charge linked to citizen: %s - %s ($%d)', primaryIdentifier, chargeData.title, chargeData.fine)
    end

    -- Is there jail time?
    if chargeData.jail_time and chargeData.jail_time > 0 then
        -- Example implementation:
        -- local jailTime = adjustments and adjustments.adjusted_jail or chargeData.jail_time
        -- exports['your_jail_script']:sendToJail(primaryIdentifier, jailTime, 'MDT Charge: ' .. chargeData.title)

        -- Log the jail charge for debugging
        local jailTime = adjustments and adjustments.adjusted_jail or chargeData.jail_time
        Debug('Jail charge linked to citizen: %s - %s (%d minutes)',
            primaryIdentifier, chargeData.title, jailTime)
    end

    -- Is there a felony?
    if chargeData.category == 'felony' then
        -- Example implementation:
        -- exports['your_script']:addFelonyRecord(primaryIdentifier, chargeData.title)
        -- exports['your_script']:notifyAuthorities(primaryIdentifier, 'Felony charge added')

        -- Log the felony charge for debugging
        Debug('Felony charge linked to citizen: %s - %s', primaryIdentifier, chargeData.title)
    end
end)

AddEventHandler('wasabi_mdt:onChargeUnlinked', function(chargeData, primaryIdentifier, incidentData, officerData)
    -- Example implementation:
    -- exports['your_billing_script']:refundBill(primaryIdentifier, chargeData.fine, 'MDT Charge Removed: ' .. chargeData.title)

    -- Log the charge unlinking for debugging
    Debug('Charge unlinked from citizen: %s - %s', primaryIdentifier, chargeData.title)
end)

--[[
    END OF CUSTOMIZABLE EVENTS FOR CHARGE LINKING/UNLINKING (SERVER-SIDE)
]]
