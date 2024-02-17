local M = {}

local pathlib = require("minitest.path")

function M.teleport()
  local function create_and_goto_file(path, app_or_test)
    vim.ui.input({ prompt = "Create " .. app_or_test .. "file? y/N: " }, function(input)
      if input == "y" then
        pathlib.create_file(path)
        pathlib.goto_file(path)
      end
    end)
  end

  local function teleport_to_app_file()
    local app_file = string.gsub(pathlib.absolute_path(), "test/", "app/")
    app_file = string.gsub(app_file, "_test.rb", ".rb")

    if pathlib.exists(app_file) then
      pathlib.goto_file(app_file)
    else
      create_and_goto_file(app_file, "app")
    end
  end

  local function teleport_to_test_file()
    local test_file = string.gsub(pathlib.absolute_path(), "app/", "test/")
    test_file = string.gsub(test_file, ".rb", "_test.rb")

    if pathlib.exists(test_file) then
      pathlib.goto_file(test_file)
    else
      create_and_goto_file(test_file, "test")
    end
  end

  if pathlib.is_test_file(pathlib.relative_path()) then
    teleport_to_app_file()
  elseif pathlib.is_app_file(pathlib.relative_path()) then
    teleport_to_test_file()
  else
    vim.notify("Current buffer is not a app or test file: " .. pathlib.relative_path())
  end
end

return M
