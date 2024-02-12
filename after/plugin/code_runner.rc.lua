-----------------------------------
-- Code Runner
-----------------------------------
require("code_runner").setup({
	mode = "float",
	float = {
		border = "single",
	},
	filetype = {
		javascript = "node",
		typescript = "deno run",
		cs = function(...)
			local root_dir = require("lspconfig").util.root_pattern("*.csproj")(vim.loop.cwd())
			return "cd " .. root_dir .. " && dotnet run$end"
		end,
	},
})
