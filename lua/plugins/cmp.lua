return {
	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
			},
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			-- See `:help cmp`
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },

				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),

					["<C-o>"] = cmp.mapping.confirm({ select = true }),
				}),

				formatting = {
					expandable_indicator = true,
					fields = { "kind", "abbr", "menu" },
					format = function(_, vim_item)
						vim_item.menu = vim_item.kind
						vim_item.kind = string.format("%s ", lspkind.symbol_map[vim_item.kind] or "")
						return vim_item
					end,
				},

				window = {
					completion = {
						scrollbar = false,
						scrolloff = 3,
						side_padding = 2,
					},
				},

				sources = {
					{ name = "nvim_lua" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "buffer" },
				},
			})
		end,
	},
}
