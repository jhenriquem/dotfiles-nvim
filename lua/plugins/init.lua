return {
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  {
    "mfussenegger/nvim-dap",
    lazy = false,
    config = function()
      require "configs.debugger"
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
      require "configs.lspconfig"
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
    "CRAG666/betterTerm.nvim",
    lazy = false,
    opts = {
      position = "bot",
      size = 15,
    },
  },
  {
    "CRAG666/code_runner.nvim",
    lazy = false,
    config = function()
      require "configs.coderunner"
    end,
  },

  {
    "folke/which-key.nvim",
    enabled = false,
  },
}
