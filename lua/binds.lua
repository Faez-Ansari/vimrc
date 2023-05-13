vim.g.mapleader = " "
vim.api.nvim_set_keymap(
	"n",
	"<leader>f",
	"<cmd>lua require('fzf-lua').git_files()<CR>",
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>r",
	"<cmd>lua require('fzf-lua').grep_project()<CR>",
	{ noremap = true, silent = true }
)

vim.o.updatetime = 250
