vim.cmd("autocmd!")
vim.o.termguicolors = true

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.guicursor = "n-v-c:block,ci-i-ve:ver25,r-cr:hor20"
vim.wo.number = true
vim.opt.title = true
vim.opt.mouse = ""
vim.opt.laststatus = 0
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 0
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 100
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.opt.shell = "fish"
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
-- vim.opt.guicursor = "i:block"
-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})
vim.o.shell = "cmd.exe"
-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })
