local M = {}

function M.absolute_path()
  return vim.api.nvim_buf_get_name(0)
end

function M.relative_path_from_git_root()
  local absolute_file_path = vim.fn.expand('%:p')
  local git_root = vim.fn.system('git rev-parse --show-toplevel')
  local relative_file_path = string.sub(absolute_file_path, string.len(git_root) + 2)

  return relative_file_path
end

return M
