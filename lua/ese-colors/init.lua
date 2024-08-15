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

return M
