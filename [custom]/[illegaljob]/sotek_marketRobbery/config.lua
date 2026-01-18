Sup = {}
-- esx/esx1.9/qbcore/standalone/vrp/vrpex
Sup.Framework = "qbcore"

Sup.PedDistanceToAim = 3.0

Sup.Language = {
    ["accept"] = "You took the call",
    ["ignore"] = "You have ignored the call",
    ["reject"] = "You refused the call",
    ["takeCall"] = "Press ~g~Y~s~ to take the call\nPress ~r~N~s~ to ignore it",
    ["received"] = "You received ~r~",
    ["money"] = "$",
    ["collect"] = "Press ~INPUT_CONTEXT~ to collect"

}



--gtav or custom
Sup.Notification = "gtav"

Sup.PoliceJob = "police"

Sup.Policenotify = true

Sup.PoliceMessage = "A robbery is in progress"

Sup.WebHook = {
    ["start"] = {
        Link = "https://discord.com/api/webhooks/1450492322008793168/zJGKDAVOqSpJT3dcSVo2gB79xA-0NciP6L36WazFEFzAQp2FrJwHMSW2gzpZyybp0zN_",
        Color = 65280,
        Title = "Fleeca Bank",
        Description = "A robbery has just started",
        Footer = "Fleeca Bank"
    },
    ["done"] = {
        Link = "https://discord.com/api/webhooks/1450492322008793168/zJGKDAVOqSpJT3dcSVo2gB79xA-0NciP6L36WazFEFzAQp2FrJwHMSW2gzpZyybp0zN_",
        Color = 16711680,
        Title = "Fleeca Bank",
        Description = "A robbery has just ended",
        Footer = "Fleeca Bank"
    }
}

Sup.PoliceNeeded = 0 --number of cops needed

Sup.MoneyUse = true --if you want to add money
--money or black_money
Sup.MoneyType = "markedbills"

Sup.ResetTime = 30 --30 min

