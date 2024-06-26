local Init = {}

local config = require("minitest.config")

function Init.setup(user_config)
  config.setup(user_config)
  vim.api.nvim_command("command! MinitestRunAll lua require('minitest.runner.all').run()<CR>")
  vim.api.nvim_command("command! MinitestRunNearest lua require('minitest.runner.nearest').run()<CR>")
  vim.api.nvim_command("command! MinitestTeleport lua require('minitest.teleporter').teleport()<CR>")
end

return Init
