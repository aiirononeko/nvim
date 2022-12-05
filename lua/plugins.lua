vim.cmd[[packadd packer.nvim]]

require"packer".startup(function()
  use "wbthomason/packer.nvim"
	use "whatyouhide/vim-gotham"
	use {
  	'nvim-tree/nvim-tree.lua',
  	requires = {
    	'nvim-tree/nvim-web-devicons',
  	},
	}
end)
