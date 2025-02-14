return {
	{
		"rjshkhr/shadow.nvim",
		priority = 1000,
		config = function()
			vim.opt.termguicolors = true
			vim.cmd.colorscheme("shadow")
		end,
	},
	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.nord_contrast = false
			vim.g.nord_disable_background = true
			vim.g.nord_uniform_diff_background = true
			vim.g.nord_enable_sidebar_background = false

			-- require("nord").set()
			-- vim.cmd([[colorscheme nord]])
		end,
	},

	{
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		init = function()
			-- vim.cmd.colorscheme("tokyonight-night")
			-- vim.cmd.hi("Comment gui=none")
		end,
		config = function()
			require("tokyonight").setup({
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			})
		end,
	},
}
