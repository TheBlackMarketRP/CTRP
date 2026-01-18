local QBCore = exports['qb-core']:GetCoreObject()

------------------------------------------ Functions -------------------------------------------------

local function save_info(Player, item, ID)
     if Player.PlayerData.items[item.slot] then
          local metadata = {ID = ID}
          Player.Functions.RemoveItem(item, 1, item.slot)
          Player.Functions.AddItem(item, 1, item.slot, metadata)
     end     
end

local function save_password(Player, item, password)
     if Player.PlayerData.items[item.slot] then
          Player.PlayerData.items[item.slot].metadata.password = password
     end
     Player.Functions.SetInventory(Player.PlayerData.items, true)
end

local function get_backpack(Player, ID)
     for key, value in pairs(Config.items) do
          local tmp = Player.Functions.GetItemsByName(key)
          for k, item in pairs(tmp) do
               if item.metadata.ID == ID then
                    return {
                         item = item,
                         setting = value
                    }
               end
          end
     end
     return
end

local function SaveStashItems(stashId, items)
     if stashId and items then
          for slot, item in pairs(items) do
               item.description = nil
          end
          MySQL.Async.insert('INSERT INTO stashitems (stash, items) VALUES (:stash, :items) ON DUPLICATE KEY UPDATE items = :items'
               , {
               ['stash'] = stashId,
               ['items'] = json.encode(items)
          })
     end
end

local function isBackPack(item)
     for item_name, _ in pairs(Config.items) do
          if item.name == item_name then
               return true
          end
     end
     return false
end

local function isBlacklisted(item)
     if not Config.Blacklist_items.active then return false end
     for _, item_name in pairs(Config.Blacklist_items.list) do
          if item.name == item_name then
               return true
          end
     end
     return false
end

