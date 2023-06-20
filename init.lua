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

vim.cmd([[
  imap <silent><script><expr> <C-Space> copilot#Accept("\<CR>")
  let g:copilot_no_tab_map = v:true
]])

vim.cmd([[autocmd BufWritePre * :Neoformat]])
