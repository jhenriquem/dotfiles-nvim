return {
	{ "williamboman/mason.nvim", opts = {} },
	{
		"williamboman/mason-lspconfig.nvim",
		event = "BufReadPre",
		opts = {
			ensure_installed = {
				"ts_ls",
				"gopls",
				"tailwindcss",
				"marksman",
				"emmet_ls",
				"lua_ls",
				"docker_compose_language_service",
				"dockerls",
			},
			automatic_installation = true,
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"prettier",
				"goimports",
				"gofumpt",
			},
			automatic_installation = true,
		},
	},
}
