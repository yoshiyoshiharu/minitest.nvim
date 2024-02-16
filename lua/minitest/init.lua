local M = {}

local runner = require('minitest.runner')
local config = require('minitest.config')

function M.setup(user_config)
  config.setup(user_config)
  vim.api.nvim_command "command! MintestRun lua require('minitest.runner').run()<CR>"
  vim.api.nvim_command "command! MinitestTeleportToApp lua require('minitest.teleporter').teleport_to_app_file()<CR>"
  vim.api.nvim_command "command! MinitestTeleportToTest lua require('minitest.teleporter').teleport_to_test_file()<CR>"
end


return M
