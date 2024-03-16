local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
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

vim.cmd([[ autocmd! CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]])
