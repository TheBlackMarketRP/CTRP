Config = {}

Config.useOTSkills = false -- requires our skills system, you can find here: https://forum.cfx.re/t/paid-ot-skills/4917372
Config.xpreward = 5

Config.requireditem = 'money'
Config.requireditemamount = 250000
Config.repairtime = 5000
Config.repairItem = 'weaponrrawepairkit'

Config.require = {
    -- ['WEAPON_COMBATPDW'] = {
    --     requireditem = 'money',
    --     requireditemamount = 2000,
    --     repairtime = 10000
    -- },
}

Config.locations = {
    {
        coords = vector3(20.02, -1110.33, 29.86),
        heading = 163.65,
        spawnprop = false, -- spawns the workbench at the location 
        free = false -- allows weapons to be repaired for free at the location
    }
}