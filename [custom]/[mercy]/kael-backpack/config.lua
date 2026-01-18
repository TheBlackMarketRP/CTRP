Config = Config or {}

local animations = {
     backpack = {
          dict = 'amb@world_human_hiker_standing@female@base',
          anim = 'base',
          bone = 'Back',
          attaching_position = {
               x = -0.15,
               y = -0.15,
               z = -0.05,
               x_rotation = -5.0,
               y_rotation = 90.0,
               z_rotation = 0.0,
          }
     },
     backpack2 = {
          dict = 'amb@world_human_hiker_standing@female@base',
          anim = 'base',
          bone = 'Back',
          attaching_position = {
               x = 0.07,
               y = -0.15,
               z = -0.05,
               x_rotation = 0.0,
               y_rotation = 90.0,
               z_rotation = 175.0,
          }
     },
     suitcase2 = {
          dict = 'missheistdocksprep1hold_cellphone',
          anim = 'static',
          bone = 'RightHand',
          attaching_position = {
               x = 0.10,
               y = 0.0,
               z = 0.0,
               x_rotation = 0.0,
               y_rotation = 280.0,
               z_rotation = 53.0,
          }
     },
}

local props = {
     backpack = {
          model = 'sf_prop_sf_backpack_01a',
          animation = animations.backpack
     },
     backpack2 = {
          model = 'prop_michael_backpack',
          animation = animations.backpack2
     },
     suitcase = {
          model = 'prop_ld_suitcase_01',
          animation = animations.suitcase2
     },
     suitcase2 = {
          model = 'prop_security_case_01',
          animation = animations.suitcase2
     },
}

Config.Hotbar = {
     1, 2, 3, 4, 5, 41
}

Config.duration = {
     open = 1, 
     close = 1
}


Config.items = {
     ['1backpack1'] = {
          rolelock = false,
          role = "",
          slots = 20,
          size = 250000,
          male = {
               ["bag"] = { item = 16, texture = 0 }
          },
          female = {
               ["bag"] = { item = 16, texture = 0 }
          }
     },
     ['2backpack1'] = {
          rolelock = true,
          role = "1441330742243102810",
          slots = 50,
          size = 500000,
          male = {
               ["bag"] = { item = 10, texture = 0 }
          },
          female = {
               ["bag"] = { item = 10, texture = 0 }
          }
     },
}

Config.Blacklist_items = {
     active = true,
     list = {
          ''
     }
}

Config.whitelist = {
     useperm = {
          active = true,
          jobs = { 'police' },
          citizenid = {
               -- 'ZEH16545', -- Kael
          }
     },

     lockpick = {
          active = true,
          jobs = { 'police' },
          citizenid = {}
     }
}
