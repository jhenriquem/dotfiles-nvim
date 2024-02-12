----------------------------------------------
--       LSP CONFIG
----------------------------------------------
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
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
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

local servers = { "html", "tailwindcss", "csharp_ls", "marksman", "emmet_ls", "cssls", "jsonls", "tsserver", "clangd" }

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
local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

---------------------------------
-- Mensagem flutuante
---------------------------------
vim.diagnostic.config({
	float = { source = "always", border = "single" },
	virtual_text = false,
	signs = true,
})

-- Outro tipo de Mensagem -----
-- vim.diagnostic.config({
-- virtual_text = {
-- prefix = '●'
-- },
-- update_in_insert = true,
-- float = {
-- source = "always", -- Or "if_many"
-- },
-- })

---------------------------------
-- Auto commands
---------------------------------
vim.cmd([[ autocmd! CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]])

----------------------------------------
--       LSP KIND
----------------------------------------
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
local status, lspkind = pcall(require, "lspkind")
if not status then
	return
end

lspkind.init({
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

--------------------------------------
--       LSP SAGA
--------------------------------------
local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.setup({
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

----------------------------------------
--       LSP COLORS
----------------------------------------
local status, colors = pcall(require, "lsp-colors")
if not status then
	return
end

colors.setup({
	Error = "#db4b4b",
	Warning = "#e0af68",
	Information = "#0db9d7",
	Hint = "#10B981",
})
