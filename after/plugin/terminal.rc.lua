require("code_runner").setup {
  mode = "float",
  float = {
    border = "single",

  },
  filetype = {
    javascript = "node",
    typescript = "deno run",
    cs = function(...)
      local root_dir = require("lspconfig").util.root_pattern "*.csproj" (vim.loop.cwd())
      return "cd " .. root_dir .. " && dotnet run$end"
    end,
  },
}
-- toggleterm-config.lua

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  size = 40,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shell = 'pwsh.exe',
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "vertical",
  close_on_exit = true,
})

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
