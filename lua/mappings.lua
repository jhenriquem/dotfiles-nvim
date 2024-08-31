require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", "<C-n>", "<cmd>enew <cr><cmd> w ", { desc = "Open a new file" })

map("n", ";", ":", { desc = "CMD enter command mode" })

map("i", "lk", "<ESC>")

-- Atalhos para aspas simples (c#) e aspas duplas (todo o resto)-´ ""
map("i", "~~", "''<Left>")
map("i", "´´", '""<Left>')

-- NvimTree mappings
map("n", "<space>n", "<cmd>NvimTreeToggle<cr>", { desc = "Open NvimTree" })

--Markdown Preview mappings
map("n", "<space>mp", "<cmd>MarkdownPreview<cr>")
map("n", "<space>ms", "<cmd>MarkdownPreviewStop<cr>")
map("n", "<space>mt", "<cmd>MarkdownPreviewToggle<cr>")

map("i", "<ESC>", "")

map("n", "<space>a", "<cmd>bp<cr>")
map("n", "<space>x", "<cmd>bd<cr>")
map("n", "<space>d", "<cmd>bn<cr>")

map("i", "<a-,>", "$")
map("i", "<a-.>", "%")
map("i", "<a-;>", "*")

map("v", "<c-y>", '"+y')

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Move window
map("", "<space>h", "<C-w>h")
map("", "<space>k", "<C-w>k")
map("", "<space>j", "<C-w>j")
map("", "<space>l", "<C-w>l")

-- Resize window
map("n", "<C-right>", "<C-w><")
map("n", "<C-left>", "<C-w>>")
map("n", "<C-up>", "<C-w>+")
map("n", "<C-down>", "<C-w>-")
