return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		vim.keymap.set("n", "<space>n", ":NvimTreeToggle<cr>")
		vim.keymap.set("n", "<space>e", ":NvimTreeFocus<cr>")

		require("nvim-tree").setup({
			view = {
				width = 30,
				side = "left",
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
							renamed = "~",
							untracked = "+",
							deleted = "-",
							ignored = "◌",
						},
					},
				},
			},
		})
	end,
}
