return {
	{
		"craftzdog/solarized-osaka.nvim",
		config = function()
			require("solarized-osaka").setup({
				transparent = true, -- Enable this to disable setting the background color
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					sidebars = "transparent", -- style for sidebars, see below
					floats = "transparent", -- style for floating windows
				},
				dim_inactive = false, -- dims inactive windows
				lualine_bold = true,
			})
			-- vim.cmd([[colorscheme solarized-osaka]])
		end,
	},
	{
		"shaunsingh/nord.nvim",
		config = function()
			vim.g.nord_contrast = true
			vim.g.nord_borders = true
			vim.g.nord_italic = true
			vim.g.nord_uniform_diff_background = true
			vim.g.nord_disable_background = true
			vim.g.nord_bold = false
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparent = true,
			})
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
