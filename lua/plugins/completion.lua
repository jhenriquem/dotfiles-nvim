return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths
			"L3MON4D3/LuaSnip", -- snippet engine
			"saadparwaiz1/cmp_luasnip", -- for autocompletion
			"rafamadriz/friendly-snippets", -- useful snippets
			"onsails/lspkind.nvim", -- vs-code like pictograms
		},
		config = function()
			require("lspconfig").clangd.setup({})
			vim.o.completeopt = "menuone,noselect"

			local lspkind = require("lspkind")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			local cmp = require("cmp")
			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
				},

				window = {
					completion = {
						scrollbar = false,
					},
					documentation = {
						border = "rounded",
					},
				},

				formatting = {
					format = lspkind.cmp_format({
						maxwidth = 30,
						ellipsis_char = "...",
						before = function(entry, vim_item)
							if vim_item.kind == "Color" and entry.completion_item.documentation then
								local _, _, r, g, b =
									string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
								if r then
									local color = string.format("%02x", r)
										.. string.format("%02x", g)
										.. string.format("%02x", b)
									local group = "Tw_" .. color
									if vim.fn.hlID(group) < 1 then
										vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
									end
									vim_item.kind = "●"
									vim_item.kind_hl_group = group
									return vim_item
								end
							end
							return vim_item
						end,
					}),
				},

				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = {
					["<C-p>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-n>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<C-o>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
				},
			})

			require("luasnip/loaders/from_vscode").load()
		end,
	},
	-- {
	-- 	"neoclide/coc.nvim",
	-- 	branch = "release",
	-- 	config = function()
	-- 		local keyset = vim.keymap.set
	--
	-- 		function _G.check_back_space()
	-- 			local col = vim.fn.col(".") - 1
	-- 			return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
	-- 		end
	--
	-- 		local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
	-- 		keyset(
	-- 			"i",
	-- 			"<C-p>",
	-- 			'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
	-- 			opts
	-- 		)
	-- 		keyset("i", "<C-n>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
	-- 		keyset(
	-- 			"i",
	-- 			"<C-o>",
	-- 			[[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
	-- 			opts
	-- 		)
	--
	-- 		local coc_status_record = {}
	--
	-- 		function coc_status_notify(msg, level)
	-- 			local notify_opts = {
	-- 				title = "LSP Status",
	-- 				timeout = 500,
	-- 				hide_from_history = true,
	-- 				on_close = reset_coc_status_record,
	-- 			}
	-- 			-- if coc_status_record is not {} then add it to notify_opts to key called "replace"
	-- 			if coc_status_record ~= {} then
	-- 				notify_opts["replace"] = coc_status_record.id
	-- 			end
	-- 			coc_status_record = vim.notify(msg, level, notify_opts)
	-- 		end
	--
	-- 		function reset_coc_status_record(window)
	-- 			coc_status_record = {}
	-- 		end
	--
	-- 		local coc_diag_record = {}
	--
	-- 		function coc_diag_notify(msg, level)
	-- 			local notify_opts = { title = "LSP Diagnostics", timeout = 500, on_close = reset_coc_diag_record }
	-- 			-- if coc_diag_record is not {} then add it to notify_opts to key called "replace"
	-- 			if coc_diag_record ~= {} then
	-- 				notify_opts["replace"] = coc_diag_record.id
	-- 			end
	-- 			coc_diag_record = vim.notify(msg, level, notify_opts)
	-- 		end
	--
	-- 		function reset_coc_diag_record(window)
	-- 			coc_diag_record = {}
	-- 		end
	--
	-- 		function StatusNotify()
	-- 			local status = vim.g.coc_status or ""
	-- 			local level = "info"
	-- 			if status == "" then
	-- 				return ""
	-- 			end
	-- 			vim.fn["coc#api#notify"](status, level)
	-- 		end
	--
	-- 		function InitCoc()
	-- 			vim.api.nvim_exec(
	-- 				"lua vim.notify('Initialized coc.nvim for LSP support', 'info', { title = 'LSP Status' })",
	-- 				false
	-- 			)
	-- 		end
	--
	-- 		-- notifications
	-- 		vim.api.nvim_exec("autocmd User CocNvimInit call v:lua.InitCoc()", false)
	-- 		vim.api.nvim_exec("autocmd User CocStatusChange call v:lua.StatusNotify()", false)
	-- 	end,
	-- },
}
