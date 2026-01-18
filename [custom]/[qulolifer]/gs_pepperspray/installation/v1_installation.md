# Read readme.md first!

# Important for adding the addon-weapon
If you are not running an inventory system, and have access to the GTA-5 weapon wheel using TAB, then the pepperspray should work out of the box without any changes. The pepperspray will not have a weapon wheel icon, but you can still select it in the top-left corner (the throwables part of the weapon wheel).
If you are using an inventory system, you will most likely have to add the addon-weapon to the inventory system. Below is the information for adding the weapon to ESX/QB/OX.

### ESX ###
For ESX, add the following line in *es_extended\shared\config\weapons.lua* (or *es_extended/config.weapons.lua* for older versions)
```lua
{ name = "WEAPON_PEPPERSPRAY", label = 'Pepper Spray', components = {}, ammo = { label = TranslateCap("ammo_charge"), hash = `AMMO_FIREEXTINGUISHER` } },
```

### QB-CORE ###
For qb-core, first go to *qb-core/shared/items.lua* and add this line to the item list:
```lua
    weapon_pepperspray = { name = 'weapon_pepperspray', label = 'Pepper Spray', weight = 500, type = 'weapon', ammotype = nil, image = 'weapon_pepperspray.png', unique = true, useable = false, description = 'Pepper Spray' },
```
Then go to *qb-core/shared/weapons.lua* and add this line to the weapons list:
```lua
	[`weapon_pepperspray`] = { name = 'weapon_pepperspray', label = 'Pepper Spray', weapontype = 'Miscellaneous', ammotype = nil, damagereason = 'Died' },
```
Then go to *qb-weapons/config.lua*, in the Config.DurabilityBlockedWeapons list and add 'weapon_pepperspray' (if you want the pepperspray to not lose durability)
Finally go to *qb-weapons/client/main.lua*, line 149. Originally it will look like this:
```lua
if weaponName == 'weapon_petrolcan' or weaponName == 'weapon_fireextinguisher' then
    ammo = 4000
end
```
You can change this to
```lua
if weaponName == 'weapon_petrolcan' or weaponName == 'weapon_fireextinguisher' or weaponName == 'weapon_pepperspray' then
    ammo = 4000
end
```

### OX INVENTORY ###
For ox-inventory, add the following to *ox_inventory/data/weapons.lua*:
```lua
['WEAPON_PEPPERSPRAY'] = {
    label = 'Pepperspray',
    weight = 500,
    durability = 0,
},
``` 

Note that ox-inventory uses seperate ammo. You should give the pepperspray weapon infinite ammo by changing the following (using ammo-items is known to work problematic, so not recommended):
- Go to *ox-inventory/modules/items/server.lua --- line 188*:
Originally it will look like this:
```lua
if item.hash == `WEAPON_PETROLCAN` or item.hash == `WEAPON_HAZARDCAN` or item.hash == `WEAPON_FERTILIZERCAN` or item.hash == `WEAPON_FIREEXTINGUISHER` then
    metadata.ammo = metadata.durability
end
``` 
You can change this to 
```lua
if item.hash == `WEAPON_PETROLCAN` or item.hash == `WEAPON_HAZARDCAN` or item.hash == `WEAPON_FERTILIZERCAN` or item.hash == `WEAPON_FIREEXTINGUISHER` or item.hash == `WEAPON_PEPPERSPRAY` then
    metadata.ammo = metadata.durability
end
```

- Additionally, you will need to go to *ox_inventory/modules/inventory/server.lua -- line 2548*:
Originally it will look like this:
```lua
if item.hash == `WEAPON_FIREEXTINGUISHER` or item.hash == `WEAPON_PETROLCAN` or item.hash == `WEAPON_HAZARDCAN` or item.hash == `WEAPON_FERTILIZERCAN` then
```
You can change this to:
```lua
if item.hash == `WEAPON_FIREEXTINGUISHER` or item.hash == `WEAPON_PETROLCAN` or item.hash == `WEAPON_HAZARDCAN` or item.hash == `WEAPON_FERTILIZERCAN` or item.hash == `WEAPON_PEPPERSPRAY` then
```
So we are basically using the durability of the weapon as ammo, if you set *durability = 0* in the weapon config, then the weapon will have infinite ammo.