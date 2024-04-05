require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

vim.keymap.del("n", "<tab>") -- unmap tab when disabling tabufline on `chadrc.lua` file.

-- NORMAL MODE
------------------------------------------------------------------------------------------
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "x", '"_x', { desc = "delete single character without copying into register" })
map("n", "<Esc>", ":noh <CR>", { desc = "clear highlights" })
map("n", "s", "<cmd> wa <CR>", { desc = "save all file" })
map("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "copy whole file" })
map("n", "dw", 'vb"_d', { desc = "delete a word backwards" })
map("n", "<C-a>", "gg<S-v>G", { desc = "select all" })
map("n", "J", "mzJ`z", { desc = "improved `J` so that the cursor will stay" })
map("n", "E", "$%", { desc = "go to the ending bracket of a function" })
map(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "replace all text within the file that's under the cursor" }
)
map("n", "<leader>tt", function()
  require("base46").toggle_transparency()
end, { desc = "toggle transparency" })
map("n", "<CR>", "ciw", { desc = "map enter to ciw in normal mode" })

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })

-- new buffer
map("n", "<leader>b", "<cmd> enew <CR>", { desc = "new buffer" })
map("n", "<leader>ch", "<cmd> NvCheatsheet <CR>", { desc = "nvchad cheatsheet" })

-- increment/decrement numbers
-- map("n", "+", "<C-a>", { desc = "increment number" })
-- map("n", "-", "<C-x>", { desc = "decrement number" })

-- automatically center on ctrl + u or ctrl + down
map("n", "<C-d>", "<C-d>zz", { desc = "center on ctrl + d" })
map("n", "<C-u>", "<C-u>zz", { desc = "center on ctrl + u" })

-- keep search-term in the middle
map("n", "n", "nzz", { desc = "" })
map("n", "N", "Nzz", { desc = "" })

-- move to start/end of line
map("n", "H", "^", { desc = "move to start of line" })
map("n", "L", "$", { desc = "move to end of line" })

-- split window
map("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "split window equally" })
map("n", "<leader>sm", "<C-w>|", { desc = "maximize window" })
map("n", "<leader>sx", ":close<CR>", { desc = "close current split window" })

-- manage tab
map("n", "<leader>to", ":tabnew<CR>", { desc = "open new tab" })
map("n", "<leader>tx", ":bd<CR>", { desc = "close current tab" })
map("n", "<leader>tn", ":tabn<CR>", { desc = "go to next tab" })
map("n", "<leader>tp", ":tabp<CR>", { desc = "go to previous tab" })

-- move between tmux panes
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "tmux left pane" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "tmux right pane" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "tmux bottom pane" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "tmux top pane" })

------------------------------------------------------------------------------------------

-- INSERT MODE
------------------------------------------------------------------------------------------
-- go to  beginning and end
map("i", "<C-b>", "<ESC>^i", { desc = "beginning of line" })
map("i", "<C-e>", "<End>", { desc = "end of line" })

-- navigate within insert mode
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- go to normal mode
-- map("i", "jk", "<ESC>")

------------------------------------------------------------------------------------------

-- VISUAL MODE
------------------------------------------------------------------------------------------
-- move up/down
map("v", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("v", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })

-- move highlighted lines of code
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted line/s of code upward" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted line/s of code downward" })

-- stay in visual mode when changing the indent for the selection
map("v", "<", "<gv", { desc = "Move indent to the left" })
map("v", ">", ">gv", { desc = "Move indent to the right" })

-- move to start/end of line
map("v", "H", "^", { desc = "move to start of line" })
map("v", "L", "$", { desc = "move to end of line" })

-- search within visual block
map("v", "/", "<Esc>/\\%V", { desc = "search within visual block" })

------------------------------------------------------------------------------------------

-- PASTE MODE
------------------------------------------------------------------------------------------
-- move up/down
map("x", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("x", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "don't copy replaced text", silent = true })

------------------------------------------------------------------------------------------

-- NVIMTREE
------------------------------------------------------------------------------------------
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "toggle nvim tree" })

------------------------------------------------------------------------------------------

-- TELESCOPE
------------------------------------------------------------------------------------------
map("n", "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "find files" })
map("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", { desc = "find all" })
map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "live grep" })
map("n", "<leader>fc", "<cmd> Telescope grep_string <CR>", { desc = "find string under cursor" })
map("n", "<leader>fb", "<cmd> Telescope buffers <CR>", { desc = "find buffers" })
map("n", "<leader>fh", "<cmd> Telescope help_tags <CR>", { desc = "help page" })
map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", { desc = "find old files" })
map("n", "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <CR>", { desc = "find in current buffer" })
map("n", "<leader>fp", "<cmd> Telescope neovim-project discover <CR>", { desc = "find projects" })
map("n", "<leader>ma", "<cmd> Telescope marks <CR>", { desc = "telescope marks" })

map("n", "<leader>fs", function()
  require("telescope.builtin").grep_string { search = vim.fn.input "Grep > " }
end, { desc = "find string in current workign directory" })

map("n", "<leader>fd", function()
  require("telescope.builtin").diagnostics()
end, { desc = "find diagnostics" })

map("n", "<leader>f;", function()
  require("telescope.builtin").resume()
end, { desc = "resume previous search" })

-- Git
map("n", "<leader>gs", "<cmd> Telescope git_status <CR>", { desc = "git status" })

-- Theme
map("n", "<leader>th", "<cmd> Telescope themes <CR>", { desc = "nvchad themes" })

------------------------------------------------------------------------------------------
