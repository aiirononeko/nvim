require 'plugins'

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ' '
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.wrap = false
vim.o.signcolumn = 'yes'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.api.nvim_exec('highlight SignColumn ctermbg=black', false)
vim.wo.number = true
vim.g.clipboard = 'clipboard'
vim.api.nvim_set_option('clipboard', 'unnamedplus')
vim.cmd('colorscheme gotham')
vim.opt.termguicolors = true
vim.opt.ambiwidth = 'single'

vim.api.nvim_set_keymap('n', '<ESC><ESC>', ':nohlsearch<CR>', {silent=true})

vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
	pattern = { '*' },
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})

require('nvim-tree').setup();

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require('mason').setup()

local nvim_lsp = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup_handlers({ function(server_name)
	local opts = {}
   opts.on_attach = function(_, bufnr)
     local bufopts = { silent = true, buffer = bufnr }
     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  	 vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
     vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, bufopts)
     vim.keymap.set('n', 'grf', vim.lsp.buf.references, bufopts)
     vim.keymap.set('n', '<space>p', vim.lsp.buf.format, bufopts)
  end
   nvim_lsp[server_name].setup(opts)
end })

local cmp = require('cmp')
cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'cmdline' },
		{ name = 'snippy' },
	},
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-l>'] = cmp.mapping.complete(),
	},
})
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'path' },
		{ name = 'cmdline' },
	},
})

require('snippy').setup({
    mappings = {
        is = {
            ['<Tab>'] = 'expand_or_advance',
            ['<S-Tab>'] = 'previous',
        },
        nx = {
            ['<leader>x'] = 'cut_text',
        },
    },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	direction = "float",
	hidden = true
})

function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
