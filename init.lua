require("plugins")
require("binds")
require("colorscheme")
require("vimset")
require("plugs")
require("nvim-ts-autotag").setup()


require("mason").setup()
require("mason-lspconfig").setup()

require("mini.pairs").setup()
require('mru_cache').setup({
  max_size = 1000,
  ignore_filetype_list = { "help" },
  ignore_regex_list = { "%.git/" }
})
