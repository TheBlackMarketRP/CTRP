-- The exact job name required to receive calls.
Config.NpcJobCommand = 'mecnpcjob'

-- Cooldown in seconds after completing a job before a new call can be received.
Config.Cooldown = 300 -- (5 minutes)

-- Time limit in seconds to complete the job once accepted.
Config.MissionTimer = 900 -- (15 minutes)

-- Key to press to deliver the vehicle at the tow destination
Config.CompleteKey = 38 -- E Key

--[[ Payout Settings ]]--
-- The base payment for completing a repair job.
Config.RepairBasePay = 2000
-- Extra payment for repair jobs per meter of distance.
Config.RepairDistanceMultiplier = 0.50
-- Extra payment for repair jobs based on the extent of the vehicle's damage.
Config.RepairDamageMultiplier = 0.08

-- The base payment for completing a tow job.
Config.TowBasePay = 2000
-- Extra payment for tow jobs per meter of distance (pickup to destination).
Config.TowDistanceMultiplier = 0.65


-- A list of possible vehicle models to spawn for the NPC.
Config.Vehicles = {
    'asea', 'stratum', 'ingot', 'primo', 'regina', 'emperor',
    'stanier', 'washington', 'fugitive', 'seminole', 'landstalker'
}

-- A list of possible ped models for the NPC customer.
Config.Peds = {
    'a_m_y_acult_01', 'a_f_y_bevhills_01', 'a_m_m_eastsa_01', 'a_f_y_business_02',
    'a_f_y_eastsa_02', 'a_m_y_skater_01', 'a_m_y_runner_01'
}

-- A list of scenarios for the NPC to perform while waiting for the mechanic.
-- Find more here: https://wiki.gtanet.work/index.php?title=Scenario_Names
Config.Scenarios = {
    'WORLD_HUMAN_SMOKING',
    'WORLD_HUMAN_HANG_OUT_STREET',
    'WORLD_HUMAN_STAND_MOBILE',
    'WORLD_HUMAN_BUM_FREEWAY',
    'WORLD_HUMAN_COP_IDLES',
}

-- Add as many random job locations as you want using vector4 format.
Config.Locations = {
    vector4(-139.28, -1036.01, 26.85, 192.91),
    vector4(14.29, -1344.81, 28.86, 186.4),
    vector4(305.42, -904.54, 29.29, 68.5),
    vector4(-817.07, -238.05, 37.21, 257.63),
    vector4(-1530.89, -441.11, 35.44, 273.01),
    vector4(1191.84, -408.67, 67.72, 346.19),
    vector4(434.76, 222.81, 103.17, 53.8),
    vector4(1131.46, 2648.26, 38.0, 0.33),
    vector4(1971.18, 3832.24, 32.01, 325.95),
    vector4(2675.2, 4297.68, 44.87, 269.28),
    vector4(-60.92, 4403.83, 56.32, 15.46),
    vector4(-813.98, 1854.34, 164.99, 269.92),
    vector4(-743.31, 5234.41, 97.4, 166.32),
    vector4(1969.97, 5163.69, 47.61, 104.58),
    vector4(-263.94, 6485.79, 11.66, 138.47),
    vector4(3145.44, 5333.17, 29.22, 164.1),
    vector4(187.9, 2094.67, 122.78, 115.12),
}

-- Add as many tow destination locations as you want.
Config.TowDestinations = {
    vector3(485.61, -1546.34, 29.14),
    vector3(-209.4, -1304.09, 31.28),
    vector3(715.91, -1088.51, 22.36),
    vector3(1181.01, 2652.06, 37.81),
    vector3(119.6, 6617.6, 31.84),
    vector3(-375.74, -131.45, 38.69),
    vector3(1696.44, 3280.32, 41.11),
    vector3(1781.83, 3328.16, 41.26),
}
