vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set

function _G.check_back_space()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset("i", "<C-p>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<C-n>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
keyset("i", "<C-o>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

local coc_status_record = {}

function coc_status_notify(msg, level)
	local notify_opts =
		{ title = "LSP Status", timeout = 500, hide_from_history = true, on_close = reset_coc_status_record }
	-- if coc_status_record is not {} then add it to notify_opts to key called "replace"
	if coc_status_record ~= {} then
		notify_opts["replace"] = coc_status_record.id
	end
	coc_status_record = vim.notify(msg, level, notify_opts)
end

function reset_coc_status_record(window)
	coc_status_record = {}
end

local coc_diag_record = {}

function coc_diag_notify(msg, level)
	local notify_opts = { title = "LSP Diagnostics", timeout = 500, on_close = reset_coc_diag_record }
	-- if coc_diag_record is not {} then add it to notify_opts to key called "replace"
	if coc_diag_record ~= {} then
		notify_opts["replace"] = coc_diag_record.id
	end
	coc_diag_record = vim.notify(msg, level, notify_opts)
end

function reset_coc_diag_record(window)
	coc_diag_record = {}
end

function StatusNotify()
	local status = vim.g.coc_status or ""
	local level = "info"
	if status == "" then
		return ""
	end
	vim.fn["coc#api#notify"](status, level)
end

function InitCoc()
	vim.api.nvim_exec("lua vim.notify('Initialized coc.nvim for LSP support', 'info', { title = 'LSP Status' })", false)
end

-- notifications
vim.api.nvim_exec("autocmd User CocNvimInit call v:lua.InitCoc()", false)
vim.api.nvim_exec("autocmd User CocStatusChange call v:lua.StatusNotify()", false)
