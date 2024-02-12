package.loaded['minitest.init'] = nil
package.loaded['minitest.config'] = nil
package.loaded['minitest.runner'] = nil

local minitest = require('minitest.init')
local runner = require('minitest.runner')

minitest.setup({
  command = 'docker compose exec web rails test',
})

runner.run()
