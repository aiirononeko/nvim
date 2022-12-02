vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    
    use 'whatyouhide/vim-gotham'
end)

