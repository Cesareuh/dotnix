-- Load before Lazy
vim.g.mapleader = ' '

-- Enable 24-bit colors
vim.opt.termguicolors = true

-- Light or dark theme
-- vim.o.background = "dark"

-- indent options
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.linebreak = true

-- Show number of line
vim.opt.number = true
vim.opt.relativenumber = false

-- Highlight while searching word
vim.o.hlsearch = true

-- Enable cursorline
vim.o.cursorline = true

-- Keymap for navigating through windows
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')

vim.keymap.set('n', '<C-t>', ':tabnew<CR>')
vim.keymap.set('n', '<S-t>', ':tabNext<CR>')

-- Don't skip lines when same line overlap
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- Disable hlsearch
vim.keymap.set('n', '<space>h', ':noh<CR>', { silent = true , desc = 'Clear search highlight' })
