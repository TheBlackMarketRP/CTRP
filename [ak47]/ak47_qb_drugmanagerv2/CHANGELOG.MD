## v1.1
- Fixed where required items of processing removes if you changes any setting
- Now you will see the available required items in the process menu.
### Replace:
- modules/collect/client/collect.lua
- modules/process/client/process.lua
- modules/process/server/process.lua

## v1.2
- Prop placement system added
### Add:
- modules/props/
- modules/creation/client/objectplacement.lua
- import sql from "INSTALL ME FIRST/sql for database/Update/v1.1 to v1.2.sql"
### Replace:
- locales/en.lua
- modules/_init/client/_init.lua
- modules/_init/server/_init.lua
- modules/creation/config.lua
- modules/creation/client/creation.lua

## v1.3
- Drug test kit added
## Add:
- new item to qb-core/shared/items.lua from "INSTALL ME FIRST/items/Update/v1.2 to v1.3.lua"
### Replace:
- locales/en.lua
- framework/server/qb.lua
- modules/usable/config.lua
- modules/usable/client/main.lua
- modules/usable/server/usable.lua

## v1.4
- usable nose inhale type fixed
### Replace:
- modules/usable/client/main.lua

## v1.5
- buyer npc will be removed after some time
### Replace:
- modules\npcsell\client\npcsell.lua

## v1.6
- sell anywhere option added for npc selling (Config.SellAnyWhere)
- you can now set default npc sell setting and items in modules/npcsell/config.lua
### Replace:
- modules/creation/client/creation.lua
- modules/npcsell/client/npcsell.lua
- modules/npcsell/server/npcsell.lua
- modules/npcsell/config.lua

## v1.7
- possible fix for empty item list
### Replace:
- modules/init/server/init.lua

## v1.8
- possible fix for process minigame fail bug
### Replace:
- modules/process/client/process.lua

## v1.9
- health not adding with drug effect fixed
### Replace:
- modules/usable/client/bong.lua
- modules/usable/client/drink.lua
- modules/usable/client/inhale.lua
- modules/usable/client/inject.lua
- modules/usable/client/pill.lua
- modules/usable/client/smoke.lua

## v2.0
- reduce addiction with saline from ambulancejob added
### Replace:
- modules/usable/client/health.lua

## v2.1
- remove invalid models from menu to prevent model loading error
### Replace:
- modules/creation/client/objectplacement.lua

## v2.2
- instant usable drug effects added (Config.InstantEffect)
### Replace:
- modules/usable/config.lua
- modules/usable/client/functions.lua

## v2.3
- freeze player if minigame fails fixed
### Replace:
- modules/process/client/process.lua

## v2.4
- adjust blip size with slider
### Replace:
- modules/blips/client/blips.lua