local colors = require('ese-colors').get_palette()

local theme = {
	normal = {
		a = { fg = colors.fg2, bg = colors.bg2, gui = 'bold' },
		c = { fg = colors.fg2, bg = colors.bg2 },
	},
	inactive = {
		a = { fg = colors.fg2, bg = colors.bg2, gui = 'bold' },
		c = { fg = colors.inactive, bg = colors.bg },
	},
}

return theme

