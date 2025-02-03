return {
	{
		"mfussenegger/nvim-dap",

		event = "VeryLazy",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"leoluz/nvim-dap-go",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("dapui").setup()
			require("dap-go").setup()

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end

			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			local map = vim.keymap.set

			map("n", "<space>du", "<cmd>DapUiToggle<CR>", {})
			map("n", "<space>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
			map("n", "<space>dc", dap.continue, { desc = "Debuger Continue" })
			map("n", "<space>dt", "<cmd>DapTerminate<cr>", { desc = "Debuger Terminate" })

			map("n", "<space>dgt", function()
				require("dap-go").debug_test()
			end, { desc = "Debug go test" })

			map("n", "<space>dgl", function()
				require("dap-go").debug_last()
			end, { desc = "Debug last go test" })

			vim.fn.sign_define(
				"DapBreakpoint",
				{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
		end,
	},
}
