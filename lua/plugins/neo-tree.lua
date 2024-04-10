return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<space>n", ":Neotree toggle<CR>", {})
		vim.keymap.set("n", "<space>b", ":Neotree buffers reveal float<CR>", {})
		vim.keymap.set("n", "<space>e", ":Neotree focus<cr>", {})

		require("neo-tree").setup({
			enable_diagnostics = false,
			default_components_configs = {
				window = {
					position = "left",
					width = 20,
					mapping_options = {
						noremap = true,
						nowait = true,
					},
				},
			},
		})
	end,
}
