-- ████╗   ██╗   ██████╗   ██████╗  ██████╗ ██╗  ██╗ ██████╗ ██╗     █████╗  ██████╗  ██████╗ ██████╗    ██╗ --
-- ██╔██╗  ██║ ██╔═════╝   ██╔══██╗ ██╔═══╝ ██║  ██║ ██╔═══╝ ██║    ██╔══██╗ ██╔══██╗ ██╔═══╝ ██╔══██╗   ██║ --
-- ██║╚██╗ ██║ ██║         ██║  ██║ █████╗  ██║  ██║ █████╗  ██║    ██║  ██║ ██████╔╝ █████╗  ██████╔╝   ██║ --
-- ██║ ╚██╗██║ ██║         ██║  ██║ ██╔══╝  ╚██╗██╔╝ ██╔══╝  ██║    ██║  ██║ ██╔═══╝  ██╔══╝  ██╔══██╗   ╚═╝ --
-- ██║  ╚████║ ╚═██████╗   ██████╔╝ ██████╗  ╚███╔╝  ██████╗ ██████╗╚█████╔╝ ██║      ██████╗ ██║  ██║   ██╗ --
-- ╚═╝   ╚═══╝   ╚═════╝   ╚═════╝  ╚═════╝   ╚══╝   ╚═════╝ ╚═════╝ ╚════╝  ╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝ --

-- สีต่างๆตามความหายากของสิ่งของ
-- หากใส่ background_image ค่าสี hover จะมีผลแค่ Border ตอน hover เท่านั้น!!
Config.RarityCustoms = {
	[0] = {		-- Common
		label = { r = 255, g = 255, b = 255 },
		idle = { r = 0, g = 0, b = 0 },
		hover = { r = 100, g = 100, b = 100 },
		-- background_image = './img/items_bg/common.png'
	},
	[1] = {		-- Rare
		label = { r = 60, g = 151, b = 189 },
		idle = { r = 60, g = 151, b = 189 },
		hover = { r = 60, g = 151, b = 189 },
		background_image = './img/items_bg/rare.png'
	},
	[2] = {		-- Epic
		label = { r = 170, g = 91, b = 179 },
		idle = { r = 170, g = 91, b = 179 },
		hover = { r = 170, g = 91, b = 179 },
		background_image = './img/items_bg/epic.png'
	},
	[3] = {		-- Legendary
		label = { r = 204, g = 164, b = 56 },
		idle = { r = 204, g = 164, b = 56 },
		hover = { r = 204, g = 164, b = 56 },
		background_image = './img/items_bg/legendary.png'
	},
	[4] = {		-- Immortal
		label = { r = 225, g = 71, b = 64 },
		idle = { r = 225, g = 71, b = 64 },
		hover = { r = 225, g = 71, b = 64 },
		background_image = './img/items_bg/immortal.png'
	},
	-- [5] = {		-- Mint
	-- 	label = { r = 38, g = 194, b = 157 },
	-- 	idle = { r = 38, g = 194, b = 157 },
	-- 	hover = { r = 38, g = 194, b = 157 },
	-- 	background_image = 'linear-gradient(0deg, rgba(38, 105, 89, 0.5) 0%, rgba(14, 61, 51, 0.5) 100%)'
	-- },
}

-- รูปแบบต่างๆของ background_image
-- 1: 'img/items_bg/example.png'
-- 2: './img/items_bg/example.png'
-- 3: 'nui://nc_inventory/html/img/items_bg/example.png'
-- 4: 'https://www.website.com/example.png'
-- 5: 'linear-gradient(0deg, rgba(65, 65, 65, 0.5) 0%, rgba(20, 20, 20, 0.5) 100%)'