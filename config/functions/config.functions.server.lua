-- ████╗   ██╗   ██████╗   ██████╗  ██████╗ ██╗  ██╗ ██████╗ ██╗     █████╗  ██████╗  ██████╗ ██████╗    ██╗ --
-- ██╔██╗  ██║ ██╔═════╝   ██╔══██╗ ██╔═══╝ ██║  ██║ ██╔═══╝ ██║    ██╔══██╗ ██╔══██╗ ██╔═══╝ ██╔══██╗   ██║ --
-- ██║╚██╗ ██║ ██║         ██║  ██║ █████╗  ██║  ██║ █████╗  ██║    ██║  ██║ ██████╔╝ █████╗  ██████╔╝   ██║ --
-- ██║ ╚██╗██║ ██║         ██║  ██║ ██╔══╝  ╚██╗██╔╝ ██╔══╝  ██║    ██║  ██║ ██╔═══╝  ██╔══╝  ██╔══██╗   ╚═╝ --
-- ██║  ╚████║ ╚═██████╗   ██████╔╝ ██████╗  ╚███╔╝  ██████╗ ██████╗╚█████╔╝ ██║      ██████╗ ██║  ██║   ██╗ --
-- ╚═╝   ╚═══╝   ╚═════╝   ╚═════╝  ╚═════╝   ╚══╝   ╚═════╝ ╚═════╝ ╚════╝  ╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝ --

---------------------------------------------------
------------------- Server Side -------------------
---------------------------------------------------

-- Function นี้จะถูกเรียกใช้งานเมื่อมีการโหลดข้อมูลครั้งแรก (ในฝั่ง Server)
Config.ServerOnFirstLoaded = function()

end

-- Function นี้จะถูกเรียกใช้งานเมื่อผู้เล่นใช้งานกุญแจต่างๆ
-- กุญแจยานพาหนะจะมี itemName เป็นเลขทะเบียน และ itemType เป็น 'vehicle_key'
-- กุญแจบ้านจะมี itemName เป็น id และ itemType เป็น 'house_key'
Config.ServerUseKey = function(xPlayer, itemName, itemType)
	if itemType == 'vehicle_key' then

	elseif itemType == 'house_key' then

	end
end

-- Function นี้จะถูกเรียกใช้งานก่อนผู้เล่นทิ้งสิ่งของ
-- itemType ที่ส่งมาจะเป็น account|item|weapon|key|accessory
Config.ServerWillDropItem = function(xPlayer, itemName, itemCount, itemType, optionType)
	return true				-- return true เมื่อต้องการให้ทิ้งสิ่งของ
end

-- Function นี้จะถูกเรียกใช้งานเมื่อผู้เล่นทิ้งของสำเร็จ
-- itemType ที่ส่งมาจะเป็น account|item|weapon|key|accessory
Config.ServerDroppedItem = function(xPlayer, itemName, itemCount, itemType, optionType)
	if itemType == 'item' then
		pcall(function()
			exports['azael_dc-serverlogs']:insertData({
				event = 'NC_RemoveItem',
				content = ('ทิ้ง %s จำนวน %s'):format(ESX.GetItemLabel(itemName), itemCount),
				source = xPlayer.source,
				color = 1,
				options = {
					important = (itemCount >= 500 and true)
				}
			})
		end)
	elseif itemType == 'account' then
		pcall(function()
			exports['azael_dc-serverlogs']:insertData({
				event = (itemName == 'money' and 'NC_RemoveMoney' or 'NC_RemoveDirtyMoney'),
				content = ('ทิ้ง %s จำนวน $%s'):format((ESX.GetConfig().Accounts[itemName].label or ESX.GetConfig().Accounts[itemName]), ESX.Math.GroupDigits(itemCount)),
				source = xPlayer.source,
				color = 1,
				options = {
					important = (itemCount >= 100000 and true)
				}
			})
		end)
	elseif itemType == 'weapon' then
		pcall(function()
			exports['azael_dc-serverlogs']:insertData({
				event = 'NC_RemoveWeapon',
				content = ('ทิ้ง %s และ กระสุน จำนวน %s'):format(ESX.GetWeaponLabel(itemName), itemCount),
				source = xPlayer.source,
				color = 1
			})
		end)
	elseif itemType == 'accessory' then
		pcall(function()
			exports['azael_dc-serverlogs']:insertData({
				event = 'NC_RemoveAccessory',
				content = ('ทิ้ง %s'):format(itemName),
				source = xPlayer.source,
				color = 1
			})
		end)
	elseif itemType == 'vehicle_key' then
		pcall(function()
			exports['azael_dc-serverlogs']:insertData({
				event = 'NC_RemoveKeyCar',
				content = ('ทิ้ง กุญแจยานพาหนะ ทะเบียน %s'):format(itemName),
				source = xPlayer.source,
				color = 1
			})
		end)
	elseif itemType == 'house_key' then
		pcall(function()
			exports['azael_dc-serverlogs']:insertData({
				event = 'NC_RemoveKeyHouse',
				content = ('ทิ้ง กุญแจบ้าน %s'):format(itemName),
				source = xPlayer.source,
				color = 1
			})
		end)
	end
