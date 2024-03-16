return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{
				"onsails/lspkind-nvim",
				config = function()
					require("lspkind").init({
						mode = "symbol",
						preset = "codicons",
						symbol_map = {
							Text = "󰉿",
							Method = "󰆧",
							Function = "󰊕",
							Constructor = "",
							Field = "󰜢",
							Variable = " ",
							Class = "󰠱",
							Interface = "",
							Module = "",
							Property = "󰜢",
							Unit = "󰑭",
							Value = "󰎠",
							Enum = "",
							Keyword = "󰌋",
							Snippet = "",
							Color = "󰏘",
							File = "󰈙",
							Reference = "󰈇",
							Folder = "󰉋",
							EnumMember = "",
							Constant = "󰏿",
							Struct = "󰙅",
							Event = "",
							Operator = "󰆕",
							TypeParameter = "",
						},
					})
				end,
			},
			{
				"nvimdev/lspsaga.nvim",
				config = function()
					require("lspsaga").setup({
						ui = {
							border = "rounded",
						},
						symbol_in_winbar = {
							enable = true,
						},
						lightbulb = {
							enable = false,
						},
						outline = {
							layout = "float",
						},
					})
					local opts = { noremap = true, silent = true }
					vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
					vim.keymap.set("n", "<C-k>", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
					vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
					vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
				end,
			},
		},
		config = function()
			local status, nvim_lsp = pcall(require, "lspconfig")
			if not status then
				return
			end

			local protocol = require("vim.lsp.protocol")
			local on_attach = function(client, bufnr)
				local function buf_set_keymap(...)
					vim.api.nvim_buf_set_keymap(bufnr, ...)
				end

				local opts = { noremap = true, silent = true }
				uf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
				buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
			end

			protocol.CompletionItemKind = {
				"", -- Text
				"", -- Method
				"", -- Function
				"", -- Constructor
				"", -- Field
				"", -- Variable
				"", -- Class
				"ﰮ", -- Interface
				"", -- Module
				"", -- Property
				"", -- Unit
				"", -- Value
				"", -- Enum
				"", -- Keyword
				"﬌", -- Snippet
				"", -- Color
				"", -- File
				"", -- Reference
				"", -- Folder
				"", -- EnumMember
				"", -- Constant
				"", -- Struct
				"", -- Event
				"ﬦ", -- Operator
				"", -- TypeParameter
			}

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local servers = {
				"html",
				"tailwindcss",
				"csharp_ls",
				"marksman",
				"texlab",
				"emmet_ls",
				"cssls",
				"jsonls",
				"lua_ls",
				"tsserver",
				"clangd",
			}

			for _, lsp in ipairs(servers) do
				nvim_lsp[lsp].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end
		end,
	},

	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			require("mason-lspconfig").setup({
				automatic_installation = true,
			})

			require("mason-tool-installer").setup({
				automatic_installation = true,
				ensure_installed = {
					"prettier",
					"eslint_d",
					"stylua",
				},
			})
		end,
	},
}
