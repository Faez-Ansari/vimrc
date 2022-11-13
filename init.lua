require("plugins")
require("binds")
require("vimset")
require("options")
require("colorscheme")

require("mason").setup()
require("mason-lspconfig").setup()

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
