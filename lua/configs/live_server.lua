vim.keymap.set("n", "<leader>lt", function()
  require("live-server-nvim").toggle()
end, { desc = "LiveServer Toggle" })

vim.keymap.set("n", "<leader>ls", "<cmd>LiveServerStart<cr>")
vim.keymap.set("n", "<leader>lb", "<cmd>LiveServerStop<cr>")

require("live-server-nvim").setup {
  custom = {
    "--port=8080",
    "--no-css-inject",
  },
  serverPath = vim.fn.stdpath "data" .. "/live-server/", --default
  open = "folder", -- folder|cwd     --default
}
