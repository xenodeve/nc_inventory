-- ████╗   ██╗   ██████╗   ██████╗  ██████╗ ██╗  ██╗ ██████╗ ██╗     █████╗  ██████╗  ██████╗ ██████╗    ██╗ --
-- ██╔██╗  ██║ ██╔═════╝   ██╔══██╗ ██╔═══╝ ██║  ██║ ██╔═══╝ ██║    ██╔══██╗ ██╔══██╗ ██╔═══╝ ██╔══██╗   ██║ --
-- ██║╚██╗ ██║ ██║         ██║  ██║ █████╗  ██║  ██║ █████╗  ██║    ██║  ██║ ██████╔╝ █████╗  ██████╔╝   ██║ --
-- ██║ ╚██╗██║ ██║         ██║  ██║ ██╔══╝  ╚██╗██╔╝ ██╔══╝  ██║    ██║  ██║ ██╔═══╝  ██╔══╝  ██╔══██╗   ╚═╝ --
-- ██║  ╚████║ ╚═██████╗   ██████╔╝ ██████╗  ╚███╔╝  ██████╗ ██████╗╚█████╔╝ ██║      ██████╗ ██║  ██║   ██╗ --
-- ╚═╝   ╚═══╝   ╚═════╝   ╚═════╝  ╚═════╝   ╚══╝   ╚═════╝ ╚═════╝ ╚════╝  ╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝ --

-- ให้กระเป๋าแสดง อาวุธที่ผู้เล่นมีในฝั่ง Client (ไม่แนะนำ!! อาจส่งผลให้ Framerate กระชากได้)
Config.ShowClientWeapons = false			-- ยังอยู่ใน BETA โหมด

-- ค่าน้ำหนักเริ่มต้นของอาวุธทุกชนิด
Config.DefaultWeaponWeight = 0

-- ตั้งค่าน้ำหนักแยกของอาวุธชนิดต่างๆต่อ 1 ชิ้น (หน่วยเป็น Kg)
Config.WeaponsWeight = {
	-- ['WEAPON_POOLCUE'] = 1000,
	-- ['WEAPON_BAT'] = 1000,
	-- ['WEAPON_GOLFCLUB'] = 1000,
}

-- ความหายากเริ่มต้นของอาวุธทุกชนิด
Config.DefaultWeaponRarity = 0

-- ความหายากของอาวุธต่างๆ ** หากไม่ใส่ จะมีค่าเท่ากับ 0
Config.WeaponsRarity = {
	['WEAPON_BAT'] = 3,
	['WEAPON_POOLCUE'] = 3,
	['WEAPON_GOLFCLUB'] = 3,
	['WEAPON_MACHETE'] = 4,
	['WEAPON_BOTTLE'] = 4,
	['WEAPON_BOTTLE1'] = 1,
	['WEAPON_BOTTLE2'] = 3,
	['WEAPON_BOTTLE23'] = 4,
	['WEAPON_POOLCUELV1'] = 1,
	['WEAPON_POOLCUELV2'] = 3,
	['WEAPON_POOLCUELV2'] = 4,
}

-- ปิดกระเป๋าเมื่อใช้หยิบ/เก็บอาวุธต่างๆ
Config.CloseInventoryOnUseWeapon = {
	-- 'WEAPON_POOLCUE',
	-- 'WEAPON_BAT',
}

-- ปิดกระเป๋าเมื่อทิ้งอาวุธต่างๆ
Config.CloseInventoryOnDropWeapon = {
	-- 'WEAPON_GOLFCLUB',
}

