------------------------------------------
-- NOTIFY
------------------------------------------
vim.notify = require("notify")
require("notify").setup({
	background_colour = "#000000",
})

------------------------------------------
-- COMENT
------------------------------------------
require("Comment").setup({
	ignore = "^$",
	toggler = {
		line = "cc",
		block = "gcc",
	},
	opleader = {
		line = "<leader>c",
		block = "<leader>b",
	},
})
------------------------------------------
-- COLARIZER
------------------------------------------
local status, colorizer = pcall(require, "colorizer")
if not status then
	return
end

colorizer.setup({
	"*",
})

------------------------------------------
-- INDENT
------------------------------------------
require("ibl").setup()

------------------------------------------
-- AUTOPAIRS
------------------------------------------
local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
	return
end

autopairs.setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})

----------------------------------
-- WEB ICONS
----------------------------------
local status, icons = pcall(require, "nvim-web-devicons")
if not status then
	return
end

icons.setup({
	override_by_extension = {},
	default = true,
})

---------------------------------
--- AUTOTAG
---------------------------------
local status, autotag = pcall(require, "nvim-ts-autotag")
if not status then
	return
end

autotag.setup({})
