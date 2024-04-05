require "nvchad.options"
local opt = vim.opt

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!

opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.autoindent = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.relativenumber = true
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

-- From Old NVIM config
opt.title = true
opt.hlsearch = false
opt.scrolloff = 10
opt.inccommand = "split"
opt.smarttab = true
opt.breakindent = true
opt.ai = true -- Auto indent
opt.si = true -- Smart indent
opt.path:append { "**" } -- Finding file - Search down into subfolder
opt.wildignore:append { "*/node_modules/*" }
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.winblend = 0
opt.wildoptions = "pum"
opt.pumblend = 5

opt.cmdheight = 0 -- more space in the neovim command line for displaying messages
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.fileencoding = "utf-8" -- the encoding written to a file

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append "unnamedplus" -- use system clipboard as default register

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.guifont = "JetBrainsMono Nerd Font:h14"

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 100

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"
