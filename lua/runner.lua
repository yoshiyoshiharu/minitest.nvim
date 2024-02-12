local path = require('path')

local M = {}

function M.run()
  local command = 'rails test ' .. path.relative_path_from_git_root()
  print('Running ' .. command)
  vim.api.nvim_command(command)
end

return M
