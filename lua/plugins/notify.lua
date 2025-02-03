return {
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				merge_duplicates = false,
				timeout = 2000,
				background_colour = "#000000",
				render = "wrapped-compact",
			})
			vim.notify = require("notify")
		end,
	},
}