end

-- Function นี้จะถูกเรียกใช้งานก่อนผู้เล่นมอบสิ่งของ
-- itemType ที่ส่งมาจะเป็น account|item|weapon|key|accessory
Config.ServerWillGiveItem = function(xPlayer, xTarget, itemName, itemCount, itemType, optionType)
	return true				-- return true เมื่อต้องการให้มอบสิ่งของ
end

-- Function นี้จะถูกเรียกใช้งานเมื่อผู้เล่นมอบของสำเร็จ
-- itemType ที่ส่งมาจะเป็น account|item|weapon|key|accessory
Config.ServerGaveItem = function(xPlayer, xTarget, itemName, itemCount, itemType, optionType)
	if itemType == 'item' then
		local label = ESX.GetItemLabel(itemName)
	
		pcall(function()
			exports['azael_dc-serverlogs']:insertData({
				event = 'NC_GiveItem',
				content = ('ส่ง %s จำนวน %s ให้กับ %s'):format(label, itemCount, xTarget.name),
				source = xPlayer.source,
				color = 1,
				options = {
					important = (itemCount >= 500 and true)
				}
			})
	
			exports['azael_dc-serverlogs']:insertData({
				event = 'NC_GiveItem',
				content = ('ได้รับ %s จำนวน %s จาก %s'):format(label, itemCount, xPlayer.name),
				source = xTarget.source,
				color = 2,
				options = {
					important = (itemCount >= 500 and true)
				}
			})
		end)
	elseif itemType == 'account' then
		local label = (ESX.GetConfig().Accounts[itemName].label or ESX.GetConfig().Accounts[itemName])
		local count = ESX.Math.GroupDigits(itemCount)
	
		pcall(function()
			local eventName = (itemName == 'money' and 'NC_GiveMoney' or 'NC_GiveDirtyMoney')
		
			exports['azael_dc-serverlogs']:insertData({
				event = eventName,
				content = ('ส่ง %s จำนวน $%s ให้กับ %s'):format(label, count, xTarget.name),
				source = xPlayer.source,
				color = 1,
				options = {
					important = (itemCount >= 100000 and true)
				}
			})
		
			exports['azael_dc-serverlogs']:insertData({
				event = eventName,
				content = ('ได้รับ %s จำนวน $%s จาก %s'):format(label, count, xPlayer.name),
				source = xTarget.source,
				color = 2,
				options = {
					important = (itemCount >= 100000 and true)
				}
			})
		end)
	elseif itemType == 'weapon' then
		local label = ESX.GetWeaponLabel(itemName)
	
		pcall(function()
			exports['azael_dc-serverlogs']:insertData({
				event = 'NC_GiveWeapon',
				content = ('ส่ง %s และ กระสุน จำนวน %s ให้กับ %s'):format(label, itemCount, xTarget.name),
				source = xPlayer.source,
				color = 1
			})
		
			exports['azael_dc-serverlogs']:insertData({
				event = 'NC_GiveWeapon',
				content = ('ได้รับ %s และ กระสุน จำนวน %s จาก %s'):format(label, itemCount, xPlayer.name),
				source = xTarget.source,
				color = 2
			})
		end)
	elseif itemType == 'accessory' then
		pcall(function()
			exports['azael_dc-serverlogs']:insertData({
				event = 'NC_GiveAccessory',
				content = ('ส่ง %s ให้กับ %s'):format(itemName, xTarget.name),
				source = xPlayer.source,
				color = 1
			})
	
			exports['azael_dc-serverlogs']:insertData({
				event = 'NC_GiveAccessory',
				content = ('ได้รับ %s จาก %s'):format(itemName, xPlayer.name),
				source = xTarget.source,
				color = 2
			})
		end)
	elseif itemType == 'vehicle_key' then
		pcall(function()
			exports['azael_dc-serverlogs']:insertData({
				event = 'NC_GiveKeyCar',
				content = ('ส่ง กุญแจยานพาหนะ ทะเบียน %s ให้กับ %s'):format(itemName, xTarget.name),
				source = xPlayer.source,
				color = 1
			})
	
			exports['azael_dc-serverlogs']:insertData({
				event = 'NC_GiveKeyCar',
				content = ('ได้รับ กุญแจยานพาหนะ ทะเบียน %s จาก %s'):format(itemName, xPlayer.name),
				source = xTarget.source,
				color = 2
			})
		end)
	elseif itemType == 'house_key' then
		pcall(function()
			exports['azael_dc-serverlogs']:insertData({
				event = 'NC_GiveKeyHouse',
				content = ('ส่ง กุญแจบ้าน %s ให้กับ %s'):format(itemName, xTarget.name),
				source = xPlayer.source,
				color = 1
			})
	
			exports['azael_dc-serverlogs']:insertData({
				event = 'NC_GiveKeyHouse',
				content = ('ได้รับ กุญแจบ้าน %s จาก %s'):format(itemName, xPlayer.name),
				source = xTarget.source,
				color = 2
			})
		end)
	end