Sup.TakeMoneyTime = 10 --the time it takes for the player to get the money back into the cashier
--HEADING - 0.12
Sup.Main = {
    {
        location = "LTD BALLAS",
        ped      = { model = "mp_m_shopkeep_01", pos = vector4(-46.4817237854, -1758.2537841797, 28.420993804932, 44.300457000732) },
        props    = { hash = 303280717, pos = vector4(-47.198711395264, -1757.6700439453, 29.418087585449, 49.986469268799) },
        bag      = "prop_poly_bag_01",
        reward   = math.random(10000, 25000),
        scene    = {
            pos = vector3(-46.611743927002, -1758.0964355469, 29.420993804932),
            rot = vector3(0, 0, 57.75104),
            reward = math.random(333, 666),
            cam = {
                pos = vector3(-48.902393341064, -1756.1278076172, 29.887559890747),
                lookAt = vector3(-46.055656433105, -1758.5418701172, 29.869485855103),
                fov = 50.0
            }
        },
        started  = false,
        done     = false
    },
    {
        location = "LTD Little Seoul",
        ped      = { model = "mp_m_shopkeep_01", pos = vector4(-706.15386962891, -912.82025146484, 19.215599060059, 94.445678710938) },
        props    = { hash = 303280717, pos = vector4(-706.63818359375, -913.68865966797, 19.209681396484, 90.0) },
        bag      = "prop_poly_bag_01",
        reward   = math.random(10000, 25000),
        scene    = {
            pos = vector3(-706.03399658203, -913.67950439453, 19.095599060059),
            rot = vector3(0.0, -0.0, 91.255104064941),
            reward = math.random(333, 666),
            cam = {
                pos = vector3(-709.48516845703, -913.79931640625, 19.660673141479),
                lookAt = vector3(-704.91247558594, -913.59368896484, 19.484760284424),
                fov = 50.0
            }
        },
        started  = false,
        done     = false
    },
    {
        location = "LTD Mirror Park",
        ped      = { model = "mp_m_shopkeep_01", pos = vector4(1164.8116455078, -321.97012329102, 69.20516204834, 95.561973571777) },
        props    = {hash = 303280717, pos = vector4(1164.2060546875, -322.89016723633, 69.199183349609, 100.00002288818)},
        bag      = "prop_poly_bag_01",
        reward   = math.random(10000, 25000),
        scene    = {
            pos = vector3(1164.74609375, -322.78952026367, 69.205200195313),
            rot = vector3(0.0, 0.0, 95.373039245605),
            reward = math.random(333, 666),
            cam = {
                pos = vector3(1161.5639648438, -323.5002746582, 69.763954162598),
                lookAt = vector3(1164.9168701172, -322.75479125977, 69.54035949707),
                fov = 50.0
            }
        },
        started  = false,
        done     = false
    },
    {
        location = "LTD Richman Glen",
        ped      = { model = "mp_m_shopkeep_01", pos = vector4(-1820.4925537109, 795.12432861328, 138.08587646484, 124.00169372559) },
        props    = {hash = 303280717, pos = vector4(-1820.4653320313, 793.81658935547, 138.09279907227, 132.46545410156)},
        bag      = "prop_poly_bag_01",
        reward   = math.random(10000, 25000),
        scene    = {
            pos = vector3(-1820.1335449219, 794.14953613281, 138.0887298584),
            rot = vector3(0.0, -0.0, 140.65034484863),
            reward = math.random(333, 666),
            cam = {
                pos = vector3(-1822.4481201172, 792.03521728516, 138.62539672852),
                lookAt = vector3(-1819.8708496094, 794.36395263672, 138.46649169922),
                fov = 50.0
            }
        },
        started  = false,
        done     = false
    },
    {
        location = "LTD Grapeseed",
        ped      = { model = "mp_m_shopkeep_01", pos = vector4(1698.6086425781, 4922.2294921875, 42.063655853271, 330.08004760742) },
        props    = {hash = 303280717, pos = vector4(1698.3065185547, 4923.3706054688, 42.057738189697, 324.99993896484)},
        bag      = "prop_poly_bag_01",
        reward   = math.random(10000, 25000),
        scene    = {
            pos = vector3(1698.0012207031, 4922.9453125, 42.063655853271),
            rot = vector3(-0.0, -0.0, -38.446403503418),
            reward = math.random(333, 666),
            cam = {
                pos = vector3(1699.7822265625, 4925.6357421875, 42.480339050293),
                lookAt = vector3(1698.0262451172, 4923.0708007813, 42.361110687256),
                fov = 50.0
            }
        },
        started  = false,
        done     = false
    },
    {
        location = "Liquor Vespucci",
        ped      = { model = "mp_m_shopkeep_01", pos = vector4(-1221.19140625, -908.17199707031, 12.326348304749, 35.877490997314) },
        props    = {hash = 303280717, pos = vector4(-1222.3305664063, -907.82336425781, 12.310836677551, 32.483174591064)},
        bag      = "prop_poly_bag_01",
        reward   = math.random(10000, 25000),
        scene    = {
            pos = vector3(-1221.9659423828, -908.46508789063, 12.310836677551),
            rot = vector3(0.0, 0.0, 26.379507064819),
            reward = math.random(333, 666),
            cam = {
                pos = vector3(-1223.8343505859, -905.63305664063, 12.774736404419),
                lookAt = vector3(-1221.2642822266, -909.41058349609, 12.575185775757),
                fov = 50.0
            }
        },
        started  = false,
        done     = false
    },
    {
        location = "Liquor morningwood",
        ped      = { model = "mp_m_shopkeep_01", pos = vector4(-1486.6641845703, -377.19082641602, 40.163410186768, 123.27526092529) },
        props    = {hash = 303280717, pos = vector4(-1486.6727294922, -378.46380615234, 40.147894744873, 133.77130126953)},
        bag      = "prop_poly_bag_01",
        reward   = math.random(10000, 25000),
        scene    = {
            pos = vector3(-1486.1368408203, -377.89169311523, 40.147894744873),
            rot = vector3(0.0, -0.0, 139.50692749023),
            reward = math.random(333, 666),
            cam = {
                pos = vector3(-1488.5177001953, -380.41146850586, 40.646270751953),
                lookAt = vector3(-1486.3375244141, -378.1325378418, 40.542533874512),
                fov = 50.0
            }
        },
        started  = false,
        done     = false
    },
    {
        location = "Liquor Mirror park",
        ped      = { model = "mp_m_shopkeep_01", pos = vector4(1133.9384765625, -983.23602294922, 46.415824890137, 280.95880126953) },
        props    = {hash = 303280717, pos = vector4(1134.8115234375, -982.36151123047, 46.400309448242, 276.68560791016)},
        bag      = "prop_poly_bag_01",
        reward   = math.random(10000, 25000),
        scene    = {
            pos = vector3(1134.2049560547, -982.4599609375, 46.415824890137),
            rot = vector3(-0.0, 0.0, -82.596893310547),
            reward = math.random(333, 666),
            cam = {
                pos = vector3(1137.380859375, -981.95080566406, 46.855926513672),
                lookAt = vector3(1133.0832519531, -982.66943359375, 46.66947555542),
                fov = 50.0
            }
        },
        started  = false,
        done     = false
    },
    {
        location = "Liquor Sandy",
        ped      = { model = "mp_m_shopkeep_01", pos = vector4(1392.0496826172, 3606.2800292969, 34.980911254883, 205.53262329102) },
        props    = {hash = 303280717, pos = vector4(1393.0717773438, 3605.9592285156, 34.993838195801, 199.99996948242)},
        bag      = "prop_poly_bag_01",
        reward   = math.random(10000, 25000),
        scene    = {
            pos = vector3(1392.8927001953, 3606.4047851563, 34.980911254883),
            rot = vector3(0.0, -0.0, -173.55149841309),
            reward = math.random(333, 666),
            cam = {
                pos = vector3(1393.8516845703, 3603.7790527344, 35.366477966309),
                lookAt = vector3(1392.892578125, 3606.3737792969, 35.296615600586),
                fov = 50.0
            }
        },
        started  = false,
        done     = false
    },
    {
        location = "Liquor Great Ocean",
        ped      = { model = "mp_m_shopkeep_01", pos = vector4(-2966.2900390625, 391.76489257813, 15.043308258057, 93.423469543457) },
        props    ={hash = 303280717, pos = vector4(-2967.0268554688, 390.90380859375, 15.027793769836, 85.236473083496)},
        bag      = "prop_poly_bag_01",
        reward   = math.random(10000, 25000),
        scene    = {
            pos = vector3(-2966.4279785156, 390.92230224609, 15.043308258057),
            rot = vector3(0.0, -0.0, 96.904678344727),
            reward = math.random(333, 666),
            cam = {
                pos = vector3(-2969.46875, 391.00119018555, 15.491899490356),
                lookAt = vector3(-2965.9404296875, 390.82516479492, 15.413257598877),
                fov = 50.0
            }
        },
        started  = false,
        done     = false
    },
    {
        location = "24/7 Innoncent Blvd",
        ped      = { model = "mp_m_shopkeep_01", pos = vector4(24.228687286377, -1345.6247558594, 29.497032165527, 259.88940429688) },
        props    = {hash = 303280717, pos = vector4(24.94561958313, -1344.9544677734, 29.491698150635, 270.0)},
        bag      = "prop_poly_bag_01",
        reward   = math.random(10000, 25000),
        scene    = {
            pos = vector3(24.360498428345, -1344.9998779297, 29.491698150635),
            rot = vector3(0.0, -0.0, -100.11058807373),
            reward = math.random(333, 666),
            cam = {
                pos = vector3(27.430572509766, -1344.8995361328, 30.019109725952),
                lookAt = vector3(23.802019119263, -1344.9462890625, 29.911617279053),
                fov = 50.0
            }
        },
        started  = false,
        done     = false
    },
    {
        location = "24/7 Vinewood",
        ped      = { model = "mp_m_shopkeep_01", pos = vector4(372.91571044922, 328.02529907227, 103.56646728516, 244.54989624023) },
        props    = {hash = 303280717, pos = vector4(373.59536743164, 328.58917236328, 103.5610760498, 255.88470458984)},
        bag      = "prop_poly_bag_01",
        reward   = math.random(10000, 25000),
        scene    = {
            pos = vector3(373.04360961914, 328.65356445313, 103.56646728516),
            rot = vector3(0.0, 0.0, -103.7442779541),
            reward = math.random(333, 666),
            cam = {
                pos = vector3(376.22830200195, 327.94409179688, 104.12196350098),
                lookAt = vector3(373.03479003906, 328.74838256836, 103.88512420654),
                fov = 50.0
            }
        },
        started  = false,
        done     = false
    },
    {
        location = "24/7 Tataviam mountain",
        ped      = { model = "mp_m_shopkeep_01", pos = vector4(2555.7038574219, 380.66363525391, 108.62298583984, 358.4807434082) },
        props    = {hash = 303280717, pos = vector4(2554.875, 381.3857421875, 108.61764801025, 357.71600341797)},
        bag      = "prop_poly_bag_01",
        reward   = math.random(10000, 25000),
        scene    = {
            pos = vector3(2554.8488769531, 380.93908691406, 108.62298583984),
            rot = vector3(-0.0, -0.0, -9.6590309143066),
            reward = math.random(333, 666),
            cam = {
                pos = vector3(2554.9519042969, 383.95288085938, 109.1761932373),
                lookAt = vector3(2554.8208007813, 380.84240722656, 108.94715118408),
                fov = 50.0
            }
        },
        started  = false,
        done     = false
    },
    {
        location = "24/7 Harmony",
        ped      = { model = "mp_m_shopkeep_01", pos = vector4(549.44390869141, 2669.9672851563, 42.156532287598, 88.858428955078) },
        props    = {hash = 303280717, pos = vector4(548.90148925781, 2668.94140625, 42.151179199219, 97.499977111816)},
        bag      = "prop_poly_bag_01",
        reward   = math.random(10000, 25000),
        scene    = {
            pos = vector3(549.38800048828, 2669.0556640625, 42.156532287598),
            rot = vector3(0.0, 0.0, 100.24632263184),
            reward = math.random(333, 666),
            cam = {
                pos = vector3(546.27722167969, 2668.5146484375, 42.640300750732),
                lookAt = vector3(548.98779296875, 2668.9365234375, 42.496631622314),
                fov = 50.0
            }
        },
        started  = false,
        done     = false
    },
    {
        location = "24/7 Grand Senora",
        ped      = { model = "mp_m_shopkeep_01", pos = vector4(2676.3142089844, 3279.8701171875, 55.241149902344, 324.00247192383) },
        props    = {hash = 303280717, pos = vector4(2676.2124023438, 3280.9694824219, 55.235815887451, 330.87005615234)},
        bag      = "prop_poly_bag_01",
        reward   = math.random(10000, 25000),
        scene    = {
            pos = vector3(2676.0634765625, 3280.5473632813, 55.241149902344),
            rot = vector3(-0.0, -0.0, -19.06120300293),
            reward = math.random(333, 666),
            cam = {
                pos = vector3(2677.318359375, 3283.0092773438, 55.597068786621),
                lookAt = vector3(2675.8793945313, 3280.2836914063, 55.550117492676),
                fov = 50.0
            }
        },
        started  = false,
        done     = false
    },
    {
        location = "24/7 Sandy Shore",
        ped      = { model = "mp_m_shopkeep_01", pos = vector4(1959.2141113281, 3741.0954589844, 32.343761444092, 300.77496337891) },
        props    = {hash = 303280717, pos = vector4(1959.3229980469, 3742.2895507813, 32.338427429199, 300.0)},
        bag      = "prop_poly_bag_01",
        reward   = math.random(10000, 25000),
        scene    = {
            pos = vector3(1958.8198242188, 3742.0678710938, 32.343761444092),
            rot = vector3(0.0, 0.0, -62.578170776367),
            reward = math.random(333, 666),
            cam = {
                pos = vector3(1961.2875976563, 3743.375, 32.882610321045),
                lookAt = vector3(1959.0357666016, 3742.1401367188, 32.669410705566),
                fov = 50.0
            }
        },
        started  = false,
        done     = false
    },
    {
        location = "24/7 Mont Chiliad",
        ped      = { model = "mp_m_shopkeep_01", pos = vector4(1728.4418945313, 6416.5737304688, 35.037242889404, 238.24540710449) },
        props    = {hash = 303280717, pos = vector4(1729.3294677734, 6417.123046875, 35.031908874512, 243.64082336426)},
        bag      = "prop_poly_bag_01",
        reward   = math.random(10000, 25000),
        scene    = {
            pos = vector3(1728.9157714844, 6417.2788085938, 35.037242889404),
            rot = vector3(0.0, -0.0, -120.67926025391),
            reward = math.random(333, 666),
            cam = {
                pos = vector3(1731.5811767578, 6416.0571289063, 35.415023803711),
                lookAt = vector3(1728.9385986328, 6417.3872070313, 35.315635681152),
                fov = 50.0
            }
        },
        started  = false,
        done     = false
    },
    {
        location = "24/7 Chumash",
        ped      = { model = "mp_m_shopkeep_01", pos = vector4(-3243.7077636719, 1000.0003051758, 12.830711364746, 342.81701660156) },
        props    = {hash = 303280717, pos = vector4(-3244.5734863281, 1000.6577758789, 12.825377349854, 355.07446289063)},
        bag      = "prop_poly_bag_01",
        reward   = math.random(10000, 25000),
        scene    = {
            pos = vector3(-3244.5407714844, 1000.1804199219, 12.830711364746),
            rot = vector3(-0.0, -0.0, -6.337085723877),
            reward = math.random(333, 666),
            cam = {
                pos = vector3(-3244.3781738281, 1002.8929443359, 13.293932914734),
                lookAt = vector3(-3244.5661621094, 1000.0897827148, 13.093291282654),
                fov = 50.0
            }
        },
        started  = false,
        done     = false
    },
    {
        location = "24/7 Banham canyon",
        ped      = { model = "mp_m_shopkeep_01", pos = vector4(-3040.3688964844, 583.96673583984, 7.9089317321777, 19.625303268433) },
        props    = {hash = 303280717, pos = vector4(-3041.3566894531, 584.26654052734, 7.9035967636108, 17.759208679199)},
        bag      = "prop_poly_bag_01",
        reward   = math.random(10000, 25000),
        scene    = {
            pos = vector3(-3041.2062988281, 583.79766845703, 7.9089317321777),
            rot = vector3(0.0, 0.0, 16.139575958252),
            reward = math.random(333, 666),
            cam = {
                pos = vector3(-3042.1623535156, 586.55181884766, 8.3674354553223),
                lookAt = vector3(-3041.2312011719, 583.83215332031, 8.2892875671387),
                fov = 50.0
            }
        },
        started  = false,
        done     = false
    }
}
