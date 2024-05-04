# minitest.nvim
Neovim plugin to use minitest conveniently.

## Features
- Run minitest.
- Teleport between app and test file.

## Install
With [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{
  'yoshiyoshiharu/minitest.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' }
}
```

## Commands
- `MinitestRunAll`
- `MinitestRunNearest`
- `MinitestTeleport`

## Setup
Default options.
```lua
require('minitest.nvim').setup {
  commnad = 'rails test' -- execute test command
}
```
