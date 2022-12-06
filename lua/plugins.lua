vim.cmd[[packadd packer.nvim]]

require"packer".startup(function()
  use 'wbthomason/packer.nvim'
	use 'whatyouhide/vim-gotham'
	use {
  	'nvim-tree/nvim-tree.lua',
  	requires = {
    	'nvim-tree/nvim-web-devicons',
  	},
	}
	use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
	}
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'dcampos/nvim-snippy'
	use 'dcampos/cmp-snippy'
	use {
  	'nvim-telescope/telescope.nvim', tag = '0.1.0',
  	requires = { {'nvim-lua/plenary.nvim'} }
	}
end)
