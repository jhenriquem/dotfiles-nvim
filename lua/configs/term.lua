local toggleterm = require "toggleterm"

toggleterm.setup {
  size = 8,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shell = "pwsh.exe",
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = false,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
}

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
end

vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"
