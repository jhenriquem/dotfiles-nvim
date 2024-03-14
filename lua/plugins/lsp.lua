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

				-- See `:help vim.lsp.*` for documentation on any of the below functions
				uf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
				--buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
				buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
				--buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
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

			-- Set up completion using nvim_cmp with LSP source
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = {
				"html",
				"tailwindcss",
				"csharp_ls",
				"marksman",
				"emmet_ls",
				"cssls",
				"jsonls",
				"tsserver",
				"clangd",
			}

			for _, lsp in ipairs(servers) do
				nvim_lsp[lsp].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end

			nvim_lsp.lua_ls.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)
				end,
				settings = {
					Lua = {
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim" },
						},

						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
					},
				},
			})
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