-- Blacklist ทิ้งอาวุธ/มอบอาวุธ
Config.WeaponsActionList = {
	shortcut = {				-- การลากอาวุธเข้า Shortcuts
		type = 'blacklist',		-- ชนิดของ List ที่ต้องการ (whitelist|blacklist)
		list = {
			'GADGET_PARACHUTE',
			-- 'WEAPON_POOLCUE',
		}
	},
	use = {						-- การ "ใช้" อาวุธ
		type = 'blacklist',
		list = {
			'GADGET_PARACHUTE',
			-- 'WEAPON_POOLCUE',
		}
	},
	drop = {					-- การ "ทิ้ง" อาวุธ
		type = 'blacklist',
		list = {
			'gacha_blackmoney',
			'gacha_economy',
			'gacha_evant',
			'gacha_money',
			'WEAPON_BAT1', 
			'WEAPON_BAT2', 
			'WEAPON_BAT3', 

			'WEAPON_BAT',  
			'WEAPON_POOLCUE',  
			'WEAPON_GOLFCLUB',  
			'WEAPON_MACHETE',  
			'WEAPON_BOTTLE',  
			'WEAPON_BOTTLE1',  
			'WEAPON_BOTTLE2',  
			'WEAPON_BOTTLE2',  
			'WEAPON_POOLCUELV1',  
			'WEAPON_POOLCUELV2',  
			'WEAPON_POOLCUELV2', 
			
			'WEAPON_STUNGUN', 
			'WEAPON_NIGHTSTICK', 
			'WEAPON_PUMPSHOTGUN', 
		}
	},
	give = {					-- การ "มอบ" อาวุธ
		type = 'blacklist',
		list = {
			'WEAPON_BAT1', 
			'WEAPON_BAT2', 
			'WEAPON_BAT3', 

			'WEAPON_BAT',  
			'WEAPON_POOLCUE',  
			'WEAPON_GOLFCLUB',  
			'WEAPON_MACHETE',  
			'WEAPON_BOTTLE',  
			'WEAPON_BOTTLE1',  
			'WEAPON_BOTTLE2',  
			'WEAPON_BOTTLE2',  
			'WEAPON_POOLCUELV1',  
			'WEAPON_POOLCUELV2',  
			'WEAPON_POOLCUELV2', 
			
			'WEAPON_STUNGUN', 
			'WEAPON_NIGHTSTICK', 
			'WEAPON_PUMPSHOTGUN',
		}
	},
	search = {					-- การ "โยกย้าย" อาวุธเมื่อเปิดกระเป๋าผู้เล่น
		type = 'blacklist',
		list = {
			'WEAPON_BAT1', 
			'WEAPON_BAT2', 
			'WEAPON_BAT3', 

			'WEAPON_BAT',  
			'WEAPON_POOLCUE',  
			'WEAPON_GOLFCLUB',  
			'WEAPON_MACHETE',  
			'WEAPON_BOTTLE',  
			'WEAPON_BOTTLE1',  
			'WEAPON_BOTTLE2',  
			'WEAPON_BOTTLE2',  
			'WEAPON_POOLCUELV1',  
			'WEAPON_POOLCUELV2',  
			'WEAPON_POOLCUELV2', 
			
			
			'WEAPON_STUNGUN', 
			'WEAPON_NIGHTSTICK', 
			'WEAPON_PUMPSHOTGUN',
		}
	}
}
-- การตั้งค่า Action ต่างๆ
-- 'whitelist'	=> อาวุธต่างๆที่อยู่ใน List จะ "อนุญาต" ให้ทำการกระทำนั้นๆ
--				=> โดยที่อาวุธที่ไม่อยู่ใน List จะ "ไม่อนุญาต" ให้ทำการกระทำนั้นๆ
-- 'blacklist'	=> อาวุธต่างๆที่อยู่ใน List จะ "ไม่อนุญาต" ให้ทำการกระทำนั้นๆ
--				=> โดยที่อาวุธที่ไม่อยู่ใน List จะ "อนุญาต" ให้ทำการกระทำนั้นๆ

Config.NoAmmoWeapons = {
	'WEAPON_DAGGER',
	'WEAPON_BAT',
	'WEAPON_BOTTLE',
	'WEAPON_CROWBAR',
	'WEAPON_FLASHLIGHT',
	'WEAPON_GOLFCLUB',
	'WEAPON_HAMMER',
	'WEAPON_HATCHET',
	'WEAPON_KNUCKLE',
	'WEAPON_KNIFE',
	'WEAPON_MACHETE',
	'WEAPON_SWITCHBLADE',
	'WEAPON_NIGHTSTICK',
	'WEAPON_WRENCH',
	'WEAPON_BATTLEAXE',
	'WEAPON_POOLCUE',
	'WEAPON_STONE_HATCHET',

	'WEAPON_STUNGUN',
	'WEAPON_STUNGUN_MP',
	
	'GADGET_PARACHUTE',
}


-- Animations
Config.SkipAnimationOnUseAllWeapon = false		-- เปิด/ปิด Animation หยิบ/เก็บ อาวุธเมื่อกดใช้งานอาวุธทุกชิ้น
Config.SkipAnimationOnUseEachWeapon = {			-- เปิด/ปิด Animation หยิบ/เก็บ อาวุธเมื่อกดใช้งานอาวุธที่อยู่ในรายชื่อ
	-- 'WEAPON_BAT',
}

-- ท่า หยิบ/เก็บ อาวุธเมื่อกดใช้งานอาวุธ
Config.WeaponAnimations = {
	default = {					-- ค่าเริ่มต้น (หากไม่มีการตั้งค่าใน customs)
		put_in = {
			enable = true,
			dict = 'reaction@intimidation@1h',
			anim = 'outro',
			flag = 50,
			action_on = 1800,
			duration = 1900
		},
		take_out = {
			enable = true,
			dict = 'reaction@intimidation@1h',
			anim = 'intro',
			flag = 50,
			action_on = 800,
			duration = 2600
		}
	},
	customs = {
		['WEAPON_SWITCHBLADE'] = {
			put_in = {
				enable = true,
				dict = 'anim@melee@switchblade@holster',
				anim = 'holster',
				flag = 50,
				action_on = 1400,
				duration = 1900
			},
			take_out = {
				enable = true,
				dict = 'anim@melee@switchblade@holster',
				anim = 'unholster',
				flag = 50,
				action_on = 200,
				duration = 2000
			}
		},
	}
}