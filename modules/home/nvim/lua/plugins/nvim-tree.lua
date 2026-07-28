vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<Enter>', { desc = 'Toggle NvimTree' })

return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup {
			on_attach = function(bufnr)
				local api = require "nvim-tree.api"

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- default mappings
				api.config.mappings.default_on_attach(bufnr)

				-- custom mappings
				vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
				vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
			end
		}
	end,
}

