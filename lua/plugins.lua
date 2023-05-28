vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("mbbill/undotree")

	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("saadparwaiz1/cmp_luasnip")
	use("nvim-treesitter/nvim-treesitter")
	use("windwp/nvim-ts-autotag")

	use("echasnovski/mini.nvim")
	use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP
	use("williamboman/mason.nvim")

	use("rafamadriz/friendly-snippets")
	use("L3MON4D3/LuaSnip")

	use("github/copilot.vim")
	use("aca/emmet-ls")
	use("williamboman/mason-lspconfig.nvim")
	use("tpope/vim-surround")
	use("jreybert/vimagit")
	use("vimwiki/vimwiki")
	use("vim-airline/vim-airline")
	use("vim-airline/vim-airline-themes")
	use("tpope/vim-commentary")
	use("ap/vim-css-color")
	use("junegunn/fzf.vim")
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
	use("navarasu/onedark.nvim")
	use("vwxyutarooo/nerdtree-devicons-syntax")
	use("jose-elias-alvarez/null-ls.nvim")
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-lua/plenary.nvim")
	use("kawarimidoll/mru_cache.lua")
	use({
		"ibhagwan/fzf-lua",
		-- optional for icon support
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use({
		"folke/lsp-trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
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
end)
