# ox-inventory
If you want to add the items to ox_inventory. You can use the following configuration for your items:

```lua
['ballistic_shield'] = {
    label = 'Ballistic Shield',
    weight = 250,
    consume = 0,
    allowArmed = true,
    server = {
        export = 'gs_policeshield.ballistic_shield',
    }
},

['riot_shield'] = {
    label = 'Riot Shield',
    weight = 250,
    consume = 0,
    allowArmed = true,
    server = {
        export = 'gs_policeshield.riot_shield',
    }
},
```

# qb-core
If you want to add the items to qb-core. You can use the following configuration for your shared/items.lua:
```lua
    ballistic_shield        = { name = 'ballistic_shield', label = 'Ballistic Shield', weight = 1000, type = 'item', image = 'ballistic_shield.png', unique = true, useable = true, shouldClose = true, description = 'A ballistic shield' },
    riot_shield             = { name = 'riot_shield', label = 'Riot Shield', weight = 1000, type = 'item', image = 'riot_shield.png', unique = true, useable = true, shouldClose = true, description = 'A riot shield' },
```

# Item image
An image for the ballistic_shield is provided with the files, we do not have a seperate image for the riot_shield.