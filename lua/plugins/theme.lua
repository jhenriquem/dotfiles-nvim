return {
	"shaunsingh/nord.nvim",
	lazy = true,
	config = function()
		vim.g.nord_contrast = true
		vim.g.nord_disable_background = true

		require("nord").load()
		vim.cmd([[colorscheme nord]])
	end,
}
