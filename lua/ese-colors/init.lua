local M = {}

-- default config
M.config = {
  theme = "auto",  -- values: [auto, dark, light]. If "auto": use background configuration
  background = {  -- use a specific theme depending of the value of vim.o.background
    dark = "dark",
    light = "light",
  },
  configure_lualine = false,  -- use the custom configuration for lualine
}

function M.setup(config)
  M.config = vim.tbl_deep_extend("force", M.config, config or {})

  if M.config.configure_lualine then
    require('ese-colors.statusline')
  end
end

--- Get the color table depending of the specified theme.
--- If the theme is "auto" or nil, the theme is selected using the "background" variable.
--- If the theme is not specified, it uses the configured one.
--- @param theme? string
function M.get_palette(theme)
  theme = theme or M.config.theme

  if theme == 'auto' or theme == nil then
    theme = M.config.background[vim.o.background]
  end

  return require('ese-colors.colors.' .. theme)
end

--- Apply the specified colorscheme
--- If the theme is "auto" or nil, the theme is selected using the vim.o.background variable.
--- If the theme is not specified, it uses the configured one.
--- @param theme? string
function M.load(theme)
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.g.colors_name = "ese"
  vim.o.termguicolors = true

  -- local colors = {}
  local palette = M.get_palette(theme)
  local highlights = require('ese-colors.highlights').get(palette)

  for group, spec in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

return M
