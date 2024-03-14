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
	-- float = false,
	virtual_text = false,
	signs = true,
	-- signs = false,
})


