local pathlib = require("minitest.path")
local config = require("minitest.config")
local displayer = require("minitest.runner.displayer")

local M = {}

function M.run()
  if not pathlib.is_test_file(pathlib.relative_path()) then
    vim.notify("Current buffer is not a test file.")
    return
  end

  local command = config.get("command") .. " " .. pathlib.relative_path()

  displayer.display(command)
end

return M
