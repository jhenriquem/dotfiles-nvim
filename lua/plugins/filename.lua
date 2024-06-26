return {
	"b0o/incline.nvim",
	dependencies = {},
	event = "BufReadPre",
	priority = 1200,
	config = function()
		local devicons = require("nvim-web-devicons")
		local helpers = require("incline.helpers")
		require("incline").setup({
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				if filename == "" then
					filename = "[No Name]"
				end
				local ft_icon, ft_color = devicons.get_icon_color(filename)
				local function get_git_diff()
					local icons = { added = "+", modified = "~", removed = "-" }
					local signs = vim.b[props.buf].gitsigns_status_dict
					local labels = {}
					if signs == nil then
						return labels
					end
					for name, icon in pairs(icons) do
						if tonumber(signs[name]) and signs[name] > 0 then
							table.insert(labels, { icon .. signs[name] .. " ", group = "Diff" .. name })
						end
					end
					if #labels > 0 then
						table.insert(labels, { " " })
					end
					return labels
				end

				local function get_diagnostic_label()
					local icons = { error = " ", warn = " ", hint = " ", info = " " }
					local label = {}

					for severity, icon in pairs(icons) do
						local n = #vim.diagnostic.get(
							props.buf,
							{ severity = vim.diagnostic.severity[string.upper(severity)] }
						)
						if n > 0 then
							table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
						end
					end
					if #label > 0 then
						table.insert(label, { " " })
					end
					return label
				end

				local modes = {
					["n"] = { "NORMAL", "Normal" },
					["no"] = { "NORMAL (no)", "Normal" },
					["nov"] = { "NORMAL (nov)", "Normal" },
					["noV"] = { "NORMAL (noV)", "Normal" },
					["noCTRL-V"] = { "NORMAL", "Normal" },
					["niI"] = { "NORMAL i", "Normal" },
					["niR"] = { "NORMAL r", "Normal" },
					["niV"] = { "NORMAL v", "Normal" },
					["nt"] = { "NTERMINAL", "NTerminal" },
					["ntT"] = { "NTERMINAL (ntT)", "NTerminal" },

					["v"] = { "VISUAL", "Visual" },
					["vs"] = { "V-CHAR (Ctrl O)", "Visual" },
					["V"] = { "V-LINE", "Visual" },
					["Vs"] = { "V-LINE", "Visual" },
					[""] = { "V-BLOCK", "Visual" },

					["i"] = { "INSERT", "Insert" },
					["ic"] = { "INSERT (completion)", "Insert" },
					["ix"] = { "INSERT completion", "Insert" },

					["t"] = { "TERMINAL", "Terminal" },

					["R"] = { "REPLACE", "Replace" },
					["Rc"] = { "REPLACE (Rc)", "Replace" },
					["Rx"] = { "REPLACEa (Rx)", "Replace" },
					["Rv"] = { "V-REPLACE", "Replace" },
					["Rvc"] = { "V-REPLACE (Rvc)", "Replace" },
					["Rvx"] = { "V-REPLACE (Rvx)", "Replace" },

					["s"] = { "SELECT", "Select" },
					["S"] = { "S-LINE", "Select" },
					[""] = { "S-BLOCK", "Select" },
					["c"] = { "COMMAND", "Command" },
					["cv"] = { "COMMAND", "Command" },
					["ce"] = { "COMMAND", "Command" },
					["r"] = { "PROMPT", "Confirm" },
					["rm"] = { "MORE", "Confirm" },
					["r?"] = { "CONFIRM", "Confirm" },
					["x"] = { "CONFIRM", "Confirm" },
					["!"] = { "SHELL", "Terminal" },
				}

				-- function gitStatus()
				-- return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
				-- end

				-- local git_branch = vim.b[gitStatus()].gitsigns_status_dict

				return {
					{ get_diagnostic_label() },
					{ get_git_diff() },
					{ (ft_icon or ""), " ", guifg = ft_color },
					{ " " },
					{ filename .. " ", gui = vim.bo[props.buf].modified and "bold,italic" or "bold" },
					{ " ", modes[vim.api.nvim_get_mode().mode][2], " ", guifg = "#00a4f0" },
				}
			end,
		})
	end,
}
