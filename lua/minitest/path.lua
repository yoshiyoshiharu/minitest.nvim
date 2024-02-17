local M = {}

local _path = require("plenary.path")

function M.absolute_path()
  return vim.api.nvim_buf_get_name(0)
end

function M.relative_path()
  local absolute_file_path = vim.fn.expand("%:p")
  local git_root = vim.fn.system("git rev-parse --show-toplevel")
  local relative_file_path = string.sub(absolute_file_path, string.len(git_root) + 1)

  return relative_file_path
end

function M.find_test_file_from_app_file(path)
  local test_file = string.gsub(path, "app/", "test/")
  test_file = string.gsub(test_file, ".rb", "_test.rb")

  return test_file
end

function M.find_app_file_from_test_file(path)
  local file = string.gsub(path, "test/", "app/")
  file = string.gsub(file, "_test.rb", ".rb")

  return file
end

function M.exists(path)
  return _path:new(path):exists()
end

function M.create_file(path)
  return _path:new(path):touch({ parents = true })
end

function M.goto_file(path)
  vim.cmd("find " .. path)
end

function M.is_app_file(path)
  return string.match(path, "^app/.+%.rb$") ~= nil
end

function M.is_test_file(path)
  return string.match(path, "^test/.+_test%.rb$") ~= nil
end

return M
