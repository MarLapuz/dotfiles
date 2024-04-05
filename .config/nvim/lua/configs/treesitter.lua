local options = {
  ensure_installed = {
    "vim",
    "lua",
    "vimdoc",

    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",

    "yaml",
    "json",

    "markdown",
    "markdown_inline",

    "svelte",
    "prisma",
    "graphql",
    "bash",
    "dockerfile",
    "gitignore",
  },
  -- auto install above language parsers
  auto_install = true,
  -- incremental selection in visual mode
  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = "<TAB>",
      node_decremental = "<S-TAB>",
    },
  },
  -- context_commentstring = {
  --   enable = true,
  --   enable_autocmd = false,
  -- },
  markdown = {
    enable = true,
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return options
