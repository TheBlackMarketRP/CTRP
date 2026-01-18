QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	unemployed = { label = 'Civilian', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Freelancer', payment = 10 } } },
	bus = { label = 'Bus', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	judge = { label = 'Honorary', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Judge', payment = 100 } } },
	lawyer = { label = 'Law Firm', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Associate', payment = 50 } } },
	reporter = { label = 'Reporter', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Journalist', payment = 50 } } },
	trucker = { label = 'Trucker', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	tow = { label = 'Towing', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	garbage = { label = 'Garbage', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Collector', payment = 50 } } },
	vineyard = { label = 'Vineyard', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Picker', payment = 50 } } },
	hotdog = { label = 'Hotdog', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Sales', payment = 50 } } },

	police = {
		label = 'Law Enforcement',
		type = 'leo',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 1000 },
			['1'] = { name = 'Officer', payment = 2500 },
			['2'] = { name = 'Senior Officer', payment = 3000 },
			['3'] = { name = 'Sergeant', payment = 4000 },
			['4'] = { name = 'Lieutenant', payment = 5000 },
			['5'] = { name = 'Captain', payment = 6500 },
			['6'] = { name = 'Deputy Chief', isboss = true, payment = 10000 },
			['7'] = { name = 'Assitant Chief', isboss = true, payment = 10000 },
			['8'] = { name = 'Chief', isboss = true, payment = 10000 },
		},
	},
	ambulance = {
		label = 'EMS',
		type = 'ems',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Paramedic', payment = 75 },
			['2'] = { name = 'Doctor', payment = 100 },
			['3'] = { name = 'Surgeon', payment = 125 },
			['4'] = { name = 'Chief', isboss = true, payment = 10000 },
		},
	},
	realestate = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'House Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Broker', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 10000 },
		},
	},
	taxi = {
		label = 'Taxi',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Driver', payment = 75 },
			['2'] = { name = 'Event Driver', payment = 100 },
			['3'] = { name = 'Sales', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 10000 },
		},
	},
	cardealer = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Showroom Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Finance', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 10000 },
		},
	},
	mechanic = {
		label = 'LS Customs',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 10000 },
		},
	},
	mechanic2 = {
		label = 'LS Customs',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 10000 },
		},
	},
	mechanic3 = {
		label = 'LS Customs',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 10000 },
		},
	},
	beeker = {
		label = 'Beeker\'s Garage',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 10000 },
		},
	},
	bennys = {
		label = 'Benny\'s Original Motor Works',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 10000 },
		},
	},

	['khusland'] = {
        label = 'KhusLand',
        defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Farmer',
                payment = 50
            },
            ['1'] = {
                name = 'Dancer',
                payment = 60
            },
            ['2'] = {
                name = 'Bartender',
                payment = 75
            },
            ['3'] = {
                name = 'Shopkeeper',
                payment = 100
            },
            ['4'] = {
                name = 'Manager',
                payment = 120
            },
            ['5'] = {
                name = 'Owner',
                payment = 10000,
                isboss = true,
            },
        },
    },

	['hookahloungev2'] = {
        label = 'Hookah Lounge',
        defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Employee',
                payment = 50
            },
            ['1'] = {
                name = 'Bartender',
                payment = 50
            },
            ['2'] = {
                name = 'Shopkeeper',
                payment = 75
            },
            ['3'] = {
                name = 'Manager',
                payment = 100
            },
            ['4'] = {
                name = 'Owner',
                payment = 125,
                isboss = true,
            },
        },
    },

	['leafnlatte'] = {
        label = 'Leaf & Latte',
        defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Farmer',
                payment = 50
            },
            ['1'] = {
                name = 'Bartender',
                payment = 75
            },
            ['2'] = {
                name = 'Shopkeeper',
                payment = 100
            },
            ['3'] = {
                name = 'Manager',
                payment = 120
            },
            ['4'] = {
                name = 'Owner',
                payment = 150,
                isboss = true,
            },
        },
    },

	['khusbites'] = {
        label = 'KhusBites',
        defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Farmer',
                payment = 50
            },
            ['1'] = {
                name = 'Shopkeeper',
                payment = 75
            },
            ['2'] = {
                name = 'Manager',
                payment = 100
            },
            ['3'] = {
                name = 'Owner',
                payment = 125,
                isboss = true,
            },
        },
    },

	['chickenwings'] = {
    label = "Chicken Wings",
    defaultDuty = true,
    grades = {
        ['0'] = {name = 'Waiter', payment = 50},
        ['1'] = {name = 'Delivery Driver', payment = 75},
        ['2'] = {name = 'Cook', payment = 100},
        ['3'] = {name = 'Manager', payment = 100},
        ['4'] = {name = 'Owner', payment = 125, isboss = true},
    },
    },

	['mcdoodies'] = {
    label = "McDoodies",
    defaultDuty = true,
    grades = {
        ['0'] = {name = 'Waiter', payment = 50},
        ['1'] = {name = 'Delivery Driver', payment = 75},
        ['2'] = {name = 'Cook', payment = 100},
        ['3'] = {name = 'Manager', payment = 100},
        ['4'] = {name = 'Owner', payment = 125, isboss = true},
    },
	},

	['realestate'] = {
        label = 'Realestate',
        defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Rookie',
                payment = 50
            },
            ['1'] = {
                name = 'Seller',
                payment = 75
            },
            ['2'] = {
                name = 'Manager',
                payment = 100
            },
            ['3'] = {
                name = 'Boss',
                payment = 125,
                isboss = true,
            },
        },
    },

