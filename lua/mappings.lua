require "nvchad.mappings"

-- add yours h re
local map = vim.keymap.set

-----------------
-- INSERT
map("i", "lk", "<ESC>")
map("i", "lj", "<ESC>v")

map("i", "<a-,>", "$")
map("i", "<a-.>", "&")
map("i", "<a-;>", "!")
map("i", ";;", "*")
map("i", ",,", "%")

map("i", "[[", function()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()

  if col >= #line or line:sub(col + 1, col + 1):match "%s" then
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

-----------------
-- NORMAL
-- NvimTree mappings
map("n", "<space>n", "<cmd>NvimTreeToggle<cr>", { desc = "Open NvimTree" })

-- Run code
map("n", "<space>r", "<cmd>RunCode<cr>")

------------------------------------------------

-- Movimentação na linha
map("n", "<a-,>", "0")
map("n", "<a-.>", "$")

--Markdown Preview mappings
map("n", "<space>mp", "<cmd>MarkdownPreview<cr>")
map("n", "<space>ms", "<cmd>MarkdownPreviewStop<cr>")
map("n", "<space>mt", "<cmd>MarkdownPreviewToggle<cr>")

------------------------------------------------

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<space>a", "<cmd>bp<cr>")
map("n", "<space>x", "<cmd>bd<cr>")
map("n", "<space>d", "<cmd>bn<cr>")

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

-----------------
-- VISUAL
map("v", "<c-y>", '"+y')
