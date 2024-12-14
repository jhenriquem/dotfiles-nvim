return {
  {
    "iamcco/markdown-preview.nvim",
    lazy = false,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      require "configs.mason"
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
      require "configs.noice"
    end,
  },
  { "nvzone/volt", lazy = true },
  {
    "nvzone/menu",
    lazy = true,
    config = function()
      local opts = {
        mouse = true,
        border = false,
      }
      require("menu").open(opts)
    end,
  },

  {

    "stevearc/conform.nvim",
    event = { "BufWritePre", "BufReadPre", "BufNewFile" }, -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    lazy = false,
    config = function()
      require "configs.lspsaga"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lsp"
      require "configs.cmp"
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    lazy = false,
    version = "*",
    config = function()
      require "configs.term"
    end,
  },
  {
    "CRAG666/code_runner.nvim",
    lazy = false,
    config = function()
      require "configs.coderunner"
    end,
  },

  {
    "b0o/incline.nvim",
    config = function()
      require "configs.incline"
    end,
    -- Optional: Lazy load Incline
    event = "VeryLazy",
  },
  {
    "folke/which-key.nvim",
    enabled = true,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require "configs.telescope"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    enabled = true,
  },
}
