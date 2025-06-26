local lsp = require("lsp-zero").preset({
	name = 'minimal',
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

-- Ensure these servers are installed
lsp.ensure_installed({
	'pyright',
	'gopls',
	'emmet_ls',
})

-- Configure servers
lsp.configure('pyright', {
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
			},
		},
	},
})

lsp.configure('gopls', {
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})

lsp.configure('emmet_ls', {
	filetypes = { 'html', 'css', 'scss', 'sass', 'less', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
})

lsp.setup()
