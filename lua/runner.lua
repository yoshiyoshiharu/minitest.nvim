local path = require('path')

local M = {}

function M.run()
  local command = 'rails test ' .. path.relative_path_from_git_root()
  vim.api.nvim_command('split | terminal ' .. command)
end

return M
