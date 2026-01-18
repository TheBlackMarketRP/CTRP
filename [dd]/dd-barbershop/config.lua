CONFIG = {
    USE_JOB = false,
    SKIN_SCRIPT = "illenium-appearance", -- OPTIONS FOR ESX: [skinchanger, fivem-appearance, tgiann-clothing, custom] OPTIONS FOR QB: [qb-clothing, illenium-appearance, fivem-appearance, tgiann-clothing, custom] 
    MENU_TYPE = "context", -- esx: {ox_lib, context, default} / qb: {ox_lib, default/context}
    TARGET_TYPE = "none", -- qb_target, ox_target, none
    JOB_NAME = "harem", -- left blank if you aren't using job version
    BILLING_KEY = "F6", -- left blank if you don't want to use it or if you have dd-nailshopV2
    CUSTOM_BILLING_SYSTEM = false,
    CHAIR_PROP = "otaku_hs_prop_schair", -- If the shop is near this type of prop, the ped will sits down
    CHAIR_COORDS = { 
        X = -0.01,
        Y = -0.6,
        Z = 0.1,
        HEADING = -180.0
    },
    SELLER = {
        MODEL = "s_m_m_hairdress_01",
        WALK_PATH = {
            [1] = {
                X = -1258.575806, 
                Y = -792.356018, 
                Z = 18.630737
            },
            [2] = {
                X = -1256.386841, 
                Y = -789.771423, 
                Z = 18.630737
            },
            [3] = {
                X = -1252.325317, 
                Y = -789.019775, 
                Z = 18.630737
            },
        },
        OFFSET = {
            X = 0.0, 
            Y = -1.3, 
            Z = 0.0
        }
    },
    CURRENT_LANG = "en", -- {en, fr, es, it, de, ja, pt}
    PRICE = 500, -- price for any barbers edit
    CONFIGURATOR = {
        AUTHORIZED_LICENSES = {
            --insert here the license to the administrator that can create the image
            "license:bc49f091bb50967039b397084b0babc8a1028d0b" --example license
        },
        COORDS = {
            X = -1276.166992, 
            Y = -666.329651, 
            Z = 42.001465,
            H = 297.0
        },
    },
    SHOP_BLIPS = {
        {           
            COORDS = vector3(-1243.33, -787.70, 120.0),     
            SHOW = false, --disable if you manage that in another script like dd-nailshopV2
            NAME = "Harem Saloon",
            ID = 495,
            COLOR = 0,
            SIZE = 1.2
        }
    },

    --WORKS ONLY WITH "USE_JOB" ON TRUE
    JOB_POSITIONS = {
        BOSS_MENU = {
            ENABLED = true, --disable if you manage that in another script like dd-nailshopV2
            MARKER = {
                SHOW = true,
                ID = 9,
                COLOR = {R = 0, G = 0, B = 0},
                DICT = "barbershop_marker",
                TEXTURE = "boss",
                SIZE = vector3(0.6, 0.6, 0.6),
                VIEW_DISTANCE = 20.0,
                INTERACTION_DISTANCE = 1.0
            },
            COORDS = vector3(-1259.010986, -803.353821, 18.44),
        },
        LOCKER_ROOM_MENU = {
            ENABLED = true, --disable if you manage that in another script like dd-nailshopV2
            MARKER = {
                SHOW = true,
                ID = 9,
                COLOR = {R = 0, G = 0, B = 0},
                DICT = "barbershop_marker",
                TEXTURE = "locker",
                SIZE = vector3(0.6, 0.6, 0.6),
                VIEW_DISTANCE = 20.0,
                INTERACTION_DISTANCE = 1.0
            },
            COORDS = vector3(-1258.905518, -799.252747, 18.44),
        },
        VEHICLE_MENU = {
            ENABLED = true, --disable if you manage that in another script like dd-nailshopV2
            MARKER = {
                SHOW = true,
                ID = 9,
                COLOR = {R = 0, G = 0, B = 0},
                DICT = "barbershop_marker",
                TEXTURE = "garage",
                SIZE = vector3(0.6, 0.6, 0.6),
                VIEW_DISTANCE = 20.0,
                INTERACTION_DISTANCE = 1.0
            },
            COORDS = vector3(-1269.929688, -801.098877, 17.063721),
        },
        TABLES = { -- coordinates where the barber marker will be (WORKS ONLY WITH "USE_JOB" ON TRUE)
            {
                SELLER_COORDS = vector3(-1249.793457, -796.391235, 18.630737),
                BUYER_COORDS = vector3(-1251.257080, -797.723083, 18.630737),
                MARKER = {
                    SHOW = true,
                    ID = 9,
                    COLOR = {R = 0, G = 0, B = 0},
                    DICT = "barbershop_marker",
                    TEXTURE = {"worker", "customer"},
                    SIZE = vector3(0.6, 0.6, 0.6),
                    VIEW_DISTANCE = 20.0,
                    INTERACTION_DISTANCE = 1.0
                }
            },
            {
                SELLER_COORDS = vector3(-1252.074707, -793.186829, 18.630737),
                BUYER_COORDS = vector3(-1253.591187, -794.597778, 18.630737),
                MARKER = {
                    SHOW = true,
                    ID = 9,
                    COLOR = {R = 0, G = 0, B = 0},
                    DICT = "barbershop_marker",
                    TEXTURE = {"worker", "customer"},
                    SIZE = vector3(0.6, 0.6, 0.6),
                    VIEW_DISTANCE = 20.0,
                    INTERACTION_DISTANCE = 1.0
                }
            },
            {
                SELLER_COORDS = vector3(-1253.340698, -791.670349, 18.630737),
                BUYER_COORDS = vector3(-1255.002197, -793.068115, 18.630737),
                MARKER = {
                    SHOW = true,
                    ID = 9,
                    COLOR = {R = 0, G = 0, B = 0},
                    DICT = "barbershop_marker",
                    TEXTURE = {"worker", "customer"},
                    SIZE = vector3(0.6, 0.6, 0.6),
                    VIEW_DISTANCE = 20.0,
                    INTERACTION_DISTANCE = 1.0
                }
            }
        }
    },

    --WORKS ONLY WITH "USE_JOB" ON FALSE
    SHOPS = {
        {
            COORDS = vector3(-1251.257080, -797.723083, 18.630737),
            MARKER = {
                SHOW = true,
                ID = 9,
                COLOR = {R = 0, G = 0, B = 0},
                DICT = "barbershop_marker",
                TEXTURE = "customer",
                SIZE = vector3(0.6, 0.6, 0.6),
                VIEW_DISTANCE = 20.0,
                INTERACTION_DISTANCE = 2.0
            },
        },
        {
            COORDS = vector3(-1253.591187, -794.597778, 18.630737),
            MARKER = {
                SHOW = true,
                ID = 9,
                COLOR = {R = 0, G = 0, B = 0},
                DICT = "barbershop_marker",
                TEXTURE = "customer",
                SIZE = vector3(0.6, 0.6, 0.6),
                VIEW_DISTANCE = 20.0,
                INTERACTION_DISTANCE = 2.0
            },
        }
    },

    SKINS = {
        ["M"] = {
            tshirt_1 = 15,  tshirt_2 = 0,
            torso_1 = 442,   torso_2 = 0,
            decals_1 = -1,   decals_2 = 0,
            arms = 1,
            pants_1 = 24,   pants_2 = 0,
            shoes_1 = 1,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = -1,     ears_2 = 0
        },
        ["F"] = {
            tshirt_1 = 14,  tshirt_2 = 0,
            torso_1 = 473,   torso_2 = 0,
            decals_1 = -1,   decals_2 = 0,
            arms = 14,
            pants_1 = 37,   pants_2 = 0,
            shoes_1 = 3,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = -1,     ears_2 = 0
        }
    },

    VEHICLES = {
        {value = "vitoharem", title = "Vans"},
    },

    LANGUAGES = {}, --DON'T TOUCH THIS VARIABLE
    DEV_MODE = false
}