['harem'] = {
    label = 'Harem Saloon',
    defaultDuty = true,
    offDutyPay = false,
    grades = {
        ['0'] = {
            name = 'Learner',
            payment = 50
        },
        ['1'] = {
            name = 'Beautician',
            payment = 75
        },
        ['2'] = {
            name = 'Manager',
            isboss = true,
            payment = 100
        }
    },
},
['bestbuds'] = {
    label = 'Best Buds',
    defaultDuty = true,
    offDutyPay = false,
    grades = {
        ['0'] = {
            name = 'Learner',
            payment = 50
        },
        ['1'] = {
            name = 'Trimmer',
            payment = 75
        },
        ['2'] = {
            name = 'Manager',
            payment = 75
        },
        ['3'] = {
            name = 'Owner',
            isboss = true,
            payment = 100
        }
    },
},
['puffpuff'] = {
    label = 'Puff Puff Pass',
    defaultDuty = true,
    offDutyPay = false,
    grades = {
        ['0'] = {
            name = 'Learner',
            payment = 50
        },
        ['1'] = {
            name = 'Trimmer',
            payment = 75
        },
        ['2'] = {
            name = 'Manager',
            payment = 75
        },
        ['3'] = {
            name = 'Owner',
            isboss = true,
            payment = 100
        }
    },
},
['pinktrap'] = {
    label = 'Puff Puff Pass',
    defaultDuty = true,
    offDutyPay = false,
    grades = {
        ['0'] = {
            name = 'Learner',
            payment = 50
        },
        ['1'] = {
            name = 'Trimmer',
            payment = 75
        },
        ['2'] = {
            name = 'Manager',
            payment = 75
        },
        ['3'] = {
            name = 'Owner',
            isboss = true,
            payment = 100
        }
    },
},
['bmc'] = {
    label = 'BMC Mech Shop',
    defaultDuty = true,
    offDutyPay = false,
    grades = {
        ['0'] = {
            name = 'Learner',
            payment = 50
        },
        ['1'] = {
            name = 'Trimmer',
            payment = 75
        },
        ['2'] = {
            name = 'Manager',
            payment = 75
        },
        ['3'] = {
            name = 'Owner',
            isboss = true,
            payment = 100
        }
    },
},
['kush'] = {
    label = 'Kush Tow & Repo',
    defaultDuty = true,
    offDutyPay = false,
    grades = {
        ['0'] = {
            name = 'Learner',
            payment = 50
        },
        ['1'] = {
            name = 'Trimmer',
            payment = 75
        },
        ['2'] = {
            name = 'Manager',
            payment = 75
        },
        ['3'] = {
            name = 'Owner',
            isboss = true,
            payment = 100
        }
    },
},

['bahama'] = {
	label = 'Bahama Mamas',
	defaultDuty = true,
	offDutyPay = false,
	grades = {
		['0'] = { name = 'Recruit', payment = 50 },
		['1'] = { name = 'Novice', payment = 75 },
		['2'] = { name = 'Experienced', payment = 100 },
		['3'] = { name = 'Manager', payment = 125 },
		['4'] = { name = 'Owner', isboss = true, payment = 150 },
	},
},
['sneaker'] = {
	label = 'SneakerHeadz',
	defaultDuty = true,
	offDutyPay = false,
	grades = {
		['0'] = { name = 'Recruit', payment = 50 },
		['1'] = { name = 'Novice', payment = 75 },
		['2'] = { name = 'Experienced', payment = 100 },
		['3'] = { name = 'Manager', payment = 125 },
		['4'] = { name = 'Owner', isboss = true, payment = 150 },
	},
},

['farmer'] = {
    label = 'Farmer',
    defaultDuty = true,
    grades = {
        ['0'] = {
            name = 'Farmer',
            payment = 750
        },
    },
},


}
