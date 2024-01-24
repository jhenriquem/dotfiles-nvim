local keymap = vim.keymap
keymap.set("n", "x", '"_x')

keymap.set("n", "n", ":enew<cr>")
keymap.set("n", "w", ":w ")
keymap.set("n", "<space>q", ":q!<cr>")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

keymap.set("n", "<space>a", ":bp<cr>")
keymap.set("n", "<space>x", ":bd<cr>")
keymap.set("n", "<space>d", ":bn<cr>")

keymap.set("n", "<space>r", ":RunCode<cr>")

keymap.set("n", "\\s", ":source %<cr>")

keymap.set("v", "k", "j")
keymap.set("v", "j", "k")
keymap.set("n", "k", "j")
keymap.set("n", "j", "k")
---
keymap.set("i", "<C-j>", "<Up>")
keymap.set("i", "<C-l>", "<Right>")
keymap.set("i", "<C-h>", "<Left>")
keymap.set("i", "<C-k>", "<Down>")

keymap.set("i", "<Up>", "")
keymap.set("i", "<Right>", "")
keymap.set("i", "<Left>", "")
keymap.set("i", "<Down>", "")

-- Salve and quit file
keymap.set("n", "<space>w", ":w!<cr>")
keymap.set("n", "q", ":q<cr>")

keymap.set("n", "<space>n", ":NvimTreeToggle<cr>")

------
keymap.set("n", ";", ":")

keymap.set("i", "~~", "''<Left>")
keymap.set("i", "~", "'")

keymap.set("i", ";;", "<ESC>")
keymap.set("i", ";v", "<ESC>v")

keymap.set("i", "<A-[>", "()<Left>")
-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")

-- Move window
keymap.set("", "<space>h", "<C-w>h")
keymap.set("", "<space>k", "<C-w>k")
keymap.set("", "<space>j", "<C-w>j")
keymap.set("", "<space>l", "<C-w>l")

-- Resize window
keymap.set("n", "<C-right>", "<C-w><")
keymap.set("n", "<C-left>", "<C-w>>")
keymap.set("n", "<C-up>", "<C-w>+")
keymap.set("n", "<C-down>", "<C-w>-")
