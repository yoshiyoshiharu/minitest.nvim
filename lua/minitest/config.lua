local M = {}

local default_config = {
  command = 'rails test',
}

function M.setup(user_config)
  print('aaa')
  user_config = user_config or {}
  -- M.config = vim.tbl_deep_extend('force', default_config, user_config)
end

return M
