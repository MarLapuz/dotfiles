-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "poimandres",

  hl_override = {
    CursorLine = { bg = "#2a2e36" },
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
  telescope = { style = "bordered" },
  statusline = {
    theme = "vscode",
    separator_style = "default",
    overriden_modules = nil,
    order = { "git", "%=", "%=", "file", "diagnostics", "%=", "%=", "cwd" }, -- customized statusline
  },
  tabufline = {
    enabled = false,
    lazyload = true,
    modules = nil,
  },
}

return M
