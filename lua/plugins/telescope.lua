return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local status, telescope = pcall(require, "telescope")
		if not status then
			return
		end
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		local function telescope_buffer_dir()
			return vim.fn.expand("%:p:h")
		end

		local fb_actions = require("telescope").extensions.file_browser.actions

		telescope.setup({
			defaults = {
				mappings = {
					n = {
						["q"] = actions.close,
					},
				},
				file_ignore_patterns = { ".git\\", "node_modules" },
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = false,
					hidden = true,
				},
				buffers = {
					theme = "dropdown",
					previewer = false,
					hidden = true,
				},
				file_browser = {
					theme = "dropdown",
					previewer = false,
					hidden = true,
				},
			},
			extensions = {
				file_browser = {
					theme = "dropdown",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					mappings = {
						-- your custom insert mode mappings
						["i"] = {
							["<C-w>"] = function()
								vim.cmd("normal vbd")
							end,
						},
						["n"] = {
							-- your custom normal mode mappings
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["/"] = function()
								vim.cmd("startinsert")
							end,
							["<C-u>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_previous(prompt_bufnr)
								end
							end,
							["<C-d>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_next(prompt_bufnr)
								end
							end,
							["<PageUp>"] = actions.preview_scrolling_up,
							["<PageDown>"] = actions.preview_scrolling_down,
						},
					},
				},
			},
		})

		telescope.load_extension("file_browser")

		vim.keymap.set("n", "<space>ff", function()
			builtin.find_files({
				respect_gitignore = false,
				hidden = true,
			})
		end)

		vim.keymap.set("n", "<space>th", function()
			builtin.colorscheme()
		end)
		vim.keymap.set("n", "<space>fr", function()
			builtin.resume()
		end)

		vim.keymap.set("n", "<space>fb", function()
			builtin.buffers()
		end)
		vim.keymap.set("n", "<space>ft", function()
			builtin.help_tags()
		end)
		vim.keymap.set("n", "<space>lg", function()
			builtin.live_grep()
		end)
		vim.keymap.set("n", "<space>fd", function()
			builtin.diagnostics()
		end)

		vim.keymap.set("n", "<space>fs", function()
			telescope.extensions.file_browser.file_browser({
				path = "%:p:h",
				cwd = telescope_buffer_dir(),
				grouped = true,
				respect_gitignore = false,
				initial_mode = "normal",
			})
		end)
	end,
}
