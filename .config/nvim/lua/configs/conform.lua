local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { { "prettierd" } },
    html = { { "prettierd" } },
    typescript = { { "prettierd", "prettier" } },
    typescriptreact = { { "prettierd", "prettier" } },
    javascript = { { "prettierd", "prettier" } },
    javascriptreact = { { "prettierd", "prettier" } },
    ["*"] = { "codespell" },
    ["_"] = { "trim_whitespace" },
    go = { "gofumpt", "goimports-reviser", "golines" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
