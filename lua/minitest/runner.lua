local path = require("minitest.path")
local config = require("minitest.config")

local M = {}

function M.run()
  local command = config.get("command") .. " " .. path.relative_path()

  local bufnr = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_open_win(bufnr, false, {
    relative='win',
    row = vim.fn.winheight(0),
    col = vim.fn.winwidth(0),
    width=100,
    height=15,
    anchor='NW',
    style='minimal'
  })

  vim.fn.jobstart(command, {
    on_stdout = function(_, data)
      vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
    end,
    on_stderr = function(_, data)
      vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
    end,
  })
end

return M
