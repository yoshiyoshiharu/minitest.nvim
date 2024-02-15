local M = {}

local path = require('minitest.path')

function M.teleport_to_test_file()
  local test_file = string.gsub(path.absolute_path(), 'app/', 'test/')
  test_file = string.gsub(test_file, '.rb', '_test.rb')

  if not path.exists(test_file) then
    vim.notify('Test file does not exist: ' .. test_file)
    return
  end

  vim.cmd('find ' .. test_file)
end

function M.teleport_to_app_file()
  local app_file = string.gsub(path.absolute_path(), 'test/', 'app/')
  app_file = string.gsub(app_file, '_test.rb', '.rb')

  if not path.exists(app_file) then
    vim.notify('App file does not exist: ' .. app_file)
    return
  end

  vim.cmd('find ' .. app_file)
end

return M
