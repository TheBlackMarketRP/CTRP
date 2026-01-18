-- Written by UnLuckyLust ( © Dreams Weaver 2023-2025 ) | Download Free only at https://UnLuckyLust.tebex.io
Config = {}
   
Config['Admin'] = { 
   Active = true, --| Enable/disable Permmision check
   Core = 'qb', --| Permmision check method
      -- 'qb' = QBcore checks
      -- 'esx' = ESX Legacy checks
      -- false = Native checks
   Permmision = 'admin' --| Permission level needed to change settings ('god', 'admin', etc.)
}

Config['Commands'] = {
    Active = true, --| Enable/disable all in-game commands
    Server = false, --| Effective only when using native commands
    -- Change the command name to - false - to disable a specific command
    Settings = 'watermark+', --| Command to open setting ui
    Toggle = 'watermark' --| Command to toggle watermark
}

Config['UI'] = {
    CloseUI = true, --| Close setting on submit
    ClickSound = {
       Name = 'click', --| set false to disable
       isLocal = false,
       Volume = 0.5
    }
}

Config['Watermark'] = {
    Active = true, --| Enable/disable watermark
    Position = 'bottom-center', --| top-left / top-center / top-right / center-left / center / center-right / bottom-left / bottom-center / bottom-right
    Animation = 'glow', --| set false to disable animation or use - fade / glow / expand / typing / rgb
    Text = {
        string = 'ChiTrenches RP', --| Text of the watermark
        font = '"Trebuchet MS", sans-serif',
        scale = '20px'
    },
    Image = {
        link = './logo.png', --| .png image link or './logo.png' to use local logo image
        scale = '40px'
    },
    Colors = { --| CSS text colors
        text = 'white',
        light = '#E63946',
        dark = '#922727',
        BG = 'rgba(0, 0, 0, 0)'
    }
}

Config['Debug'] = {
    Active = false,
    Delay_Function = 5 --| default = 5 {seconds}
}

------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------- ██████╗ ██████╗ ██████╗ ███████╗ ----------------------------------------------
---------------------------------------------- ██╔════╝██╔═══██╗██╔══██╗██╔════╝ ---------------------------------------------
---------------------------------------------- ██║     ██║   ██║██████╔╝█████╗ ----------------------------------------------- 
---------------------------------------------- ██║     ██║   ██║██╔══██╗██╔══╝ ----------------------------------------------- 
---------------------------------------------- ╚██████╗╚██████╔╝██║  ██║███████╗ ---------------------------------------------
----------------------------------------------- ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝ ---------------------------------------------
-- It is not recommended to change core export, as some functions will not work properly!
function CoreObject()
    local CoreValue
    if Config['Admin'].Core == 'qb' then
        CoreValue = exports['qb-core']:GetCoreObject()
    elseif Config['Admin'].Core == 'esx' then
        CoreValue = exports['es_extended']:getSharedObject()
    else CoreValue = false
    end
    return CoreValue
end