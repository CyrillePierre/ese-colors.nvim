--{{{ Values "
local colors = require('ese-colors').get_palette()

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}
--}}}

--{{{ Config "
local config = {
  options = {
    theme = 'ese',
		component_separators = '',
		section_separators = '',
		disabled_filetypes = {},
		globalstatus = true,
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
	tabline = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{
				'buffers',
				icons_enabled = false,
				use_mode_colors = false,
				show_filename_only = true,
				show_modified_status = true,
				buffers_color = {
					active = 'lualine_a_inactive',
					inactive = 'lualine_c_inactive',
				},
				symbols = {
					modified = '',
					alternate_file = '',
					directory = '',
				},
				max_length = function()
					return vim.o.columns
				end,
			},
		},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	extensions = {},
}

local function add_left(component)
  table.insert(config.sections.lualine_c, component)
end

local function add_right(component)
  table.insert(config.sections.lualine_x, component)
end
--}}}

--{{{ Left "

add_left{
  -- mode component
  function()
    return vim.fn.mode()
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.operator,
      i = colors.ok,
      v = colors.info,
      ['␖'] = colors.info,
      V = colors.info,
      c = colors.warn,
      no = colors.operator,
      s = colors.statement,
      S = colors.statement,
      ['␓'] = colors.statement,
      ic = colors.special,
      R = colors.structure,
      Rv = colors.structure,
      cv = colors.operator,
      ce = colors.operator,
      r = colors.constant,
      rm = colors.constant,
      ['r?'] = colors.constant,
      ['!'] = colors.operator,
      t = colors.operator,
    }
    return {fg = mode_color[vim.fn.mode()], gui = 'bold'}
  end,
  padding = {left = 1},
}

add_left{
  'branch',
  icon = '',
  color = {fg = colors.type, gui = 'bold'},
}

add_left{
  'diff',
	symbols = {added = '+', modified = '~', removed = '-'},
  diff_color = {
    added = {fg = colors.add, gui = 'bold'},
    modified = {fg = colors.change, gui = 'bold'},
    removed = {fg = colors.delete, gui = 'bold'},
  },
  cond = conditions.hide_in_width,
	padding = {left = 0},
}

add_left{
  'filename',
	path = 1,
  cond = conditions.buffer_not_empty,
}

-- mid section
add_left{
	function()
		return '%='
	end,
}

add_right{
	'filetype',
}

add_right{
  -- Lsp server name .
  function()
    local msg = 'no active lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = '󱤵',
}
--}}}

--{{{ Right "

add_right{
	function()
		if vim.v.hlsearch == 0 then
			return ''
		end
		return vim.fn.getreg('/')
	end,
	padding = {left = 1},
}

add_right{
	'searchcount',
	maxcount = 999,
	timeout = 500,
}

add_right{
	'location',
	color = {gui = 'bold'},
	padding = {left = 0},
}

add_right{
	'progress',
	padding = {left = 1},
}

add_right{
  'o:encoding',
  fmt = string.lower,
  cond = conditions.hide_in_width,
  color = {fg = colors.string, gui = 'bold'},
	padding = {left = 1},
}

add_right{
  'fileformat',
  fmt = string.lower,
  icons_enabled = true,
  color = {fg = colors.type, gui = 'bold'},
}

add_right{
  'diagnostics',
  sources = {'nvim_lsp', 'nvim_diagnostic'},
  diagnostics_color = {
    color_error = {fg = colors.error, gui = 'bold'},
    color_warn = {fg = colors.warn, gui = 'bold'},
    color_info = {fg = colors.info, gui = 'bold'},
  },
}
--}}}

require('lualine').setup(config)
