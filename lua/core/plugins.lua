local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup({
	function(use)
		use("wbthomason/packer.nvim")

		---------------------- Dependencias ----------------------
		use("nvim-lua/plenary.nvim")

		---------------------- Auto-completar ---------------------
		use("hrsh7th/cmp-cmdline")
		use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
		use("hrsh7th/nvim-cmp") -- Completion
		use("hrsh7th/cmp-buffer")
		-- use({ "neoclide/coc.nvim", branch = "release" })

		------------------ Server Config --------------------------
		use("neovim/nvim-lspconfig") -- LSP
		use("onsails/lspkind-nvim") -- vscode-like pictograms
		use("nvimdev/lspsaga.nvim") -- LSP UIs
		use("L3MON4D3/LuaSnip")
		---------------- Formmater -------------------------------
		use({
			"stevearc/conform.nvim",
			config = function()
				require("conform").setup()
			end,
		})
		---------------- Linting --------------------------------
		use("mfussenegger/nvim-lint")
		---------------- Hightlight ------------------------------
		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				require("nvim-treesitter.install").update({ with_sync = true })
			end,
		})

		--------------- Server Installer -------------------------
		use("williamboman/mason.nvim")
		use("williamboman/mason-lspconfig.nvim")
		use("WhoIsSethDaniel/mason-tool-installer.nvim")
		------------- Terminal and Code runner -------------------
		use("CRAG666/code_runner.nvim")
		use({
			"akinsho/toggleterm.nvim",
			tag = "*",
			config = function()
				require("toggleterm").setup()
			end,
		})

		---------------- Telescope
		use("nvim-telescope/telescope.nvim")
		use("nvim-telescope/telescope-file-browser.nvim")

		--------------- Utilitarios ------------------
		use("windwp/nvim-autopairs")
		use("kyazdani42/nvim-web-devicons") -- File icons
		use("norcalli/nvim-colorizer.lua")
		use("windwp/nvim-ts-autotag")
		use({
			"numToStr/Comment.nvim",
			requires = {
				"JoosepAlviste/nvim-ts-context-commentstring",
			},
			config = function()
				require("Comment").setup()
			end,
		})
		use({
			"nvim-tree/nvim-tree.lua",
			requires = {
				"nvim-tree/nvim-web-devicons", -- optional
			},
		})

		----------- UI --------------------------
		use("rcarriga/nvim-notify")
		use("lukas-reineke/indent-blankline.nvim")
		use("nvim-lualine/lualine.nvim") -- Statusline
		use({
			"goolord/alpha-nvim",
			config = function()
				require("alpha").setup(require("alpha.themes.dashboard").config)
			end,
		})

		---------- Git --------------------------
		use("lewis6991/gitsigns.nvim")
		use("dinhhuy258/git.nvim") -- For git blame & browse

		---------- Themes ---------------------
		use("shaunsingh/nord.nvim")
		use("craftzdog/solarized-osaka.nvim")
	end,
	----------------------------------------------------------------------------------
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "double" })
			end,
		},
	},
})
