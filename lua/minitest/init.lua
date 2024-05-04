local M = {}

local config = require("minitest.config")

function M.setup(user_config)
  config.setup(user_config)
  vim.api.nvim_command("command! MinitestRun lua require('minitest.runner.all').run()<CR>")
  vim.api.nvim_command("command! MinitestTeleport lua require('minitest.teleporter').teleport()<CR>")
end

return M
