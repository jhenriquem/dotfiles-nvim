local keymap = vim.jjj
keymap.set("n", "x", '"_x')

keymap.set("n", "n", ":enew<cr>: w ")

keymap.set("n", "<space>a", ":bp<cr>")
keymap.set("n", "<space>x", ":bd<cr>")
keymap.set("n", "<space>d", ":bn<cr>")

keymap.set("n", "<space>n", ":NvimTreeToggle<cr>")
keymap.set("n", "<space>e", ":NvimTreeFocus<cr>")
------

keymap.set("i", "~~", "''<Left>")
keymap.set("i", "~", "'")

keymap.set("i", "ll", "<ESC>")
keymap.set("i", "lv", "<ESC>v")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

keymap.set("i", "<C-k>", "<Up>")
keymap.set("i", "<C-l>", "<Right>")
keymap.set("i", "<C-h>", "<Left>")
keymap.set("i", "<C-j>", "<Down>")

keymap.set("i", "<Up>", "")
keymap.set("i", "<Right>", "")
keymap.set("i", "<Left>", "")
keymap.set("i", "<Down>", "")

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
