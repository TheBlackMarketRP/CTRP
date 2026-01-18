local personalStashRegistered = {}

local funcTable = {
	["Stash"] = function(id, data, loc, target, coords)
		return openStash({
			job = loc.job,
			gang = loc.gang,
			stash = target.stashName,
			label = target.stashLabel..(loc.StashCraft == target.stashName and "*" or ""),
			coords = coords.xyz,
			maxWeight = target.maxWeight or 400000,
			slots = target.slots or 10
		})
	end,

	["Shop"] = function(id, data, loc, target, coords)
		return openShop({
			job = loc.job,
			gang = loc.gang,
			shop = target.shopName,
			items = target.items,
			coords = coords.xyz
		})
	end,

	["Dispenser"] = function(id, data, loc, target, coords)
		return mainFunction.dispenserMenu({
			job = loc.job,
			gang = loc.gang,
			menu = target.Menu or target.menu,
			coords = coords.xyz,
			stash = target.stash,
			label = target.label
		})
	end,

	["Crafting"] = function(id, data, loc, target, coords)
		if not target.craftable.Header then
			-- Assume it's multiple crafting tables
			-- Build menu table
			local craftMenu = {}
			for i = 1, #target.craftable do
				local table = target.craftable[i]
				craftMenu[#craftMenu+1] = {
					header = table.Header,
					txt = countTable(table.Recipes).." Items",
					icon = target.icon,
					onSelect = function()
						craftingMenu({
							job = loc.job,
							gang = loc.gang,
							craftable = table,
							coords = coords.xyz,
							stashName = stashCraft,
							onBack = function()
								openMenu(craftMenu, { header = target.label })
							end,
						})
					end,
				}
			end
			return openMenu(craftMenu, { header = target.label })
		end
		-- If not multple, just open default crafting menu
		return craftingMenu({
			job = loc.job,
			gang = loc.gang,
			craftable = target.craftable,
			coords = coords.xyz,
			stashName = stashCraft
		})
	end,

	["PublicStash"] = function(id, data, loc, target, coords)
		openStash({
			stash = target.stashName,
			label = target.stashLabel,
			coords = coords.xyz,
			maxWeight = target.maxWeight or 400000,
			slots = target.slots or 10
		})
		if target.prop then

			debugPrint("^6Debug^7: ^2Waiting for inventory to close^1")
			Wait(1000)

			while isInventoryOpen() do
				Wait(10)
			end -- Wait for inventory to close
			debugPrint("^6Debug^7: ^2Inventory Closed^7, ^2getting stash info^7")

			local tempStashInfo = triggerCallback(getScript()..':server:GetStashItems', target.stashName)

			if countTable(tempStashInfo) > 0 then
				debugPrint("^6Debug^7: ^2Stash not empty^7, ^2Asking server to ^3add ^2Stash Prop Indicator^1")
				TriggerServerEvent(getScript()..":server:StashPropHandle", target, data, false)

			else
				debugPrint("^6Debug^7: ^2Stash empty^7, ^2Asking server to ^3remove ^2Stash Prop Indicator")
				TriggerServerEvent(getScript()..":server:StashPropHandle", target, data, true)

			end
		end
	end,

	["TrashStash"] = function(id, data, loc, target, coords)
		return openStash({
			stash = target.stashName,
			label = target.stashLabel,
			coords = coords.xyz,
			maxWeight = target.maxWeight or 400000,
			slots = target.slots or 10
		})
	end,

	["BossStash"] = function(id, data, loc, target, coords)
		return openStash({
			stash = target.stashName,
			label = target.stashLabel,
			coords = coords.xyz,
			maxWeight = target.maxWeight or 400000,
			slots = target.slots or 10
		})
	end,

	["Payments"] = function(id, data, loc, target, coords)
		return billPlayer({
			job = loc.job,
			gang = loc.gang,
			coords = coords.xyz,
			img = loc.logo
		})
	end,

	["Clockin"] = function(id, data, loc, target, coords)
		return toggleDuty()
	end,

	["BossMenus"] = function(id, data, loc, target, coords)
		return openBossMenu(
			loc.gang and true or false,
			loc.job or loc.gang
		)
	end,

	["WashHands"] = function(id, data, loc, target, coords)
		return washHands({
			coords = coords
		})
	end,

	["Toilets"] = function(id, data, loc, target, coords)
		return useToilet({
			sitcoords = vec4(coords.x, coords.y, coords.z+0.5, coords.w),
			urinal = target.urinal
		})
	end,

	["Doors"] = function(id, data, loc, target, coords)
		return useDoor({
			telecoords = target.telecoords
		})
	end,

	["Box"] = function(id, data, loc, target, coords)
		return mainFunction.GrabBox(target)
	end,

	["PersonalStash"] = function(id, data, loc, target, coords)
		local citizenId = getPlayer().citizenId
--
		if not personalStashRegistered[target.stashName..citizenId] then -- if the stash hasn't been registered, do that now
			currentToken = triggerCallback(AuthEvent)
			Wait(100)
			TriggerServerEvent(getScript()..":server:makeOXStash",
				target.stashName .. citizenId,
				"Personal Storage ("..target.stashName .. citizenId..")",
				target.slots or 10,
				target.maxWeight or 400000,
				citizenId,
				target.prop and target.prop.coords.xyz or target.coords,
				currentToken
			)
			currentToken = nil
			personalStashRegistered[target.stashName..citizenId] = true
		end
		return openStash({
			stash = target.stashName..citizenId,
			label = "Personal Storage ("..target.stashName .. citizenId..")",
			coords = coords.xyz,
			maxWeight = target.maxWeight or 400000,
			slots = target.slots or 10
		})
	end,

	["Outfit"] = function(id, data, loc, target, coords)
		return openClothing()
	end,

	["Chairs"] = function(id, data, loc, target, coords)
		return mainFunction.SitChair({
			loc = coords,
			stand = target.stand
		})
	end,

	["Menu"] = function(id, data, loc, target, coords)
		return exports["jim-imagedisplay"]:showJobMenu(id.."_"..(loc.job or loc.gang))
	end,

	["Poles"] = function(id, data, loc, target, coords)
		return PoleDance({
			loc = target.coords,
			pole = math.random(1, 3)
		})
	end,

	["DanceTables"] = function(id, data, loc, target, coords)
		return mainFunction.TableDance({
			loc = target.coords
		})
	end,

	["Strippers"] = function(id, data, loc, target, coords)
		return mainFunction.PayStrep({
			ped = data,
			job = loc.job,
		})
	end,

	["DuiSign"] = function(id, data, loc, target, coords)
		return DuiSelect({
			name = id,
			texn = target["tex"].texn,
			texd = target["tex"].texd,
			size = target["tex"].size,
			url = target.url
		})
	end,
}

