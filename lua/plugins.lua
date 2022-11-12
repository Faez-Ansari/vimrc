vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use 'tpope/vim-surround'
  use 'jreybert/vimagit'
  use 'vimwiki/vimwiki'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'tpope/vim-commentary'
  use 'ap/vim-css-color'
  use 'junegunn/fzf.vim'
  use 'stsewd/fzf-checkout.vim'
  use 'tpope/vim-fugitive'
  use 'sbdchd/neoformat'
  use 'itchyny/vim-gitbranch'
  use 'wakatime/vim-wakatime'
  use 'pangloss/vim-javascript'
  use 'preservim/nerdcommenter'
  use 'keyvchan/vim-monokai'
  use 'ryanoasis/vim-devicons'
  use 'preservim/nerdtree'
  use 'PhilRunninger/nerdtree-visual-selection'
  use 'hankchiutw/nerdtree-ranger.vim'
  use 'navarasu/onedark.nvim'

end)
