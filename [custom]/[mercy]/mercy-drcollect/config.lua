Config = {
    Core = 'qb-core',  
    Target = 'qb-target',  
    Menu = 'qb-menu', 
}

Config.CollectLocations = {
    {
        Name = 'BestBuds Collect',
        MarkerType = 21,
        Coords = vector3(380.32, -812.35, 29.33),
        Size = {x = 0.5, y = 0.5, z = 0.5},
        Color = {r = 78, g = 217, b = 140, a = 75},
        ItemGiveInterval = 12000,
        RewardItems = {
            {
                ['item'] = 'weed_cookies',
                ['amount'] = 12,
            },
        },
        Blip = {
            Show = false, 
            Icon = 51,
            Size = 0.6,
            Color = 2,
        },
    },
    {
        Name = 'gdz gang drug',
        MarkerType = 21,
        Coords = vector3(2220.24, 3127.9, 54.7),
        Size = {x = 0.5, y = 0.5, z = 0.5},
        Color = {r = 78, g = 217, b = 140, a = 75},
        ItemGiveInterval = 12000,
        RewardItems = {
            {
                ['item'] = 'weed_amnesia',
                ['amount'] = 12,
            },
        },
        Blip = {
            Show = false, 
            Icon = 51,
            Size = 0.6,
            Color = 2,
        },
    },
    -- {
    --     Name = 'Puff Puff Collect',
    --     MarkerType = 21,
    --     Coords = vector3(-1552.08, -450.98, 35.92),
    --     Size = {x = 0.5, y = 0.5, z = 0.5},
    --     Color = {r = 78, g = 217, b = 140, a = 75},
    --     ItemGiveInterval = 12000,
    --     RewardItems = {
    --         {
    --             ['item'] = 'weed_ak47_cbd_crop',
    --             ['amount'] = 12,
    --         },
    --     },
    --     Blip = {
    --         Show = false, 
    --         Icon = 51,
    --         Size = 0.6,
    --         Color = 2,
    --     },
    -- },
    -- {
    --     Name = 'Kush Collect',
    --     MarkerType = 21,
    --     Coords = vector3(-488.49, 37.76, 38.7),
    --     Size = {x = 0.5, y = 0.5, z = 0.5},
    --     Color = {r = 78, g = 217, b = 140, a = 75},
    --     ItemGiveInterval = 12000,
    --     RewardItems = {
    --         {
    --             ['item'] = 'ogkushleaf',
    --             ['amount'] = 12,
    --         },
    --     },
    --     Blip = {
    --         Show = false, 
    --         Icon = 51,
    --         Size = 0.6,
    --         Color = 2,
    --     },
    -- },
    {
        Name = 'lace Collect',
        MarkerType = 21,
        Coords = vector3(-1449.44, -394.69, 39.39),
        Size = {x = 0.5, y = 0.5, z = 0.5},
        Color = {r = 78, g = 217, b = 140, a = 75},
        ItemGiveInterval = 12000,
        RewardItems = {
            {
                ['item'] = 'shoelace',
                ['amount'] = 12,
            },
        },
        Blip = {
            Show = false, 
            Icon = 51,
            Size = 0.6,
            Color = 2,
        },
    },
    {
        Name = 'Shoe Sole',
        MarkerType = 21,
        Coords = vector3(-1445.57, -392.5, 39.39),
        Size = {x = 0.5, y = 0.5, z = 0.5},
        Color = {r = 78, g = 217, b = 140, a = 75},
        ItemGiveInterval = 12000,
        RewardItems = {
            {
                ['item'] = 'shoesole',
                ['amount'] = 12,
            },
        },
        Blip = {
            Show = false, 
            Icon = 51,
            Size = 0.6,
            Color = 2,
        },
    },
    {
        Name = 'shoe leather',
        MarkerType = 21,
        Coords = vector3(-1442.17, -386.69, 39.39),
        Size = {x = 0.5, y = 0.5, z = 0.5},
        Color = {r = 78, g = 217, b = 140, a = 75},
        ItemGiveInterval = 12000,
        RewardItems = {
            {
                ['item'] = 'shoeleather',
                ['amount'] = 12,
            },
        },
        Blip = {
            Show = false, 
            Icon = 51,
            Size = 0.6,
            Color = 2,
        },
    },
}


