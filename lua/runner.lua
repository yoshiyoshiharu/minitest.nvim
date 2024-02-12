local path = require('path')

local M = {}

function M.run()
  local command = "rails test "  .. path.current_path()
  print("Running " .. command)
end

return M
