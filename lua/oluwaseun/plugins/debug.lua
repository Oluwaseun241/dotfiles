vim.fn.sign_define("DapBreakpoint", {
	text = "🔴",
	numhl = "DapBreakpoint",
})

vim.fn.sign_define("DapBreakpointCondition", {
	text = "🔴",
	linehl = "DapBreakpoint",
	numhl = "DapBreakpoint",
})

require("dap-go").setup()

local dap, dapui = require("dap"), require("dapui")

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
