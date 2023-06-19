-- General settings
vim.opt.title = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.bg = "dark"
vim.opt.go = "a"
vim.opt.mouse = "a"
vim.opt.hlsearch = false
vim.opt.clipboard:append("unnamedplus")
vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.laststatus = 0
vim.opt.showcmd = false
vim.opt.smartcase = true
vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.opt.so = 20
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.hidden = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.lazyredraw = true
vim.opt.magic = true
vim.opt.showmode = true
vim.opt.ruler = true
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.splitbelow = true
vim.o.updatetime = 50
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Vimwiki configuration
vim.g.vimwiki_ext2syntax = {
	[".Rmd"] = "markdown",
	[".rmd"] = "markdown",
	[".md"] = "markdown",
	[".markdown"] = "markdown",
	[".mdown"] = "markdown",
}
vim.api.nvim_set_keymap("n", "<leader>v", ":VimwikiIndex", { noremap = true })
vim.g.vimwiki_list = { { path = "~/vimwiki", syntax = "markdown", ext = ".md" } }

-- Autocommands
vim.cmd("autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown")
vim.cmd("autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff")
vim.cmd("autocmd BufRead,BufNewFile *.tex set filetype=tex")

-- FZF settings
vim.g.fzf_layout = { window = { width = 0.8, height = 0.8 } }
vim.api.nvim_set_keymap("n", "<leader>b", ":Buffer<CR>", { noremap = true })
vim.g.FZF_DEFAULT_COMMAND = "rg --files"
vim.g.FZF_DEFAULT_OPTS = "-m --height 50% --border --reverse"
vim.cmd(
	'command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " .. vim.fn.shellescape(<q-args>), 1, { "options": "--delimiter : --nth 4.." }, <bang>0)'
)

-- Airline settings
vim.g.airline_extensions_tabline_enabled = 1
vim.g.airline_extensions_tabline_formatter = "unique_tail"
vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = "distinguished"

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

