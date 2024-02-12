local M = {}

local default_config = {
  command = 'rails test',
}

M.config = {}

function M.setup(user_config)
  user_config = user_config or {}
  M.config = vim.tbl_deep_extend('force', default_config, user_config)
end

function M.get(key)
  return M.config[key]
end

return M
