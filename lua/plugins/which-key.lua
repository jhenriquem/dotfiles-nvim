return {
	{
		"folke/which-key.nvim",
		keys = { "<space>", "<c-w>", '"', "'", "`", "c", "v", "g" },
		event = "VimEnter",
		cmd = "WhichKey",
		opts = {
			delay = 0,
		},
	},
}
