-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("plugins")
require("binds")
require("vimset")
require("nvim-ts-autotag").setup()

require("mason").setup()
require("mason-lspconfig").setup()

require("mini.pairs").setup()
