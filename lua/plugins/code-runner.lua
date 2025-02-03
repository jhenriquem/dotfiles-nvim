return {
	{
		"CRAG666/code_runner.nvim",
		lazy = false,
		config = function()
			require("code_runner").setup({
				mode = "float",
				term = {
					position = "vertical",
					size = 20,
				},
				float = {
					border = "rounded",
				},
				filetype = {
					go = {
						"cd $dir &&",
						"go run .",
					},
					cpp = {
						"cd $dir &&",
						"md exec && cd exec",
						"&& g++ ../$fileName -o $fileNameWithoutExt &&",
						" $fileNameWithoutExt.exe",
					},
					javascript = "node",
					cs = function(...)
						local root_dir = require("lspconfig").util.root_pattern("*.csproj")(vim.loop.cwd())
						return "cd " .. root_dir .. " && dotnet run$end"
					end,
				},
			})
			local map = vim.keymap.set

			map("n", "<space>r", "<cmd>RunCode<cr>", { desc = "Run code" })
		end,
	},
}
