local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy-config")

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	install = { colorscheme = { "tokyonight-night" } },
}, lazy_config)

require("configs.mappings")
require("configs.options")
