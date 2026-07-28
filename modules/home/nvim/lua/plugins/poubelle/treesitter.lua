return{
    "nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = 'main',
    build = ":TSUpdate",
    opts = {
		ensure_installed = {'lua'},
	},
	config = function ()
		require'nvim-treesitter'.setup {
			-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
			install_dir = vim.fn.stdpath('data') .. '/site'
		}
		local languages = {}
		for key, _ in pairs(LANGUAGES) do
			table.insert(languages, key)
		end
		require'nvim-treesitter'.install(languages)
	end,
}
