-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "ts_ls",
  "gopls",
  "tailwindcss",
  "eslint",
  "marksman",
  "emmet_ls",
  "cssls",
  "jsonls",
  "lua_ls",
  "docker_compose_language_service",
  "dockerls",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config {
  float = { source = "always", border = "rounded" },
  virtual_text = false,
  signs = true,
}

vim.cmd [[ autocmd! CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]
