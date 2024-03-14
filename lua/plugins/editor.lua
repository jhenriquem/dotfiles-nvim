return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
require("nvim-tree").setup({
	view = {
		width = 30,
		side = "left",

		float = {
			enable = false,
			open_win_config = {
				relative = "editor",
				border = "single",
				width = 40,
				height = 15,
				row = 1,
				col = 1,
			},
			quit_on_focus_loss = true,
		},
	},
	renderer = {
		symlink_destination = true,
		highlight_git = true,
		highlight_diagnostics = true,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "󰆤",
				modified = "●",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "󰅖",
					staged = "󰄬",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
})

    end
	},

  {
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", config = function()
require("ibl").setup()
    end }
  },
	{
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

			vim.keymap.set("n", ";f", function()
				builtin.find_files({
					-- no_ignore = true,
					respect_gitignore = false,
					hidden = true,
				})
			end)

			vim.keymap.set("n", ";c", function()
				builtin.colorscheme()
			end)
			vim.keymap.set("n", ";r", function()
				builtin.resume()
			end)
			vim.keymap.set("n", "\\\\", function()
				builtin.buffers()
			end)
			vim.keymap.set("n", ";t", function()
				builtin.help_tags()
			end)
			vim.keymap.set("n", ";;", function()
				builtin.live_grep()
			end)
			vim.keymap.set("n", ";e", function()
				builtin.diagnostics()
			end)

			vim.keymap.set("n", ";s", function()
				telescope.extensions.file_browser.file_browser({
					path = "%:p:h",
					cwd = telescope_buffer_dir(),
					grouped = true,
					respect_gitignore = false,
					initial_mode = "normal",
				})
			end)
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
  {
"mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
local lint = require("lint")

lint.linters_by_ft = {
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	svelte = { "eslint_d" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

vim.keymap.set("n", "<leader>l", function()
	lint.try_lint()
end, { desc = "Trigger linting for current file" })
  end
  },


  {
    "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,

  },
	{
		"CRAG666/code_runner.nvim",
		config = function()
			require("code_runner").setup({
				mode = "float",
				float = {
					border = "single",
				},
				filetype = {
					javascript = "node",
					typescript = "deno run",
					cs = function(...)
						local root_dir = require("lspconfig").util.root_pattern("*.csproj")(vim.loop.cwd())
						return "cd " .. root_dir .. " && dotnet run$end"
					end,
				},
			})
		end,
	},

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			local status_ok, toggleterm = pcall(require, "toggleterm")
			if not status_ok then
				return
			end

			toggleterm.setup({
				size = 40,
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				shell = "pwsh.exe",
				shade_filetypes = {},
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = "vertical",
				close_on_exit = true,
			})

			function _G.set_terminal_keymaps()
				local opts = { noremap = true }
				vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
			end

			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		end,
	},
}
