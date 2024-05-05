local RunnerDisplayer = {}

function RunnerDisplayer.display(command)
  local bufnr = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_open_win(bufnr, true, {
    relative = "win",
    row = vim.fn.winheight(0),
    col = vim.fn.winwidth(0),
    width = 100,
    height = 15,
    anchor = "NW",
    style = "minimal",
    border = "single",
  })

  vim.fn.termopen(command)
  vim.cmd("wincmd p")
  vim.cmd("stopinsert!")
end

return RunnerDisplayer
