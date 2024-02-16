local M = {}

local config = require('minitest.config')

function M.setup(user_config)
  config.setup(user_config)
  vim.api.nvim_command 'command! MintestRun lua require('minitest.runner').run()<CR>'
  vim.api.nvim_command 'command! MinitestTeleport lua require('minitest.teleporter').teleport()<CR>'
end

return M
