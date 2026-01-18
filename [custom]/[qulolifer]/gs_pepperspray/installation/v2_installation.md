# Read readme.md first!

# Important for adding the addon-weapon
If you are not running an inventory system, and have access to the GTA-5 weapon wheel using TAB, then the pepperspray should work out of the box without any changes. The pepperspray will not have a weapon wheel icon, but you can still select it in the top-left corner (the throwables part of the weapon wheel).
If you are using an inventory system, you will most likely have to add the addon-weapon to the inventory system. Below is the information for adding the weapon to ESX/QB/OX.

### ESX ###
For ESX, add the following line in *es_extended\shared\config\weapons.lua* (or *es_extended/config.weapons.lua* for older versions)
```lua
{ name = "WEAPON_PEPPERSPRAY", label = 'Pepper Spray', components = {}, ammo = { label = TranslateCap("ammo_charge"), hash = `AMMO_PEPPERSPRAY` } },
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

### OX INVENTORY ###
For ox-inventory, add the following to *ox_inventory/data/weapons.lua*:
```lua
['WEAPON_PEPPERSPRAY'] = {
	label = 'Pepperspray',
	weight = 500,
	durability = 0,
	ammoname = 'ammo-pepperspray', -- You do not need to add the ammo item, the pepperspray will have infinite ammo
},
```