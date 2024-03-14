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
			vim.cmd([[colorscheme solarized-osaka]])
		end,
	},
}
