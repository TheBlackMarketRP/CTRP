Config = {
    EnablePreview = true, -- Displays your character on the screen
    SetScaleCommand = 'setscale', -- Command to set scale
    ResetScaleCommand = 'resetscale', -- Command to reset scale
    ScaleMenuCommand = 'scalemenu', -- Command to open scale menu
    Permissions = {
        Enable = true, -- When false, the menu is accessible to all players.
        Groups = {"admin", "staff", "god"}, -- QB/QBOX/ESX Command Permissions
        Customs = {"license:xxx", "citizenid", "discord:xxx"}, -- Custom permissions
        DiscordRoles = {"1441330742243102810"} -- Discord Role IDs
    },
    DefaultScale = 1.0, -- Replacement is not recommended.
    MinScale = 0.5, -- Replacement is not recommended.
    MaxScale = 1.2, -- Replacement is not recommended.
    DisableRagdoll = false, -- If true your ragdoll script does not work.
    ScenarioPeds = true, -- NPCs react based on your character size.
    GiveScaleMenu = {
        Enable = true, -- If true, you can open the menu by entering the player ID with the command.
        Command = "givescalemenu", -- Open menu command
        Description = "Opens scale menu to player", -- Open menu command description
        Group = "admin" -- Open menu command permission
    },
    HideWhen = {
        MaxDistance = 20.0, -- Scale is applied to players who are close to this distance.
        Invisible = false, -- If the character is not visible, scale is deactivated.
        CollisionDisabled = false, -- If the character's collision is disabled, scale is deactivated.
        Falling = false, -- When the character is falling, scale is deactivated.
        Ragdoll = false, -- When the character is ragdolled, scale is deactivated.
        Climbing = false, -- When the character is climbing, scale is deactivated.
        Jumping = false, -- If the character is jumping, scale is deactivated.
        Swimming = false, -- If the character is swimming, scale is deactivated.
        Attached = false, -- If the character is attached to a entity or a player, scale is deactivated.
        OnVehicle = false, -- If the character is on a vehicle, scale is deactivated.
        Alpha = false, -- If the alpha value is not 255,
        AnyCamActive = false -- If any cam is active
    },
    UpdatePedAccordingToScale = {
        RunSprintMultiplier = false -- Your character's breath depletion rate will vary depending on the size..
    },
    GarageDoorModels = {
        GetHashKey("prop_com_gar_door_01"),
        GetHashKey("prop_com_gar_door_02"),
        GetHashKey("prop_sc1_21_g_door_01"),
        GetHashKey("prop_sm1_11_doorl"),
        GetHashKey("prop_sm1_11_doorr"),
        GetHashKey("prop_lrggate_01c_l"),
        GetHashKey("prop_lrggate_01c_r"),
        GetHashKey("prop_lrggate_02"),
        GetHashKey("prop_lrggate_05a"),
        GetHashKey("prop_lrggate_06a"),
        GetHashKey("prop_facgate_01"),
        GetHashKey("prop_facgate_02_l"),
        GetHashKey("prop_facgate_02_r"),
        GetHashKey("prop_facgate_03_l"),
        GetHashKey("prop_facgate_03_r"),
        GetHashKey("prop_facgate_07"),
        GetHashKey("prop_gate_airport_01"),
        GetHashKey("prop_gate_airport_02"),
        GetHashKey("prop_gate_docks_ld"),
        GetHashKey("prop_gate_docks02_l"),
        GetHashKey("prop_gate_docks02_r"),
        GetHashKey("prop_gate_military_01"),
        GetHashKey("prop_gate_military_02"),
        GetHashKey("prop_gate_prison_01"),
        GetHashKey("prop_gate_prison_01_l"),
        GetHashKey("prop_gate_prison_01_r"),
        GetHashKey("prop_gate_cult_01_l"),
        GetHashKey("prop_gate_cult_01_r"),
        GetHashKey("prop_gate_farm_01a")
    }
}