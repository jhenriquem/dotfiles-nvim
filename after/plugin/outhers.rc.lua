------------------------------------------
-- NOTIFY
------------------------------------------
vim.notify = require("notify")
require("notify").setup({
  background_colour = "#000000",
})

------------------------------------------
-- NVIM TREE
------------------------------------------
require("nvim-tree").setup({
  view = {
    width = 25
  }
})
------------------------------------------
-- COMENT
------------------------------------------
require('Comment').setup({
  ignore = '^$',
  toggler = {
    line = 'cc',
    block = 'gcc',
  },
  opleader = {
    line = '<leader>c',
    block = '<leader>b',
  },
})
------------------------------------------
-- COLARIZER
------------------------------------------
local status, colorizer = pcall(require, "colorizer")
if (not status) then return end

colorizer.setup({
  '*',
})

------------------------------------------
-- INDENT
------------------------------------------
require("ibl").setup()

------------------------------------------
-- AUTOPAIRS
------------------------------------------
local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
  disable_filetype = { "TelescopePrompt", "vim" },
})

------------------------------------------
-- GIT
------------------------------------------
local status, git = pcall(require, "git")
if (not status) then return end

git.setup({
  keymaps = {
    -- Open blame window
    blame = "<Leader>gb",
    -- Open file/folder in git repository
    browse = "<Leader>go",
  }
})

local status, gitsigns = pcall(require, "gitsigns")
if (not status) then return end

gitsigns.setup {}

----------------------------------
-- WEB ICONS
----------------------------------
local status, icons = pcall(require, "nvim-web-devicons")
if (not status) then return end

icons.setup {
  override = {
  },
  default = true
}

---------------------------------
--- AUTOTAG
---------------------------------
local status, autotag = pcall(require, "nvim-ts-autotag")
if (not status) then return end

autotag.setup({})
