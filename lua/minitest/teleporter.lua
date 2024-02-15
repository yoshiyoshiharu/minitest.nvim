local M = {}

local path = require('minitest.path')

function M.teleport_to_test_file()
  if not path.is_app_file(path.relative_path()) then
    vim.notify('Not an app file: ' .. path.relative_path())
    return
  end

  local test_file = string.gsub(path.absolute_path(), 'app/', 'test/')
  test_file = string.gsub(test_file, '.rb', '_test.rb')
  print(test_file)

  if not path.exists(test_file) then
    vim.notify('Test file does not exist: ' .. test_file)
    return
  end

  vim.cmd('find ' .. test_file)
end

function M.teleport_to_app_file()
  if not path.is_test_file(path.relative_path()) then
    vim.notify('Not a test file: ' .. path.relative_path())
    return
  end

  local app_file = string.gsub(path.absolute_path(), 'test/', 'app/')
  app_file = string.gsub(app_file, '_test.rb', '.rb')

  if not path.exists(app_file) then
    vim.notify('App file does not exist: ' .. app_file)
    return
  end

  vim.cmd('find ' .. app_file)
end

M.teleport_to_test_file()

return M
