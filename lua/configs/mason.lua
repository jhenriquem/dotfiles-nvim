require("mason-lspconfig").setup {
  automatic_installation = true,
}

require("mason-tool-installer").setup {
  automatic_installation = true,
  ensure_installed = {
    "prettier",
    "js-debug-adapter",
    "stylua",
  },
}
