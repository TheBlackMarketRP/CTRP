If you have an inventory system (esx-inventory, qb-inventory or ox-inventory) you can add the item in the corresponding item.lua list.

For ox-inventory for instance, you add the following to ox-inventory/data/items.lua:
```
	['wheel_clamp'] = {
        label = 'Wheel Clamp',
        weight = 1000,
    },
```

For the lockpick, it is the exact same but change the name to 'lockpick'.