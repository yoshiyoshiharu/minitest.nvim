local M = {}

function M.current_path()
  return vim.api.nvim_buf_get_name(0)
end

return M