Config.Processes = {
    { --- Each one of this a Whole New Process 
        Name = "Best Buds Process",
        Job = "bestbuds",
        Blip = {
            Enable = false,
            Color = 75,
            Icon = 106,  
            Size = 0.6,  
        },
        Process = {
            Coords = vector3(381.27, -816.72, 29.33),
            Recipe = {
                ['bbbrownie'] = {
                    reward = 1,
                    time = 6000,
                    required = {
                        { name = 'weed_cookies', amount = 12 },
                        { name = 'coco_chocholate', amount = 1 },
                    }
                },
                ['bbcake'] = {
                    reward = 1,
                    time = 6000,
                    required = {
                        { name = 'weed_cookies', amount = 12 },
                        { name = 'coco_chocosyrup', amount = 1 },
                    }
                },
                ['bbgummie'] = {
                    reward = 1,
                    time = 6000,
                    required = {
                        { name = 'weed_cookies', amount = 12 },
                        { name = 'lychee', amount = 1 },
                    }
                },
            }
        },
    }, --- Each one of this a Whole New Process 
    -- { --- Each one of this a Whole New Process 
    --     Name = "Puff Puff Trim",
    --     Job = "puffpuff",
    --     Blip = {
    --         Enable = false,
    --         Color = 75,
    --         Icon = 106,  
    --         Size = 0.6,  
    --     },
    --     Process = {
    --         Coords = vector3(-1552.92, -456.66, 35.92),
    --         Recipe = {
    --             ['weed_tak47'] = {
    --                 reward = 300,
    --                 time = 3000,
    --                 required = {
    --                     { name = 'weed_ak47_cbd_crop', amount = 300 },
    --                 }
    --             },
    --         }
    --     },
    -- }, --- Each one of this a Whole New Process 
    -- { --- Each one of this a Whole New Process 
    --     Name = "Puff Puff Bag",
    --     Job = false,
    --     Blip = {
    --         Enable = false,
    --         Color = 75,
    --         Icon = 106,  
    --         Size = 0.6,  
    --     },
    --     Process = {
    --         Coords = vector3(-1557.65, -433.26, 35.92),
    --         Recipe = {
    --             ['weed_ak47'] = {
    --                 reward = 100,
    --                 time = 3000,
    --                 required = {
    --                     { name = 'weed_tak47', amount = 300 },
    --                 }
    --             },
    --         }
    --     },
    -- }, --- Each one of this a Whole New Process 
    -- { --- Each one of this a Whole New Process 
    --     Name = "kush Bag1",
    --     Job = false,
    --     Blip = {
    --         Enable = false,
    --         Color = 75,
    --         Icon = 106,  
    --         Size = 0.6,  
    --     },
    --     Process = {
    --         Coords = vector3(-526.44, 30.38, 44.62),
    --         Recipe = {
    --             ['ogkushbag'] = {
    --                 reward = 100,
    --                 time = 3000,
    --                 required = {
    --                     { name = 'ogkushnug', amount = 300 },
    --                 }
    --             },
    --         }
    --     },
    -- }, --- Each one of this a Whole New Process 
    -- { --- Each one of this a Whole New Process 
    --     Name = "kush Bag2",
    --     Job = false,
    --     Blip = {
    --         Enable = false,
    --         Color = 75,
    --         Icon = 106,  
    --         Size = 0.6,  
    --     },
    --     Process = {
    --         Coords = vector3(-531.08, 39.71, 44.61),
    --         Recipe = {
    --             ['ogkushbag'] = {
    --                 reward = 100,
    --                 time = 3000,
    --                 required = {
    --                     { name = 'ogkushnug', amount = 300 },
    --                 }
    --             },
    --         }
    --     },
    -- }, --- Each one of this a Whole New Process 
    -- { --- Each one of this a Whole New Process 
    --     Name = "kush Bag3",
    --     Job = false,
    --     Blip = {
    --         Enable = false,
    --         Color = 75,
    --         Icon = 106,  
    --         Size = 0.6,  
    --     },
    --     Process = {
    --         Coords = vector3(-524.73, 39.23, 44.62),
    --         Recipe = {
    --             ['ogkushbag'] = {
    --                 reward = 100,
    --                 time = 3000,
    --                 required = {
    --                     { name = 'ogkushnug', amount = 300 },
    --                 }
    --             },
    --         }
    --     },
    -- }, --- Each one of this a Whole New Process 
    -- { --- Each one of this a Whole New Process 
    --     Name = "kush trim",
    --     Job = false,
    --     Blip = {
    --         Enable = false,
    --         Color = 75,
    --         Icon = 106,  
    --         Size = 0.6,  
    --     },
    --     Process = {
    --         Coords = vector3(-503.01, 43.65, 38.7),
    --         Recipe = {
    --             ['ogkushnug'] = {
    --                 reward = 300,
    --                 time = 3000,
    --                 required = {
    --                     { name = 'ogkushleaf', amount = 300 },
    --                 }
    --             },
    --         }
    --     },
    -- }, --- Each one of this a Whole New Process 
    { --- Each one of this a Whole New Process 
        Name = "shroom bag",
        Job = false,
        Blip = {
            Enable = false,
            Color = 75,
            Icon = 106,  
            Size = 0.6,  
        },
        Process = {
            Coords = vector3(-4.49, 6493.72, 31.64),
            Recipe = {
                ['shroom_pouch'] = {
                    reward = 1,
                    time = 8000,
                    required = {
                        { name = 'shroom', amount = 3 },
                        { name = 'pooch_bag', amount = 1 },
                    }
                },
            }
        },
    }, --- Each one of this a Whole New Process 
    { --- Each one of this a Whole New Process 
        Name = "shoes",
        Job = "sneaker",
        Blip = {
            Enable = false,
            Color = 75,
            Icon = 106,  
            Size = 0.6,  
        },
        Process = {
            Coords = vector3(-1442.45, -386.52, 36.11),
            Recipe = {
                ['shoes'] = {
                    reward = 1,
                    time = 8000,
                    required = {
                        { name = 'shoelace', amount = 6 },
                        { name = 'shoeleather', amount = 6 },
                        { name = 'shoesole', amount = 6 },
                    }
                },
            }
        },
    }, --- Each one of this a Whole New Process 
    { --- Each one of this a Whole New Process 
        Name = "gdzdrug",
        Job = false,
        Blip = {
            Enable = false,
            Color = 75,
            Icon = 106,  
            Size = 0.6,  
        },
        Process = {
            Coords = vector3(2213.07, 3132.39, 54.68),
            Recipe = {
                ['spice_pouch'] = {
                    reward = 5,
                    time = 8000,
                    required = {
                        { name = 'weed_amnesia', amount = 1 },
                        { name = 'rawmeth', amount = 6 },
                        { name = 'fentanyl', amount = 6 },
                    }
                },
            }
        },
    }, --- Each one of this a Whole New Process 
}

Config.AntiAFKCheck = {min = 100000, max = 1000000}