return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	cmd = "Telescope",
	keys = {
		{
			";f",
			function()
				local builtin = require("telescope.builtin")
				builtin.find_files({
					respect_gitignore = false,
					hidden = false,
				})
			end,
			desc = "Find Files",
		},
		{
			";r",
			function()
				local builtin = require("telescope.builtin")
				builtin.live_grep()
			end,
			desc = "Search for a string",
		},
		{
			"\\\\",
			function()
				local builtin = require("telescope.builtin")
				builtin.buffers()
			end,
			desc = "Lists open buffers",
		},
		{
			";;",
			function()
				local builtin = require("telescope.builtin")
				builtin.resume()
			end,
			desc = "Previous telescope picker",
		},
		{
			";d",
			function()
				local builtin = require("telescope.builtin")
				builtin.diagnostics()
			end,
			desc = "Lists Diagnostics",
		},
		{
			";gs",
			function()
				local builtin = require("telescope.builtin")
				builtin.git_status()
			end,
			desc = "Git status",
		},
		{
			";gc",
			function()
				local builtin = require("telescope.builtin")
				builtin.git_commits()
			end,
			desc = "Git commits",
		},

		{
			";s",
			function()
				local telescope = require("telescope")

				telescope.extensions.file_browser.file_browser({
					respect_gitignore = false,
					hidden = false,
				})
			end,
			desc = "Open File Browser",
		},
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				prompt_prefix = "   ",
				selection_caret = " ",
				entry_prefix = " ",
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
					},
					width = 0.87,
					height = 0.80,
				},
				mappings = {
					n = { ["q"] = require("telescope.actions").close },
				},
			},

			extensions = {
				file_browser = {
					hijack_netrw = true,
				},
			},
		})

		telescope.load_extension("file_browser")
	end,
}
