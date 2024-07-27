local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "ts-standard" },
    javascriptreact = { "prettier" },
    typescriptreact = { "ts-standard" },
    ejs = { "prettier" },
    json = { "prettier" },
    cpp = { "clang-format" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
    async = false,
  },
}

require("conform").setup(options)
