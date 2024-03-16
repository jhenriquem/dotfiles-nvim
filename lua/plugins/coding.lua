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
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		config = function()
			local autopairs = require("nvim-autopairs")

			autopairs.setup({
				check_ts = true, -- enable treesitter
				ts_config = {
					lua = { "string" }, -- don't add pairs in lua string treesitter nodes
					javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
					java = false, -- don't check treesitter on java
				},
			})

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			local cmp = require("cmp")

			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			local comment = require("Comment")

			local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

			comment.setup({
				ignore = "^$",
				toggler = {
					line = "cc",
					block = "gc",
				},
				opleader = {
					line = "<leader>c",
					block = "<leader>b",
				},
				pre_hook = ts_context_commentstring.create_pre_hook(),
			})
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
}
