vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")
  use("mbbill/undotree")
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {                            -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  }
  use({
    "folke/lsp-trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end,
  })
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("saadparwaiz1/cmp_luasnip")
  use("nvim-treesitter/nvim-treesitter")
  use("windwp/nvim-ts-autotag")

  use("echasnovski/mini.nvim")

  use("rafamadriz/friendly-snippets")
  use("oxfist/night-owl.nvim")
  use("navarasu/onedark.nvim")

  use("aca/emmet-ls")
  use("tpope/vim-surround")
  use("jreybert/vimagit")
  use("vimwiki/vimwiki")
  use("vim-airline/vim-airline")
  use("vim-airline/vim-airline-themes")
  use("tpope/vim-commentary")
  use("ap/vim-css-color")
  use("vijaymarupudi/nvim-fzf")
  use("kkharji/sqlite.lua")
  use("stsewd/fzf-checkout.vim")
  use("tpope/vim-fugitive")
  use("sbdchd/neoformat")
  use("itchyny/vim-gitbranch")
  use("wakatime/vim-wakatime")
  use("pangloss/vim-javascript")
  use("preservim/nerdcommenter")
  use("keyvchan/vim-monokai")
  use("ryanoasis/vim-devicons")

  use("preservim/nerdtree")
  use("PhilRunninger/nerdtree-visual-selection")
  use("hankchiutw/nerdtree-ranger.vim")

  use("vwxyutarooo/nerdtree-devicons-syntax")
  use("jose-elias-alvarez/null-ls.nvim")
  use("nvim-treesitter/nvim-treesitter-context")
  use("nvim-lua/plenary.nvim")
  use({
    "ibhagwan/fzf-lua",
    -- optional for icon support
    requires = { "kyazdani42/nvim-web-devicons" },
    requries = { "vijaymarupudi/nvim-fzf" }
  })
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional
    },
    config = function()
      require("nvim-tree").setup({})
    end,
  })
  use('github/copilot.vim')
end)
