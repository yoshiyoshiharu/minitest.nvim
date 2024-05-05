local pathlib = require("minitest.path")
local config = require("minitest.config")
local displayer = require("minitest.runner.displayer")
local TEST_NOT_FOUND_NUMBER = -1

local RunnerNearest = {}

local function is_test_case(line_number)
  local line_string = vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)[1]

  if line_string == nil then
    return false
  end

  return string.match(line_string, "^%s*test.+%s*") or string.match(line_string, "def test_.+")
end

local function find_nearest_test_line_number()
  local current_line_number = vim.api.nvim_win_get_cursor(0)[1]
  local final_line_number = vim.api.nvim_buf_line_count(0)

  if is_test_case(current_line_number) then
    return current_line_number
  end

  for i = 1, math.max(current_line_number - 1, final_line_number - current_line_number), 1 do
    local prev_line_number = current_line_number - i
    local next_line_number = current_line_number + i

    if is_test_case(prev_line_number) then
      return prev_line_number
    elseif is_test_case(next_line_number) then
      return next_line_number
    end
  end

  return TEST_NOT_FOUND_NUMBER
end

function RunnerNearest.run()
  if not pathlib.is_test_file(pathlib.relative_path()) then
    vim.notify("Current buffer is not a test file.")
    return
  end

  local nearest_test_line = find_nearest_test_line_number()

  if find_nearest_test_line_number() == TEST_NOT_FOUND_NUMBER then
    print("test case didn't found")
    return false
  end

  local command = config.get("command") .. " " .. pathlib.relative_path() .. ":" .. nearest_test_line

  displayer.display(command)
end

return RunnerNearest
