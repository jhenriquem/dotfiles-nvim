------------------------------------------
-- NVIM TREE
------------------------------------------
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
