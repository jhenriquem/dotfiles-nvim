return {
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
			require("notify").setup({
				background_colour = "#000000",
			})
		end,
	},
	{
		"kyazdani42/nvim-web-devicons",
		name = "web-devicons",
		config = function()
			require("nvim-web-devicons").setup({
				override_by_extension = {},
				default = true,
			})
		end,
	},
}
