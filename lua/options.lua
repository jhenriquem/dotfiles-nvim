require "nvchad.options"

local opt = vim.opt
-- add yours here!
opt.mouse = ""
opt.laststatus = 0
opt.cmdheight = 0
opt.scrolloff = 8

vim.o.shell = "cmd.exe"
vim.o.number = true

opt.shortmess = "ltToOCF"

vim.o.wrap = true
vim.o.breakindent = true
vim.o.smartindent = true

vim.o.timeoutlen = 250
