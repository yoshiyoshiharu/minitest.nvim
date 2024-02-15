local path = require('minitest.path')
local config = require('minitest.config')

local M = {}

function M.run()
  local command = config.get('command') .. ' ' .. path.current_relative_path_from_git_root()
  vim.api.nvim_command('split | terminal ' .. command)
end

return M
