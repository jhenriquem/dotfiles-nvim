return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup()
			vim.keymap.set("n", "gh", "<cmd>Gitsigns preview_hunk<cr>")
			vim.keymap.set("n", "gp", "<cmd>Gitsigns prev_hunk<cr>")
			vim.keymap.set("n", "gn", "<cmd>Gitsigns next_hunk<cr>")
			vim.keymap.set("n", "gr", "<cmd>Gitsigns reset_hunk<cr>")

			vim.keymap.set("n", "gbr", "<cmd>Gitsigns reset_buffer<cr>")
		end,
	},
}