local function getNonBackpackItems(source, items)
     local Player = QBCore.Functions.GetPlayer(source)
     local non_bacpack_items = {}
     for key, item in pairs(items) do
          local is_B_Pack = isBackPack(item)
          local is_B_Listed = isBlacklisted(item)
          if is_B_Pack or is_B_Listed then
               Player.Functions.AddItem(item.name, item.amount, nil, item.metadata)
               if is_B_Pack then
                    TriggerClientEvent('QBCore:Notify', source, "You can not have a backpack in another backpack!",
                         "error")
               end
               if is_B_Listed then
                    TriggerClientEvent('QBCore:Notify', source, "You can not put this item inside your backpack!",
                         "error")
               end
          else
               non_bacpack_items[#non_bacpack_items + 1] = item
          end
     end
     return non_bacpack_items
end

RegisterNetEvent('pdrp-backpack:server:openbackpack', function(name, metadata)
     local Locked = metadata.setting.rolelock
     if Locked then 
          local HasRole = RoleCheck(source, metadata.setting.role)
          if not HasRole then TriggerClientEvent('QBCore:Notify', source, "Not allowed!") return end
     end
     exports.ox_inventory:RegisterStash(name, "BackPack " .. name, metadata.setting.slots, metadata.setting.size)
     TriggerClientEvent("pdrp-backpack:client:triggeropen", source, name)
end)

RegisterNetEvent('pdrp-backpack:server:saveBackpack', function(source, stashId, items, cb)
     local non_bacpack_items = getNonBackpackItems(source, items)
     SaveStashItems(stashId, non_bacpack_items)
     cb(true)
end)

------------------------------------------ create items -------------------------------------------------

local function isOnHotbar(slot)
     for _, _slot in pairs(Config.Hotbar) do
          if slot == _slot then
               return true
          end
     end
     return false
end

for item_name, value in pairs(Config.items) do
     QBCore.Functions.CreateUseableItem(item_name, function(source, item)
          local Player = QBCore.Functions.GetPlayer(source)
          if not Player then return end
          local metadata = {}
          if item.metadata == '' or (type(item.metadata) == "table" and item.metadata.ID == nil) then
               metadata.ID = RandomID(10)
               save_info(Player, item, metadata.ID)
               if value.locked then
                    TriggerClientEvent('pdrp-backpack:client:create_password', source, metadata.ID)
               end
               return
          end
          metadata.ID = item.metadata.ID
          metadata.source = source
          metadata.password = nil
          metadata.item = item
          metadata.locked = value.locked or false

          if isOnHotbar(item.slot) then
               -- fix to create blank password
               if item.metadata.password == nil or item.metadata.password == '' then
                    if value.locked then
                         TriggerClientEvent('pdrp-backpack:client:create_password', source, metadata.ID)
                         return
                    end
               end
               -- fix end
               TriggerClientEvent('pdrp-backpack:client:enter_password', source, metadata)
          else
               TriggerClientEvent('QBCore:Notify', source, 'Backpack is not on your hand!', "error")
          end
     end)
end

--- lockpick
local function pickable()
     local tmp = {}
     for key, value in pairs(Config.items) do
          if value.locked then
               tmp[#tmp + 1] = key
          end
     end
     return tmp
end

local function isWhitelisted(Player)
     if not Config.whitelist.lockpick.active then return true end
     local cid = Player.PlayerData.citizenid
     local jobname = Player.PlayerData.job.name

     for key, w_cid in pairs(Config.whitelist.lockpick.citizenid) do
          if w_cid == cid then
               return true
          end
     end

     for key, w_job in pairs(Config.whitelist.lockpick.jobs) do
          if w_job == jobname then
               return true
          end
     end
     return false
end


local function isWhitelistedOpen(Player)
     if not Config.whitelist.useperm.active then return true end
     local cid = Player.PlayerData.citizenid
     local jobname = Player.PlayerData.job.name

     for key, w_job in pairs(Config.whitelist.useperm.jobs) do
          if w_job == jobname then
               return true
          else
               return false
          end
     end
end

function RoleCheck(source, role)
     local Role = nil
     local HasRole = exports.zdiscord:isRolePresent(source, role);
     if HasRole then
          Role = true
     end
     return Role
end



QBCore.Functions.CreateUseableItem('briefcaselockpicker', function(source, item)
     local Player = QBCore.Functions.GetPlayer(source)
     if not Player then return end
     if not isWhitelisted(Player) then
          TriggerClientEvent('QBCore:Notify', source, 'You can not use this item!', "error")
          return
     end
     local picables = pickable()
     for _, name in pairs(picables) do
          local _item = Player.Functions.GetItemByName(name)
          local metadata = {}
          metadata.ID = _item.metadata.ID
          metadata.source = source
          metadata.password = nil
          metadata.locked = true
          TriggerClientEvent('pdrp-backpack:client:lockpick', source, metadata)
          Player.Functions.RemoveItem('briefcaselockpicker', 1)
          TriggerClientEvent('pdrp-inventory:client:ItemBox', source, QBCore.Shared.Items['briefcaselockpicker'], "remove")
          return
     end
end)

RegisterNetEvent('pdrp-backpack:server:add_password', function(data)
     local Player = QBCore.Functions.GetPlayer(source)
     local backpack = get_backpack(Player, data.ID)
     if backpack then
          save_password(Player, backpack.item, data.password)
          TriggerClientEvent('QBCore:Notify', source, 'Added password', "success")
          return
     else
          TriggerClientEvent('QBCore:Notify', source, 'Failed to add password', "error")
     end
end)

RegisterNetEvent('pdrp-backpack:server:open_backpack', function(backpack_metadata, lockpick)
     local Player = QBCore.Functions.GetPlayer(backpack_metadata.source)
     local backpack = get_backpack(Player, backpack_metadata.ID)
     local safe_data = {
          ID = backpack.item.metadata.ID,
          setting = backpack.setting
     }

     if not backpack_metadata.locked then
          TriggerClientEvent('pdrp-backpack:client:open', backpack_metadata.source, safe_data)
          return
     end

     if (backpack.item.metadata.password == backpack_metadata.password) or lockpick then
          TriggerClientEvent('pdrp-backpack:client:open', backpack_metadata.source, safe_data)
          return
     else
          TriggerClientEvent('QBCore:Notify', backpack_metadata.source, 'Wrong password', "error")
          return
     end
end)