end

-- Function นี้จะถูกเรียกใช้งานก่อนเปลี่ยนแปลงข้อมูลผู้เล่นฝั่ง Server ขณะโยกย้ายสิ่งของระหว่างผู้เล่นอื่น
-- dragAction จะมี 2 ค่าคือ 'put' => ใส่ของเข้าตัวผู้เล่นท่านอื่น | 'take' => นำของออกจากตัวผู้เล่นท่านอื่น
-- itemType ที่ส่งมาจะเป็น account|item|weapon
-- หากต้องการชื่อ Job ที่ต้องการ ให้ใช้ xPlayer.job.name และตำแหน่งให้ใช้ xPlayer.job.grade_name
-- searchType คือชนิดของการค้นตัว exports.nc_inventory:SearchInventory() หากไม่ได้ใส่ค่าไว้ตอนเรียกใช้ จะมีค่าเป็น 'default'
Config.ServerWillSearchInventoryAction = function(xPlayer, xTarget, dragAction, itemName, itemCount, itemType, searchType)
	if itemType == 'item' then
		pcall(function()
			exports['azael_dc-serverlogs']:insertData({
				event = 'NC_VaultPutItemPolice',
				content = ('หน่วยงาน %s ฝาก %s จำนวน %s เข้าตู้นิรภัย (ยึดจาก %s)'):format(xPlayer.job.name, ESX.GetItemLabel(itemName), itemCount, xTarget.name),
				source = xPlayer.source,
				color = 2,
				options = {
					important = (itemCount >= 500 and true)
				}
			})
		end)
	elseif itemType == 'account' then
		pcall(function()
			exports['azael_dc-serverlogs']:insertData({
				event = 'NC_VaultPutMoneyPolice',
				content = ('หน่วยงาน %s ฝาก %s จำนวน %s เข้าตู้นิรภัย (ยึดจาก %s)'):format(xPlayer.job.name, (ESX.GetConfig().Accounts[itemName].label or ESX.GetConfig().Accounts[itemName]), ESX.Math.GroupDigits(itemCount), xTarget.name),
				source = xPlayer.source,
				color = 2,
				options = {
					important = (itemCount >= 100000 and true)
				}
			})
		end)
	end
	return true, true		-- return true, true เพื่ออนุญาตให้เปลี่ยนแปลงข้อมูล source, target * ค่าที่ return กลับไปจะมี 2 ตัวเสมอ (true: เปลี่ยนแปลง | false|nil: ไม่เปลี่ยนแปลง)
