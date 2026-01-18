return {
    Debug = false,
    UseModels = false,                                    --UseModels true for all prop instances
    Target = 'qb',                                        --Target 'qb' or 'ox' or 'lib'
    Poles = {
        { position = vector4(-45.14, -1278.11, 19.00, 0.00), spawn = false }, -- position required, job optional, spawn optional
        { position = vector4(-50.90, -1278.09, 19.00, 0.00), spawn = false }, -- position required, job optional, spawn optional
        { position = vector4(-61.00, -1288.80, 19.75, 0.00), spawn = false }, -- position required, job optional, spawn optional
        { position = vector4(-1231.58, -1237.03, 3.02, 0.00), spawn = false }, -- position required, job optional, spawn optional
        { position = vector4(-1233.11, -1232.46, 3.02, 0.00), spawn = false }, -- position required, job optional, spawn optional
        { position = vector4(-1243.88, -1234.74, 3.22, 0.00), spawn = false }, -- position required, job optional, spawn optional
        -- Vanilla VU Poles
        { position = vector4(104.16384124756, -1294.2568359375, 28.26, 30),  job = 'unicorn' },
        { position = vector4(102.25046539307, -1290.8802490234, 28.25, 30),  job = 'unicorn' },
        { position = vector4(112.580322265631, -1287.0412597656, 27.46, 30), job = 'unicorn' }
    }

}
