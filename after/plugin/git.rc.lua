------------------------------------------
-- GIT
------------------------------------------
local status, git = pcall(require, "git")
if not status then
	return
end

git.setup({
	keymaps = {
		-- Open blame window
		blame = "<Leader>gb",
		-- Open file/folder in git repository
		browse = "<Leader>go",
	},
})

local status, gitsigns = pcall(require, "gitsigns")
if not status then
	return
end

local builtin = require("telescope.builtin")

vim.keymap.set("n", ";gs", function()
	builtin.git_status()
end)

vim.keymap.set("n", ";gb", function()
	builtin.git_branches()
end)
vim.keymap.set("n", ";gc", function()
	builtin.git_commits()
end)

gitsigns.setup({})