end

-- Function นี้จะถูกเรียกใช้งานเมื่อย้ายสิ่งระหว่างระหว่างผู้เล่นสำเร็จ
-- dragAction จะมี 2 ค่าคือ 'put' => ใส่ของเข้าตัวผู้เล่นท่านอื่น | 'take' => นำของออกจากตัวผู้เล่นท่านอื่น
-- itemType ที่ส่งมาจะเป็น account|item|weapon
-- หากต้องการชื่อ Job ที่ต้องการ ให้ใช้ xPlayer.job.name และตำแหน่งให้ใช้ xPlayer.job.grade_name
-- searchType คือชนิดของการค้นตัว หากไม่ได้ใส่ค่าไว้ตอนเรียกใช้ exports.nc_inventory:SearchInventory() จะมีค่าเป็น 'default'
Config.ServerSearchedInventoryAction = function(xPlayer, xTarget, dragAction, itemName, itemCount, itemType, searchType)
	if xPlayer.job.name == 'police' then -- ตำรวจ
		if dragAction == 'take' then -- ยึด
			if itemType == 'item' then
				local label = ESX.GetItemLabel(itemName)
				
				pcall(function()
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_PoliceTakeItem',
						content = ('หน่วยงาน %s ยึด %s จำนวน %s จาก %s'):format(xPlayer.job.name, label, itemCount, xTarget.name),
						source = xPlayer.source,
						color = 2,
						options = {
							important = (itemCount >= 500 and true)
						}
					})
	
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_PoliceTakeItem',
						content = ('ถูกยึด %s จำนวน %s โดย %s หน่วยงาน %s'):format(label, itemCount, xPlayer.name, xPlayer.job.name),
						source = xTarget.source,
						color = 3,
						options = {
							important = (itemCount >= 500 and true)
						}
					})
				end)
			elseif itemType == 'account' then
				local label = (ESX.GetConfig().Accounts[itemName].label or ESX.GetConfig().Accounts[itemName])
				local count = ESX.Math.GroupDigits(itemCount)
	
				pcall(function()
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_PoliceTakeMoney',
						content = ('หน่วยงาน %s ยึด %s จำนวน $%s จาก %s'):format(xPlayer.job.name, label, count, xTarget.name),
						source = xPlayer.source,
						color = 2,
						options = {
							important = (itemCount >= 100000 and true)
						}
					})
	
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_PoliceTakeMoney',
						content = ('ถูกยึด %s จำนวน $%s โดย %s หน่วยงาน %s'):format(label, count, xPlayer.name, xPlayer.job.name),
						source = xTarget.source,
						color = 3,
						options = {
							important = (itemCount >= 100000 and true)
						}
					})
				end)
			elseif itemType == 'weapon' then
				local label = ESX.GetWeaponLabel(itemName)
	
				pcall(function()
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_PoliceTakeWeapon',
						content = ('หน่วยงาน %s ยึด %s และ กระสุน จำนวน %s จาก %s'):format(xPlayer.job.name, label, itemCount, xTarget.name),
						source = xPlayer.source,
						color = 2
					})
	
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_PoliceTakeWeapon',
						content = ('ถูกยึด %s และ กระสุน จำนวน %s โดย %s หน่วยงาน %s'):format(label, itemCount, xPlayer.name, xPlayer.job.name),
						source = xTarget.source,
						color = 3
					})
				end)
			end
		elseif dragAction == 'put' then -- ยัด
			if itemType == 'item' then
				local label = ESX.GetItemLabel(itemName)
	
				pcall(function()
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_PolicePutItem',
						content = ('หน่วยงาน %s ยัด %s จำนวน %s ไปยัง %s'):format(xPlayer.job.name, label, itemCount, xTarget.name),
						source = xPlayer.source,
						color = 2,
						options = {
							important = (itemCount >= 500 and true)
						}
					})
	
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_PolicePutItem',
						content = ('ถูกยัด %s จำนวน %s โดย %s หน่วยงาน %s'):format(label, itemCount, xPlayer.name, xPlayer.job.name),
						source = xTarget.source,
						color = 3,
						options = {
							important = (itemCount >= 500 and true)
						}
					})
				end)
			elseif itemType == 'account' then
				local label = (ESX.GetConfig().Accounts[itemName].label or ESX.GetConfig().Accounts[itemName])
				local count = ESX.Math.GroupDigits(itemCount)
	
				pcall(function()
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_PolicePutMoney',
						content = ('หน่วยงาน %s ยัด %s จำนวน $%s ไปยัง %s'):format(xPlayer.job.name, label, count, xTarget.name),
						source = xPlayer.source,
						color = 2,
						options = {
							important = (itemCount >= 100000 and true)
						}
					})
	
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_PolicePutMoney',
						content = ('ถูกยัด %s จำนวน $%s โดย %s หน่วยงาน %s'):format(label, count, xPlayer.name, xPlayer.job.name),
						source = xTarget.source,
						color = 3,
						options = {
							important = (itemCount >= 100000 and true)
						}
					})
				end)
			elseif itemType == 'weapon' then
				local label = ESX.GetWeaponLabel(itemName)
	
				pcall(function()
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_PolicePutWeapon',
						content = ('หน่วยงาน %s ยัด %s และ กระสุน จำนวน %s ไปยัง %s'):format(xPlayer.job.name, label, itemCount, xTarget.name),
						source = xPlayer.source,
						color = 2
					})
	
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_PolicePutWeapon',
						content = ('ถูกยัด %s และ กระสุน จำนวน %s โดย %s หน่วยงาน %s'):format(label, itemCount, xPlayer.name, xPlayer.job.name),
						source = xTarget.source,
						color = 3
					})
				end)
			end
		end
	elseif xPlayer.job.name == 'council' then -- สภา
		if dragAction == 'take' then -- ยึด
			if itemType == 'item' then
				local label = ESX.GetItemLabel(itemName)
				
				pcall(function()
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CouncilTakeItem',
						content = ('หน่วยงาน %s ยึด %s จำนวน %s จาก %s'):format(xPlayer.job.name, label, itemCount, xTarget.name),
						source = xPlayer.source,
						color = 2,
						options = {
							important = (itemCount >= 500 and true)
						}
					})
	
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CouncilTakeItem',
						content = ('ถูกยึด %s จำนวน %s โดย %s หน่วยงาน %s'):format(label, itemCount, xPlayer.name, xPlayer.job.name),
						source = xTarget.source,
						color = 3,
						options = {
							important = (itemCount >= 500 and true)
						}
					})
				end)
			elseif itemType == 'account' then
				local label = (ESX.GetConfig().Accounts[itemName].label or ESX.GetConfig().Accounts[itemName])
				local count = ESX.Math.GroupDigits(itemCount)
	
				pcall(function()
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CouncilTakeMoney',
						content = ('หน่วยงาน %s ยึด %s จำนวน $%s จาก %s'):format(xPlayer.job.name, label, count, xTarget.name),
						source = xPlayer.source,
						color = 2,
						options = {
							important = (itemCount >= 100000 and true)
						}
					})
	
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CouncilTakeMoney',
						content = ('ถูกยึด %s จำนวน $%s โดย %s หน่วยงาน %s'):format(label, count, xPlayer.name, xPlayer.job.name),
						source = xTarget.source,
						color = 3,
						options = {
							important = (itemCount >= 100000 and true)
						}
					})
				end)
			elseif itemType == 'weapon' then
				local label = ESX.GetWeaponLabel(itemName)
	
				pcall(function()
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CouncilTakeWeapon',
						content = ('หน่วยงาน %s ยึด %s และ กระสุน จำนวน %s จาก %s'):format(xPlayer.job.name, label, itemCount, xTarget.name),
						source = xPlayer.source,
						color = 2
					})
	
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CouncilTakeWeapon',
						content = ('ถูกยึด %s และ กระสุน จำนวน %s โดย %s หน่วยงาน %s'):format(label, itemCount, xPlayer.name, xPlayer.job.name),
						source = xTarget.source,
						color = 3
					})
				end)
			end
		elseif dragAction == 'put' then -- ยัด
			if itemType == 'item' then
				local label = ESX.GetItemLabel(itemName)
	
				pcall(function()
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CouncilPutItem',
						content = ('หน่วยงาน %s ยัด %s จำนวน %s ไปยัง %s'):format(xPlayer.job.name, label, itemCount, xTarget.name),
						source = xPlayer.source,
						color = 2,
						options = {
							important = (itemCount >= 500 and true)
						}
					})
	
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CouncilPutItem',
						content = ('ถูกยัด %s จำนวน %s โดย %s หน่วยงาน %s'):format(label, itemCount, xPlayer.name, xPlayer.job.name),
						source = xTarget.source,
						color = 3,
						options = {
							important = (itemCount >= 500 and true)
						}
					})
				end)
			elseif itemType == 'account' then
				local label = (ESX.GetConfig().Accounts[itemName].label or ESX.GetConfig().Accounts[itemName])
				local count = ESX.Math.GroupDigits(itemCount)
	
				pcall(function()
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CouncilPutMoney',
						content = ('หน่วยงาน %s ยัด %s จำนวน $%s ไปยัง %s'):format(xPlayer.job.name, label, count, xTarget.name),
						source = xPlayer.source,
						color = 2,
						options = {
							important = (itemCount >= 100000 and true)
						}
					})
	
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CouncilPutMoney',
						content = ('ถูกยัด %s จำนวน $%s โดย %s หน่วยงาน %s'):format(label, count, xPlayer.name, xPlayer.job.name),
						source = xTarget.source,
						color = 3,
						options = {
							important = (itemCount >= 100000 and true)
						}
					})
				end)
			elseif itemType == 'weapon' then
				local label = ESX.GetWeaponLabel(itemName)
	
				pcall(function()
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CouncilPutWeapon',
						content = ('หน่วยงาน %s ยัด %s และ กระสุน จำนวน %s ไปยัง %s'):format(xPlayer.job.name, label, itemCount, xTarget.name),
						source = xPlayer.source,
						color = 2
					})
	
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CouncilPutWeapon',
						content = ('ถูกยัด %s และ กระสุน จำนวน %s โดย %s หน่วยงาน %s'):format(label, itemCount, xPlayer.name, xPlayer.job.name),
						source = xTarget.source,
						color = 3
					})
				end)
			end
		end
	else -- ประชาชน (ปล้น)
		if dragAction == 'take' then -- ยึด
			if itemType == 'item' then
				local label = ESX.GetItemLabel(itemName)
				
				pcall(function()
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CitizenTakeItem',
						content = ('หน่วยงาน %s ยึด %s จำนวน %s จาก %s'):format(xPlayer.job.name, label, itemCount, xTarget.name),
						source = xPlayer.source,
						color = 2,
						options = {
							important = (itemCount >= 500 and true)
						}
					})
	
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CitizenTakeItem',
						content = ('ถูกยึด %s จำนวน %s โดย %s หน่วยงาน %s'):format(label, itemCount, xPlayer.name, xPlayer.job.name),
						source = xTarget.source,
						color = 3,
						options = {
							important = (itemCount >= 500 and true)
						}
					})
				end)
			elseif itemType == 'account' then
				local label = (ESX.GetConfig().Accounts[itemName].label or ESX.GetConfig().Accounts[itemName])
				local count = ESX.Math.GroupDigits(itemCount)
	
				pcall(function()
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CitizenTakeMoney',
						content = ('หน่วยงาน %s ยึด %s จำนวน $%s จาก %s'):format(xPlayer.job.name, label, count, xTarget.name),
						source = xPlayer.source,
						color = 2,
						options = {
							important = (itemCount >= 100000 and true)
						}
					})
	
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CitizenTakeMoney',
						content = ('ถูกยึด %s จำนวน $%s โดย %s หน่วยงาน %s'):format(label, count, xPlayer.name, xPlayer.job.name),
						source = xTarget.source,
						color = 3,
						options = {
							important = (itemCount >= 100000 and true)
						}
					})
				end)
			elseif itemType == 'weapon' then
				local label = ESX.GetWeaponLabel(itemName)
	
				pcall(function()
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CitizenTakeWeapon',
						content = ('หน่วยงาน %s ยึด %s และ กระสุน จำนวน %s จาก %s'):format(xPlayer.job.name, label, itemCount, xTarget.name),
						source = xPlayer.source,
						color = 2
					})
	
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CitizenTakeWeapon',
						content = ('ถูกยึด %s และ กระสุน จำนวน %s โดย %s หน่วยงาน %s'):format(label, itemCount, xPlayer.name, xPlayer.job.name),
						source = xTarget.source,
						color = 3
					})
				end)
			end
		elseif dragAction == 'put' then -- ยัด
			if itemType == 'item' then
				local label = ESX.GetItemLabel(itemName)
	
				pcall(function()
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CitizenPutItem',
						content = ('หน่วยงาน %s ยัด %s จำนวน %s ไปยัง %s'):format(xPlayer.job.name, label, itemCount, xTarget.name),
						source = xPlayer.source,
						color = 2,
						options = {
							important = (itemCount >= 500 and true)
						}
					})
	
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CitizenPutItem',
						content = ('ถูกยัด %s จำนวน %s โดย %s หน่วยงาน %s'):format(label, itemCount, xPlayer.name, xPlayer.job.name),
						source = xTarget.source,
						color = 3,
						options = {
							important = (itemCount >= 500 and true)
						}
					})
				end)
			elseif itemType == 'account' then
				local label = (ESX.GetConfig().Accounts[itemName].label or ESX.GetConfig().Accounts[itemName])
				local count = ESX.Math.GroupDigits(itemCount)
	
				pcall(function()
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CitizenPutMoney',
						content = ('หน่วยงาน %s ยัด %s จำนวน $%s ไปยัง %s'):format(xPlayer.job.name, label, count, xTarget.name),
						source = xPlayer.source,
						color = 2,
						options = {
							important = (itemCount >= 100000 and true)
						}
					})
	
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CitizenPutMoney',
						content = ('ถูกยัด %s จำนวน $%s โดย %s หน่วยงาน %s'):format(label, count, xPlayer.name, xPlayer.job.name),
						source = xTarget.source,
						color = 3,
						options = {
							important = (itemCount >= 100000 and true)
						}
					})
				end)
			elseif itemType == 'weapon' then
				local label = ESX.GetWeaponLabel(itemName)
	
				pcall(function()
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CitizenPutWeapon',
						content = ('หน่วยงาน %s ยัด %s และ กระสุน จำนวน %s ไปยัง %s'):format(xPlayer.job.name, label, itemCount, xTarget.name),
						source = xPlayer.source,
						color = 2
					})
	
					exports['azael_dc-serverlogs']:insertData({
						event = 'NC_CitizenPutWeapon',
						content = ('ถูกยัด %s และ กระสุน จำนวน %s โดย %s หน่วยงาน %s'):format(label, itemCount, xPlayer.name, xPlayer.job.name),
						source = xTarget.source,
						color = 3
					})
				end)
			end
		end
	end
end