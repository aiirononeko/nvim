require "plugins"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.wrap = false
vim.o.signcolumn = "yes"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.api.nvim_exec("highlight SignColumn ctermbg=black", false)
vim.wo.number = true
vim.wo.cursorline = true
vim.cmd 'set clipboard+=unnamedplus'
vim.cmd("colorscheme gotham")
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "plugins.lua" },
  command = "PackerCompile",
})

require("nvim-tree").setup();
