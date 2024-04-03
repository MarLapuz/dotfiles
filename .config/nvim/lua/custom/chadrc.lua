---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'catppuccin',
  Comment = {
    italic = true,
  },
  hl_override = {
    CursorLine = { bg = "#2a2e36" },
  },
  telescope = { style = "bordered" },
  statusline = {
    theme = "vscode_colored",
    separator_style = "default",
    overriden_modules = nil
  },
  tabufline = {
    show_numbers = false,
    enabled = false,
    lazyload = true,
    overriden_modules = nil
  }
}

M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

-- Add cursor line on active window
vim.cmd [[
 augroup CursorLine
   autocmd!
   autocmd WinEnter * setlocal cursorline
   autocmd WinLeave * setlocal nocursorline
 augroup END
]]


-- Disable tmux navigator when zooming the Vim pane
vim.g.tmux_navigator_disable_when_zoomed = 1


return M
