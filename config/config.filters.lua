-- ████╗   ██╗   ██████╗   ██████╗  ██████╗ ██╗  ██╗ ██████╗ ██╗     █████╗  ██████╗  ██████╗ ██████╗    ██╗ --
-- ██╔██╗  ██║ ██╔═════╝   ██╔══██╗ ██╔═══╝ ██║  ██║ ██╔═══╝ ██║    ██╔══██╗ ██╔══██╗ ██╔═══╝ ██╔══██╗   ██║ --
-- ██║╚██╗ ██║ ██║         ██║  ██║ █████╗  ██║  ██║ █████╗  ██║    ██║  ██║ ██████╔╝ █████╗  ██████╔╝   ██║ --
-- ██║ ╚██╗██║ ██║         ██║  ██║ ██╔══╝  ╚██╗██╔╝ ██╔══╝  ██║    ██║  ██║ ██╔═══╝  ██╔══╝  ██╔══██╗   ╚═╝ --
-- ██║  ╚████║ ╚═██████╗   ██████╔╝ ██████╗  ╚███╔╝  ██████╗ ██████╗╚█████╔╝ ██║      ██████╗ ██║  ██║   ██╗ --
-- ╚═╝   ╚═══╝   ╚═════╝   ╚═════╝  ╚═════╝   ╚══╝   ╚═════╝ ╚═════╝ ╚════╝  ╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝ --

-- ตั้งค่ากลับไป Filter ตั้งต้นเสมอเมื่อปิดกระเป๋า
Config.SetDefaultFilterOnCloseInventory = true

-- สามารถหา Icon ได้ที่ https://icon-sets.iconify.design/
-- หากต้องการให้ Filter ไหนเป็นค่าเริ่มต้นให้ใส่ default = true
Config.FilterIndicators = {
	{
		default = true,
		name = 'all',
		label = 'ทั้งหมด',
		icon = 'ion:grid-outline'
	},
	{
		name = 'account',
		label = 'การเงิน',
		icon = 'ion:wallet-outline'
	},
	{
		name = 'key',
		label = 'กุญแจ',
		icon = 'ion:key-outline'
	},
	{
		name = 'accessory',
		label = 'เครื่องแต่งกาย',
		icon = 'ion:shirt-outline'
	},
	{
		name = 'food',
		label = 'อาหาร',
		icon = 'ion:restaurant-outline'
	},
	{
		name = 'fashion',
		label = 'แฟชั่น',
		icon = 'ion:star-outline'
	},
	-- {
	-- 	name = 'illegal',
	-- 	label = 'ผิดกฎหมาย',
	-- 	icon = 'ion:ban'
	-- },
	{
		name = 'weapon',
		label = 'อาวุธ',
		icon = 'ion:eyedrop-outline'
	}
}

-- ใส่ค่า Filter ให้ตรงตามโหมดด้านบน โดนโหมดที่ไม่จำเป็นต้องใส่ Items ได้แก่ all, cloth
Config.FilterItems = {
	['key'] = {
		'vehicle_key',
		'house_key'
	},
	['food'] = {
		'bread',
		'water',
		'hamburger',
		'ecola',
		'sprunk',
	},
	['fashion'] = {
		'fatdragon',
		'dragon_red',
		'prop_pig',
	},
	['illegal'] = {
		'wire',
		'cement',
	}
}

-- ซ่อนสิ่งของต่างๆจากการแสดงทั้งหมด (ตามหมวดหมู่สิ่งของ)
Config.HideItemsFromAllItemListByCategory = {
	['account'] = false,
	['item'] = false,
	['weapon'] = false,
	['key'] = false,
	['accessory'] = false,
	-- Category หลักจะมีแค่นี้!
	-- *ค่าที่อยู่ใน Config.FilterItems จะเป็นแค่ Filter เท่านั้น ไม่ใช่ Category

	-- สำหรับ Custom ให้ใส่ชนิดของ Custom Item นั้นๆ
	['personal'] = false,
}

-- ซ่อนสิ่งของต่างๆจากการแสดงทั้งหมด (ตามชื่อของสิ่งของ)
Config.HideItemsFromAllItemListByName = {
	-- ['water'] = true,
	-- ['WEAPON_BAT'] = true,

}