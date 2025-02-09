return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		require("fzf-lua").setup({
			files = {
				git_icons = true,
				no_ignore = true,
			},
			winopts = {
				preview = {
					layout = "horizontal",
				},
			},
		})

		local map = vim.keymap.set
		map("n", ";f", "<cmd>FzfLua files<cr>", { desc = "Search files" })
		map("n", ";b", "<cmd>FzfLua buffers<cr>", { desc = "Open buffers" })
		map("n", ";l", "<cmd>FzfLua live_grep<cr>", { desc = "Search" })

		map("n", ";d", "<cmd>FzfLua diagnostics_document<cr>", { desc = "List diagnostics" })
		map("n", ";dw", "<cmd>FzfLua diagnostics_workspace<cr>", { desc = "List diagnostics workspace" })

		map("n", ";gs", "<cmd>FzfLua git_status<cr>", { desc = "Status" })
		map("n", ";gc", "<cmd>FzfLua git_commits<cr>", { desc = "List commits" })
		map("n", ";gb", "<cmd>FzfLua git_branches<cr>", { desc = "List branches " })
	end,
}
