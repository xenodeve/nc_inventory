-- ████╗   ██╗   ██████╗   ██████╗  ██████╗ ██╗  ██╗ ██████╗ ██╗     █████╗  ██████╗  ██████╗ ██████╗    ██╗ --
-- ██╔██╗  ██║ ██╔═════╝   ██╔══██╗ ██╔═══╝ ██║  ██║ ██╔═══╝ ██║    ██╔══██╗ ██╔══██╗ ██╔═══╝ ██╔══██╗   ██║ --
-- ██║╚██╗ ██║ ██║         ██║  ██║ █████╗  ██║  ██║ █████╗  ██║    ██║  ██║ ██████╔╝ █████╗  ██████╔╝   ██║ --
-- ██║ ╚██╗██║ ██║         ██║  ██║ ██╔══╝  ╚██╗██╔╝ ██╔══╝  ██║    ██║  ██║ ██╔═══╝  ██╔══╝  ██╔══██╗   ╚═╝ --
-- ██║  ╚████║ ╚═██████╗   ██████╔╝ ██████╗  ╚███╔╝  ██████╗ ██████╗╚█████╔╝ ██║      ██████╗ ██║  ██║   ██╗ --
-- ╚═╝   ╚═══╝   ╚═════╝   ╚═════╝  ╚═════╝   ╚══╝   ╚═════╝ ╚═════╝ ╚════╝  ╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝ --

---------------------------------------------------
------------------ Database Keys ------------------
---------------------------------------------------

-- Function นี้จะถูกเรียกใช้งานเพื่อดึงค่ากุญแจต่างๆจาก Database (Sync Function)
-- กุญแจยานพาหนะจะมี itemType เป็น 'vehicle_key'
-- กุญแจบ้านจะมี itemType เป็น 'house_key'
Config.DatabaseLoadOwnedKeys = function(xPlayer, itemType)
	if itemType == 'vehicle_key' then
		local result = MySQL.query.await('SELECT `plate` AS `name`, `plate` AS `label` FROM `owned_vehicles` WHERE `owner` = ?', { xPlayer.identifier })
		return result			-- Function จะส่งค่า name, label กลับไป
	elseif itemType == 'house_key' then
		local result = MySQL.query.await('SELECT `id` AS `name`, `name` AS `label` FROM `owned_properties` WHERE `owner` = ?', { xPlayer.identifier })
		return result			-- Function จะส่งค่า name, label กลับไป
	end
end

-- Function นี้จะถูกเรียกใช้งานเมื่อผู้เล่นมอบกุญแจต่างๆให้ผู้อื่น (Sync Function)
-- กุญแจยานพาหนะจะมี itemName เป็นเลขทะเบียน และ itemType เป็น 'vehicle_key'
-- กุญแจบ้านจะมี itemName เป็น id และ itemType เป็น 'house_key'
Config.DatabaseGiveKey = function(xPlayer, xTarget, itemName, itemType)
	if itemType == 'vehicle_key' then
		local count = MySQL.prepare.await('UPDATE `owned_vehicles` SET `owner` = ? WHERE `owner` = ? AND `plate` = ?', { xTarget.identifier, xPlayer.identifier, itemName })
		return count > 0	-- return true หากมีการอัพเดทค่าใน Database
	elseif itemType == 'house_key' then
		local count = MySQL.prepare.await('UPDATE `owned_properties` SET `owner` = ? WHERE `owner` = ? AND `id` = ?', { xTarget.identifier, xPlayer.identifier, itemName })
		return count > 0	-- return true หากมีการอัพเดทค่าใน Database
	end
end

-- Function นี้จะถูกเรียกใช้งานเพื่อลบกุญแจต่างๆ (Sync Function)
-- กุญแจยานพาหนะจะมี itemName เป็นเลขทะเบียน และ itemType เป็น 'vehicle_key'
-- กุญแจบ้านจะมี itemName เป็น id และ itemType เป็น 'house_key'
Config.DatabaseDeleteKey = function(xPlayer, itemName, itemType)
	if itemType == 'vehicle_key' then
		local count = MySQL.prepare.await('DELETE FROM `owned_vehicles` WHERE `owner` = ? AND `plate` = ?', { xPlayer.identifier, itemName })
		return count > 0	-- return true หากมีการอัพเดทค่าใน Database
	elseif itemType == 'house_key' then
		local count = MySQL.prepare.await('DELETE FROM `owned_properties` WHERE `owner` = ? AND `id` = ?', { xPlayer.identifier, itemName })
		return count > 0	-- return true หากมีการอัพเดทค่าใน Database
	end
end


---------------------------------------------------
-------------- Database Accessories ---------------
---------------------------------------------------

-- Function นี้จะถูกเรียกใช้งานเพื่อดึงค่าเครื่องประดับจาก Database (Sync Function)
Config.DatabaseLoadOwnedAccessories = function(xPlayer)
	local result = MySQL.query.await('SELECT `skin` FROM `devil_cloth` WHERE `owner` = ?', { xPlayer.identifier })
	return result			-- Function จะส่งค่า label, type, skin กลับไป
end

-- Function นี้จะถูกเรียกใช้งานเมื่อผู้เล่นมอบเครื่องประดับต่างๆให้ผู้อื่น (Sync Function)
Config.DatabaseGiveAccessory = function(xPlayer, xTarget, itemName, optionType)
	local count = MySQL.prepare.await('UPDATE `devil_cloth` SET `owner` = ? WHERE `owner` = ?', { xTarget.identifier, xPlayer.identifier, optionType, itemName })
	return count > 0		-- return true หากมีการอัพเดทค่าใน Database
end

-- Function นี้จะถูกเรียกใช้งานเพื่อลบเครื่องประดับต่างๆ (Sync Function)
Config.DatabaseDeleteAccessory = function(xPlayer, itemName, optionType)
	local count = MySQL.prepare.await('DELETE FROM `devil_cloth` WHERE `owner` = ?', { xPlayer.identifier, optionType, itemName })
	return count > 0		-- return true หากมีการอัพเดทค่าใน Database
end