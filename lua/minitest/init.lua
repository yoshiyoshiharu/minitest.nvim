local M = {}

local runner = require('minitest.runner')
local config = require('minitest.config')

function M.setup(user_config)
  config.setup(user_config)
end

function M.exec()
  runner.run()
end

return M
