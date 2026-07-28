LANGUAGES = {
	bash = { lsp = 'bashls', opts = {}},
	c = { lsp = 'clangd', opts = {}},
	css = { lsp = 'cssls', opts = {}},
	fish = { lsp = 'fish_lsp', opts = {}},
	html = { lsp = 'html', opts = {}},
	java = { lsp = 'jdtls', opts = {}},
	lua = { lsp = 'lua_ls', opts = {
		settings = {
			Lua = {
				runtime = {
					pathStrict = false
				}
			}
		}
	}},
	markdown = { lsp = 'marksman', opts = {}},
	nix = { lsp = 'nixd', opts = {}},
	python = { lsp = 'pylsp', opts = {}},
	rust = { lsp = 'rust_analyzer', opts = {}},
	svelte = { lsp = 'svelte', opts = {}},
}
