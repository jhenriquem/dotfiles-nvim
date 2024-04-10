return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	enabled = false,
	config = function()
		local status, lualine = pcall(require, "lualine")
		if not status then
			return
		end

		lualine.setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = " " },
				disabled_filetypes = { "neo-tree", "toggleterm" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { { "branch", icon = "" } },

				lualine_c = {
					{
						"diagnostics",
						symbols = {
							error = " ",
							warn = " ",
							hint = " ",
							info = " ",
						},
					},
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					{
						"filename",
						path = 0,
						symbols = {
							modified = "●",
							readonly = "-", -- Text to show when the file is non-modifiable or readonly.
							unnamed = "No Name", -- Text to show for unnamed buffers.
							newfile = "New File", -- Text to show for newly created file before first write
						},
					},
				},
				lualine_x = {
					{
						function()
							return require("noice").api.status.command.get()
						end,
						cond = function()
							return package.loaded["noice"] and require("noice").api.status.command.has()
						end,
					},
					{
						function()
							return "  " .. require("dap").status()
						end,
						cond = function()
							return package.loaded["dap"] and require("dap").status() ~= ""
						end,
					},
					{
						"diff",
						symbols = {},
						source = function()
							local gitsigns = vim.b.gitsigns_status_dict
							if gitsigns then
								return {
									added = gitsigns.added,
									modified = gitsigns.changed,
									removed = gitsigns.removed,
								}
							end
						end,
					},
				},
				lualine_y = {
					{ "progress", separator = " ", padding = { left = 1, right = 0 } },
					{ "location", padding = { left = 0, right = 1 } },
				},
				lualine_z = {
					function()
						return " " .. os.date("%R")
					end,
				},
			},
			extensions = {},
		})
	end,
}
