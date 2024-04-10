return {
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 2000,
			background_colour = "#000000",
			render = "wrapped-compact",
		},
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
