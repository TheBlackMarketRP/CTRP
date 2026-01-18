Config = {}

-- If debug mode is enabled, you can use /pepperspray_effect <playerId> to test out the pepper-spray effect
Config.Debug = false

-- The hash of the pepper-spray weapon
Config.PepperSprayWeaponHash = `weapon_pepperspray`

-- The keybind which on which the script will detect if the player is spraying, (24	= INPUT_ATTACK = LEFT MOUSE BUTTON)
Config.SprayDetectionKey = 24

-- These keys are disabled if the player is sprayed
Config.DisabledKeysWhenSprayed = { 24, 25, 22, 37, 73 } -- Attack, aim, jump, weapon wheel, X (see https://docs.fivem.net/docs/game-references/controls/ if you want to change these)

-- Configure the animation when someone is sprayed
Config.Animation = {
    Dict = 'switch@trevor@floyd_crying',
    Name = 'console_end_loop_floyd',
}

-- The time in milliseconds the spray-effect will last
Config.SprayEffectTimer = 10000

-- The main and extra timecycle modifier when someone is sprayed
Config.MainTimeCycle = 'drunk'
Config.ExtraTimeCycle = 'rply_vignette'

-- The maximum distance at which someone can get sprayed
Config.MaxmimumSprayDistance = 5.0

-- The maximum angle at which someone can get sprayed w.r.t. the players back, this ensure you cannot spray someone if you are not facing them, setting to zero allows you to also spray people from behind
Config.MaxmimumSprayAngle = 80

 -- If set to true, only players with the configured JobNames can apply the spray-effect
Config.JobRequirement = {
    Enabled = false,
    JobNames = {'police', 'ambulance'}
}

-- If you use the skinchanger script, you can add clothes below which make you immune to pepper-spray
-- If you dont the skinchanger script, you will have to edit the function Functions.DoesPedHaveImmuneClothes() in the bridge script before you can use this feature
Config.ImmuneClothes = {
    ['male'] = {
        ['helmet_1'] = { 18, 50, 51, 52, 53 },
        ['glasses_1'] = { 26 },
        ['mask_1'] = { 9, 10 },
    },
    ['female'] = {
        ['helmet_1'] = { 18, 50, 51, 52, 53 },
        ['glasses_1'] = { 26 },
        ['mask_1'] = { 9, 10 },
    }
}
