local path = require("minitest.path")
local config = require("minitest.config")

local M = {}

function M.run()
  local command = config.get("command") .. " " .. path.relative_path()
  vim.api.nvim_command("terminal " .. command)
end

return M
