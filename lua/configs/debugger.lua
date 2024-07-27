local dap = require "dap"

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "3030",
  executable = {
    command = "js-debug-adapter",
  },
}

for _, language in ipairs { "javascript", "typescript" } do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeExecutable = "node",
    },
  }
end
