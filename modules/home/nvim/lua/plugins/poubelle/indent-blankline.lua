return {
    "lukas-reineke/indent-blankline.nvim",
	dependencies = {"HiPhish/rainbow-delimiters.nvim"},
    config = function ()
	local highlight = {
	    "RainbowRed",
	    "RainbowYellow",
	    "RainbowBlue",
	    "RainbowOrange",
	    "RainbowGreen",
	    "RainbowViolet",
	    "RainbowCyan",
	}

	local hooks = require "ibl.hooks"
	-- create the highlight groups in the highlight setup hook, so they are reset
	-- every time the colorscheme changes
	hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#cc241d" })
	    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#d79921" })
	    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#458588" })
	    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#d65d0e" })
	    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98971a" })
	    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#b16286" })
	    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#689d6a" })
	end)

	local ibl = require"ibl"

	vim.g.rainbow_delimiters = { highlight = highlight }
	require("ibl").setup { scope = { highlight = highlight } }
	ibl.setup({
	    scope = { highlight = highlight},
	    indent = { highlight = highlight }
	})
	hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end

}
