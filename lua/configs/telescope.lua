require("telescope").setup({
	extensions = {
		file_browser = {
			hijack_netrw = true,
		},
	},
})

local map = vim.keymap.set

map("n", ";f", "<cmd>Telescope find_files<CR>", { desc = "telescope find_files" })
map("n", ";l", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "\\\\", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", ";c", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", ";g", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", ";s", "<cmd>Telescope file_browser<cr>", { desc = "Telescope file browser" })

require("telescope").load_extension("file_browser")
