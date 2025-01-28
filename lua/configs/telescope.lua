require("telescope").setup {
  extensions = {
    file_browser = {
      hijack_netrw = true,
    },
  },
}

local map = vim.keymap.set

map("n", "<leader>fs", "<cmd>Telescope file_browser<cr>", { desc = "Telescope file browser" })
map("n", "<leader>fg", "<cmd>Telescope git_status<cr>", { desc = "Telescope git status" })

require("telescope").load_extension "file_browser"
