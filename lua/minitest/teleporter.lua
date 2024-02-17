local M = {}

local path = require('minitest.path')

function M.teleport()
  local function create_file(path, app_or_test)
    vim.ui.input({ prompt = 'Create ' .. app_or_test .. 'file? y/N: ' }, function(input)
      if input == 'y' then
        path.create_file(path)
        return true
      else
        return false
      end
    end)
  end

  local function teleport_to_app_file()
    local app_file = string.gsub(path.absolute_path(), 'test/', 'app/')
    app_file = string.gsub(app_file, '_test.rb', '.rb')

    if not path.exists(app_file) then
      if not create_file(app_file, 'app') then
        return
      end
    end

    path.goto_file(app_file)
  end

  local function teleport_to_test_file()
    local test_file = string.gsub(path.absolute_path(), 'app/', 'test/')
    test_file = string.gsub(test_file, '.rb', '_test.rb')

    if not path.exists(test_file) then
      if not create_file(test_file, 'test') then
        return
      end
    end

    path.goto_file(test_file)
  end

  if path.is_test_file(path.relative_path()) then
    teleport_to_app_file()
  elseif path.is_app_file(path.relative_path()) then
    teleport_to_test_file()
  else
    vim.notify('Current buffer is not a app or test file: ' .. path.relative_path())
  end
end

return M
