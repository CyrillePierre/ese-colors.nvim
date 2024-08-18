local M = {}

-- default config
M.config = {
  configure_lualine = false,
}

function M.setup(config)
  M.config = vim.tbl_deep_extend("force", M.config, config or {})

  if M.config.configure_lualine then
    require('ese-colors.statusline')
  end
end

function M.load(theme)
  if theme == 'auto' or theme == nil then
    theme = vim.o.background
  end

  vim.g.colors_name = "ese"
  vim.o.termguicolors = true

  local colors = require('ese-colors.colors.' .. theme)
  -- local colors = {}
  local highlights = require('ese-colors.highlights').get(colors)

  for group, spec in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

return M
