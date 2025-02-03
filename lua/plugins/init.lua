return {

	{
		"mfussenegger/nvim-dap",

		event = "VeryLazy",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"leoluz/nvim-dap-go",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("configs.debugger")
		end,
	},
	{
		"ngtuonghy/live-server-nvim",
		event = "VeryLazy",
		build = ":LiveServerInstall",
		config = function()
			require("configs.live_server")
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm  install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("configs.mason")
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		config = function()
			require("configs.noice")
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
			require("configs.conform")
		end,
	},

	{
		"nvimdev/lspsaga.nvim",
		lazy = false,
		config = function()
			require("configs.lspsaga")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lsp")
			require("configs.cmp")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		lazy = false,
		version = "*",
		config = function()
			require("configs.term")
		end,
	},
	{
		"CRAG666/code_runner.nvim",
		lazy = false,
		config = function()
			require("configs.coderunner")
		end,
	},

	{
		"b0o/incline.nvim",
		config = function()
			require("configs.incline")
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
		event = "VeryLazy",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("configs.telescope")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		enabled = true,
		config = function()
			require("configs.nvimtree")
		end,
	},
}
