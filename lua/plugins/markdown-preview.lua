return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && npm  install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
	config = function()
		local map = vim.keymap.set
		map("n", "<space>mp", "<cmd>MarkdownPreview<cr>")
		map("n", "<space>ms", "<cmd>MarkdownPreviewStop<cr>")
		map("n", "<space>mt", "<cmd>MarkdownPreviewToggle<cr>")
	end,
}
