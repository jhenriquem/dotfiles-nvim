require("code_runner").setup {
  mode = "float",
  term = {
    position = "vertical",
    size = 20,
  },
  float = {
    border = "rounded",
  },
  filetype = {
    cpp = {
      "cd $dir &&",
      "md exec && cd exec",
      "&& g++ ../$fileName -o $fileNameWithoutExt &&",
      " $fileNameWithoutExt.exe",
    },
    javascript = "node",
    cs = function(...)
      local root_dir = require("lspconfig").util.root_pattern "*.csproj"(vim.loop.cwd())
      return "cd " .. root_dir .. " && dotnet run$end"
    end,
  },
}
