CONFIG = {
    USE_JOB = false, -- {true, false} [false by default in vrp]
    MENU_TYPE = "default", -- esx: {ox_lib, context, default} / qb: {ox_lib, default/context} / qbox: {ox_lib, default/context}
    TARGET_TYPE = "none", -- qb-target, ox_target, none
    JOB_NAME = "harem", -- left blank if you aren't using job version
    BILLING_KEY = "F6", -- left blank if you don't want to use it
    CUSTOM_BILLING_SYSTEM = false,
    CHAIR_PROP = "otaku_harem_saloon_prop_nchair", -- If the shop is near this type of prop, the ped will sits down
    CHAIR_COORDS = { 
        X = 0.0,
        Y = -0.4,
        Z = 0.01,
        HEADING = -180.0
    },
    CURRENT_LANG = "en", -- {en, fr, es, it, de, ja, pt, sv}
    PRICE = 500, -- price for any nails edit

    SHOP_BLIPS = {
        {           
            COORDS = vector3(-1243.33, -787.70, 120.0),     
            SHOW = false, 
            NAME = "Harem Saloon",
            ID = 495,
            COLOR = 0,
            SIZE = 1.2
        }
    },

    --WORKS ONLY WITH "USE_JOB" ON TRUE
    JOB_POSITIONS = {
        BOSS_MENU = {
            MARKER = {
                SHOW = true,
                ID = 9,
                COLOR = {R = 0, G = 0, B = 0},
                DICT = "nailshop_marker",
                TEXTURE = "boss",
                SIZE = vector3(0.6, 0.6, 0.6),
                VIEW_DISTANCE = 20.0,
                INTERACTION_DISTANCE = 2.0
            },
            COORDS = vector3(-1259.010986, -803.353821, 18.44),
        },
        LOCKER_ROOM_MENU = {
            MARKER = {
                SHOW = true,
                ID = 9,
                COLOR = {R = 0, G = 0, B = 0},
                DICT = "nailshop_marker",
                TEXTURE = "locker",
                SIZE = vector3(0.6, 0.6, 0.6),
                VIEW_DISTANCE = 20.0,
                INTERACTION_DISTANCE = 2.0
            },
            COORDS = vector3(-1258.905518, -799.252747, 18.44),
        },
        VEHICLE_MENU = {
            MARKER = {
                SHOW = true,
                ID = 9,
                COLOR = {R = 0, G = 0, B = 0},
                DICT = "nailshop_marker",
                TEXTURE = "garage",
                SIZE = vector3(0.6, 0.6, 0.6),
                VIEW_DISTANCE = 20.0,
                INTERACTION_DISTANCE = 2.0
            },
            COORDS = vector3(-1269.929688, -801.098877, 17.063721),
        },
        TABLES = { -- coordinates where the markers for changing the nails will be
            {
                SELLER_COORDS = vector3(-1244.795654, -798.421997, 18.4),
                BUYER_COORDS = vector3(-1242.606567, -796.786804, 18.4),
                MARKER = {
                    SHOW = true,
                    ID = 9,
                    COLOR = {R = 0, G = 0, B = 0},
                    DICT = "nailshop_marker",
                    TEXTURE = {"worker", "customer"},
                    SIZE = vector3(0.3, 0.3, 0.3),
                    VIEW_DISTANCE = 20.0,
                    INTERACTION_DISTANCE = 2.0
                }
            },
            {
                SELLER_COORDS = vector3(-1248.118652, -801.006592, 18.4),
                BUYER_COORDS = vector3(-1246.061523, -799.397827, 18.4),
                MARKER = {
                    SHOW = true,
                    ID = 9,
                    COLOR = {R = 0, G = 0, B = 0},
                    DICT = "nailshop_marker",
                    TEXTURE = {"worker", "customer"},
                    SIZE = vector3(0.3, 0.3, 0.3),
                    VIEW_DISTANCE = 20.0,
                    INTERACTION_DISTANCE = 2.0
                }
            }
        }
    },

    --WORKS ONLY WITH "USE_JOB" ON FALSE
    SHOPS = {
        {
            COORDS = vector3(-1242.606567, -796.786804, 18.4),
            MARKER = {
                SHOW = true,
                ID = 9,
                COLOR = {R = 255, G = 255, B = 255},
                DICT = "nailshop_marker",
                TEXTURE = "customer",
                SIZE = vector3(0.3, 0.3, 0.3),
                VIEW_DISTANCE = 20.0,
                INTERACTION_DISTANCE = 2.0
            },
        },
        {
            COORDS = vector3(-1246.061523, -799.397827, 18.4),
            MARKER = {
                SHOW = true,
                ID = 9,
                COLOR = {R = 0, G = 0, B = 0},
                DICT = "nailshop_marker",
                TEXTURE = "customer",
                SIZE = vector3(0.3, 0.3, 0.3),
                VIEW_DISTANCE = 20.0,
                INTERACTION_DISTANCE = 2.0
            },
        }
    },

    SKINS = {
        -- BUILD 2545 
        ["M"] = {
            tshirt_1 = 15,  tshirt_2 = 0,
            torso_1 = 393,   torso_2 = 0,
            decals_1 = -1,   decals_2 = 0,
            arms = 85,
            pants_1 = 151,   pants_2 = 0,
            shoes_1 = 49,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = -1,     ears_2 = 0
        },
        ["F"] = {
            tshirt_1 = 14,  tshirt_2 = 0,
            torso_1 = 415,   torso_2 = 0,
            decals_1 = -1,   decals_2 = 0,
            arms = 85,
            pants_1 = 151,   pants_2 = 0,
            shoes_1 = 49,   shoes_2 = 0,
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