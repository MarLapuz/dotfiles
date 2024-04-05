local M = {}
local map = vim.keymap.set
local conf = require("nvconfig").ui.lsp

M.on_attach = function(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = desc }
  end

  map("n", "gf", "<cmd>Lspsaga finder<CR>", opts "LSP show definition references")

  map("n", "gD", function()
    vim.lsp.buf.declaration()
  end, opts "LSP show declaration")

  map("n", "gd", function()
    vim.lsp.buf.definition()
  end, opts "LSP show definition")

  -- map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts "LSP hover")
  map("n", "K", function()
    vim.lsp.buf.hover()
  end, { desc = "LSP hover" })

  map("n", "gi", function()
    vim.lsp.buf.implementation()
  end, opts "LSP implementation")

  map("n", "<leader>ls", function()
    vim.lsp.buf.signature_help()
  end, opts "LSP signature help")

  map("n", "<leader>D", function()
    vim.lsp.buf.type_definition()
  end, opts "LSP definition type")

  map("n", "<leader>rn", function()
    require "nvchad.lsp.renamer"()
  end, opts "LSP rename")

  map("n", "<leader>ca", function()
    vim.lsp.buf.code_action()
  end, opts "LSP code action")

  -- map("n", "gr", function()
  --   vim.lsp.buf.references()
  -- end, opts "LSP references")

  map("n", "gr", "<cmd>Telescope lsp_references<CR>", opts "LSP references")

  map("n", "<leader>f", function()
    vim.diagnostic.open_float { border = "rounded" }
  end, opts "LSP floating diagnostic")

  map("n", "[d", function()
    vim.diagnostic.goto_prev { float = { border = "rounded" } }
  end, opts "LSP go to prev diagnostic")

  map("n", "]d", function()
    vim.diagnostic.goto_next { float = { border = "rounded" } }
  end, opts "LSP go to next diagnostic")

  map("n", "<leader>q", function()
    vim.diagnostic.setloclist()
  end, opts "LSP Diagnostic setloclist")

  map("n", "<leader>fm", function()
    require("conform").format { lsp_fallback = true }
  end, opts "LSP formatting")

  map("n", "<leader>wa", function()
    vim.lsp.buf.add_workspace_folder()
  end, opts "LSP add workspace folder")

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "LSP list workspace folders")

  map("v", "<leader>ca", function()
    vim.lsp.buf.code_action()
  end, opts "LSP code action")

  -- setup signature popup
  if conf.signature and client.server_capabilities.signatureHelpProvider then
    require("nvchad.lsp.signature").setup(client, bufnr)
  end
end
-- disable semanticTokens
M.on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

M.defaults = function()
  dofile(vim.g.base46_cache .. "lsp")
  require "nvchad.lsp"

  require("lspconfig").lua_ls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    on_init = M.on_init,

    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
            [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  }
end

M.server_config = function()
  local lspconfig = require "lspconfig"
  local servers = { "html", "cssls", "tsserver", "tailwindcss", "eslint" }

  -- lsps with default config
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = M.on_attach,
      on_init = M.on_init,
      capabilities = M.capabilities,
    }
  end
end
return M