-- Func types that require a boss role
local bossRoleInclude = {
	["BossMenus"] = true,
	["BossStash"] = true,
	["DuiSign"] = true,
}

-- Func types that DON'T require a job
local jobRoleExclude = {
	["Toilets"] = true,
	["WashHands"] = true,
	["PublicStash"] = true,
	["Chairs"] = true,
	["Menu"] = true,
	["Poles"] = true,
	["Strippers"] = true,
	["DanceTables"] = true,
}

function createTarget(funcType, targets, id, loc, bossroles, stashCraft)
	if not targets or not targets[1] then return end
	for i, target in ipairs(targets) do
		local name = getScript()..":"..id..":"..funcType.."["..i.."]"
		if funcType == "Poles" then
			local prop = makeProp({
				prop = "prop_strip_pole_01",
				coords = target.coords - vec4(0.00, 0.29, 0.40, 0) },
				1, 0
			)
			SetEntityAlpha(prop, 0)
			DisableCamCollisionForEntity(prop)
		end

		if funcType == "Strippers" then
			local rand = math.random(1,3)
			local randped = math.random(1,2)
			makePed("CSB_Stripper_0"..randped, target.coords, true, true, nil, { "mini@strip_club@private_dance@part"..rand, "priv_dance_p"..rand })
			target.coords -= vec4(0,0, 1.0, 0)
		end

		local coords = target.prop and target.prop.coords or target.coords

		local options = { {
			action = function(data)
				funcTable[funcType](id, data, loc, target, coords)
			end,
			icon = target.icon or (funcType == "DuiSign" and "fas fa-circle-check" or "fas fa-chair"),
			label = (target.label or funcType == "DuiSign" and locale("targetinfo", "duiAdd") or (((funcType == "Poles" or funcType == "DanceTables") and locale("targetinfo", "dance")) or locale("targetinfo", "sit")))..(debugMode and " ["..name.."]" or "")..((loc.StashCraft and loc.StashCraft == target.stashName) and "*" or ""),
			job = (bossRoleInclude[funcType] and bossroles) or (not jobRoleExclude[funcType] and loc.job or nil),
			gang = (bossRoleInclude[funcType] and bossroles) or (not jobRoleExclude[funcType] and loc.gang or nil),
		}, }
		-- extra conditonal options
		if funcType == "Payments" then
            if Config.General.showClockInTill and not loc.gang then
                options[#options+1] = {
					action = function()
						funcTable["Clockin"](id, data, loc, target, coords)
					end,
					job = loc.job,
					gang = loc.gang,
					icon = "fas fa-user-check",
					label = locale("targetinfo", "duty")..(debugMode and " ["..name.."]" or ""),
				}
            end
            if Config.General.showBossMenuTill then
                options[#options+1] = {
					action = function()
						funcTable["BossMenus"](id, _, loc, target, coords)
					end,
					job = loc.job and bossroles or nil,
					gang = loc.gang and bossroles or nil,
					icon = "fas fa-list",
					label = locale("targetinfo", "open_bossmenu")..(debugMode == true and " ["..name.."]" or ""),
				}
            end
		elseif funcType == "Menu" then
			options[#options+1] = {
				action = function()
					funcTable["Menu"](id, _, loc, target, coords)
				end,
				job = loc.job and bossroles,
				gang = loc.gang and bossroles,
				icon = "fas fa-file-circle-plus",
				label = "Add Food Menu Image"..(loc.debug and " ["..name.."]" or ""),
			}

        elseif funcType == "PersonalStash" then
            options[#options+1] = {
				action = function()
					funcTable["PersonalStash"](id, _, loc, target, coords)
				end,
				job = loc.job,
				gang = loc.gang,
				icon = "fas fa-tshirt",
				label = locale("targetinfo", "open_wardrobe")..(debugMode and " ["..name.."]" or ""),
			}
		elseif funcType == "BossMenus" then
			if Locations[id].Menu then
				options[#options+1] = {
					action = function()
						exports["jim-imagedisplay"]:addJobMenuLink(id.."_"..(loc.job or loc.gang))
					end,
					job = loc.job and bossroles,
					gang = loc.gang and bossroles,
					icon = "fas fa-file-circle-plus",
					label = "Add Food Menu Image"..(loc.debug and " ["..name.."]" or ""),
				}
			end

		elseif funcType == "DuiSign" then
			options[#options+1] = {
				action = function()
					TriggerServerEvent(getScript()..":Server:ChangeDUI", {
						name = id,
						texn = target["tex"].texn,
						texd = target["tex"].texd,
						size = target["tex"].size,
						url = target.preset
					})
				end,
				icon = "fas fa-circle-minus",
				label = locale("targetinfo", "duiReset"),
				job = loc.job,
				gang = loc.gang
			}
			options[#options+1] = {
				action = function()
					TriggerServerEvent(getScript()..":Server:ClearDUI", {
						name = id,
						texn = target["tex"].texn,
						texd = target["tex"].texd,
						url = "-"
					})
				end,
				icon = "fas fa-circle-xmark",
				label = locale("targetinfo", "duiClear"),
				job = loc.job,
				gang = loc.gang
			}
		end
		-- create target
		if target.prop then -- If spawning a prop, make entity target instead (ignores depth and width stuff)
			createPropTarget({
				name,
				target.prop.coords,
				target.prop.model,
			}, options, 2.0)

		else
			createBoxTarget({
				name,
				vec3(coords.x, coords.y, coords.z - ((funcType == "Chairs" or funcType == "Poles") and 1.03 or 0.0)),
				target.width or 0.6,
				target.depth or 0.6,
				{
					name = name,
					heading = coords.w,
					debugPoly = debugMode,
					minZ = target.minZ or (coords.z - ((funcType == "Chairs" or funcType == "Poles") and 1.04 or 0.5)),
					maxZ = target.maxZ or ((coords.z - ((funcType == "Chairs" or funcType == "Poles") and 1.04 or 0.0)) + 1)
				}}, options, 2.0)
		end
	end
end