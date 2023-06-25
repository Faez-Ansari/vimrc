vim.g.mapleader = " "
vim.keymap.set("n", "<leader>f", "<cmd>FzfLua mru<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>F", "<cmd>FzfLua <CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>r", "<cmd>lua require('fzf-lua').grep_project()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>,", "<cmd>e ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>s", "<cmd>so ~/.config/nvim/init.lua<CR>")

-- Key mappings
vim.api.nvim_set_keymap("n", "<leader>e", ":NERDTreeToggle % <CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>h", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>j", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>k", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>l", "<C-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "n", "nzz", { noremap = true })
vim.api.nvim_set_keymap("n", "N", "Nzz", { noremap = true })
vim.api.nvim_set_keymap("n", "c", '"_c', { noremap = true })

vim.api.nvim_set_keymap("n", "<TAB>", "%", { noremap = true })
vim.api.nvim_set_keymap("v", "<TAB>", "%", { noremap = true })
vim.api.nvim_set_keymap("o", "<TAB>", "%", { noremap = true })

vim.cmd([[
  nnoremap <TAB> %
]])

vim.api.nvim_set_keymap("n", "<leader><leader>", ":w<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>wq", ":wq<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-l>", ":bnext<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-h>", ":bprevious<cr>", { noremap = true })

-- [fzf-p] mappings
vim.api.nvim_set_keymap("n", "<leader>gs", ":Git<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gj", ":diffget //2<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gk", ":diffget //3<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gps", ":!sh ~/.scripts/origin.sh<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gpl", ":Git pull<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gc", ":GBranches<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gt", ":Git stash<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gtp", ":Git stash pop<CR>", { noremap = true })

-- Primeagen mappings
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])
