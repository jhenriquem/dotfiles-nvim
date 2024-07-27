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
  },
}
