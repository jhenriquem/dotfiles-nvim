local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Buffers
map("n", "<space>n", ":bnext<CR>", opts)
map("n", "<space>p", ":bprev<CR>", opts)
map("n", "<space>x", ":bdelete<CR>", opts)

-- Movement
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<a-,>", "0")
map("n", "<a-.>", "$")

-- Nem file
map("n", "<space>e", "<cmd>enew <cr>", { desc = "Open nem file", silent = true })

-- Comment
map("n", "<space>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<space>/", "gc", { desc = "toggle comment", remap = true })

-- ESC
map("i", "lk", "<ESC>")
map("i", "lj", "<ESC>v")

-- Characters
map("i", "<a-,>", "$")
map("i", "<a-.>", "&")
map("i", "<a-;>", "!")
map("i", ";;", "*")
map("i", ",,", "%")

map("i", "[[", function()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local line = vim.api.nvim_get_current_line()

	if col >= #line or line:sub(col + 1, col + 1):match("%s") then
		vim.api.nvim_set_current_line(line:sub(1, col) .. "()" .. line:sub(col + 1))
		vim.api.nvim_win_set_cursor(0, { row, col + 1 })
	else
		vim.api.nvim_set_current_line(line:sub(1, col) .. "(" .. line:sub(col + 1))
		vim.api.nvim_win_set_cursor(0, { row, col + 1 })
	end
end)

map("i", "]]", ")")

map("i", "~~", "''<Left>")
map("i", "´´", '""<Left>')

-- Select and copy
map("n", "<C-a>", "gg<S-v>G")
map("v", "<c-y>", '"+y')

-- Panes
map("n", "<c-h>", "<c-w>h", opts)
map("n", "<c-j>", "<c-w>j", opts)
map("n", "<c-k>", "<c-w>k", opts)
map("n", "<c-l>", "<c-w>l", opts)

-- Resize window
map("n", "<C-right>", "<C-w><")
map("n", "<C-left>", "<C-w>>")
map("n", "<C-up>", "<C-w>+")
map("n", "<C-down>", "<C-w>-")
