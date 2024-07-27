require("lspsaga").setup {
  ui = {
    border = "rounded",
  },
  symbol_in_winbar = {
    enable = true,
  },
  lightbulb = {
    enable = false,
  },
  outline = {
    layout = "float",
  },
}
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<A-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "<A-k>", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
