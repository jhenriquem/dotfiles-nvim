return {
  "williamboman/mason.nvim",
dependencies = {"williamboman/mason-lspconfig.nvim","WhoIsSethDaniel/mason-tool-installer.nvim"},
cmd = { "Mason", "MasonInstall", "MasonUpdate" },
  config = function() 
 
require("mason").setup {
ui = {
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ",
    },
  },

  max_concurrent_installers = 10,
}
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
  end,
}
