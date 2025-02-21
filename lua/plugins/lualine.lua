local config = function()
	local lualine = require("lualine")
	local config = {
		options = {
			theme = "auto",
			component_separators = "",
			section_separators = "",
		},
		sections = {
			-- these are to remove the defaults
			lualine_a = {},
			lualine_b = {},
			lualine_c = {
				{ "mode", color = { fg = "#7AA2F7" } },
				{ "branch", icon = "", color = { fg = "#7DCFFF" } },
				{
					"filename",
					path = 1,
					symbols = {
						modified = "+", -- Text to show when the file is modified.
						unnamed = "Empty", -- Text to show for unnamed buffers.
						newfile = "Empty", -- Text to show for newly created file before first write
					},
				},
				{ "diff", symbols = { added = "+ ", modified = "~ ", removed = "- " } },
			},
			lualine_x = {
				{ "diagnostics", symbols = { error = " ", warn = " ", hint = " ", info = " " } },
				"filetype",
				{ "location", color = { fg = "#E0AF68" } },
			},
			lualine_y = {},
			lualine_z = {},
			-- These will be filled later
		},
		inactive_sections = {
			-- these are to remove the defaults
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			lualine_c = {},
			lualine_x = {},
		},
	}

	lualine.setup(config)
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = config,
}
